package www.common.interceptor;


import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 모든 요청에 대해 분석하여 필요한 정보를 RequestInfo에 저장한다.
 *
 * @author nwkim
 * @see com.unus.common.model.RequestInfo
 */
public class RequestInterceptor extends HandlerInterceptorAdapter {
	private final Logger log = LoggerFactory.getLogger(this.getClass());

	private long startTimeMillis = 0L;
	private String requestKey;

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle
	 * (javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		setRequestInfo(request);

		startTimeMillis = System.currentTimeMillis();
		requestKey = DateFormatUtils.format(Calendar.getInstance(), "yyyyMMddHHmmssSS");

		StringBuffer logMessage = new StringBuffer();

		logMessage.append("REQ");
		logMessage.append("|").append(request.getRequestURI());
		logMessage.append("|").append(requestKey);

		log.info(logMessage.toString());

		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) throws Exception {
		int processingTime = (int) (System.currentTimeMillis() - startTimeMillis);

		StringBuffer logMessage = new StringBuffer();

		logMessage.append("RES");
		logMessage.append("|").append(request.getRequestURI());
		logMessage.append("|").append(requestKey);
		logMessage.append("|").append(processingTime).append(" ms");

		log.info(logMessage.toString());
	}

	/**
	 * 요청을 분석하여 필요한 정보를 RequestInfo에 저장한다.
	 *
	 * @param request
	 *            요청
	 */
	private void setRequestInfo(HttpServletRequest request) {
		// header 정보 저장
		// @SuppressWarnings("unchecked")
		Enumeration<String> headerNames = request.getHeaderNames();
		String headerName = null;

		Map<String, String> requestHeaders = new HashMap<String, String>();

		while (headerNames.hasMoreElements()) {
			headerName = headerNames.nextElement();

			requestHeaders.put(headerName, request.getHeader(headerName));
		}

		log.debug("# Header: " + requestHeaders.entrySet());

		// @SuppressWarnings("unchecked")
		Map<String, String[]> parameterMap = request.getParameterMap();
		Iterator<Entry<String, String[]>> iter = parameterMap.entrySet().iterator();
		Entry<String, String[]> tempEntry = null;
		String[] tempValues = null;
		StringBuffer tempBuffer = new StringBuffer();

		Map<String, String> parameterValues = new HashMap<String, String>();

		while (iter.hasNext()) {
			tempEntry = iter.next();

			if (tempEntry.getValue() != null && tempEntry.getValue().length != 0) {
				tempValues = tempEntry.getValue();

				if (tempValues.length == 1) {
					parameterValues.put(tempEntry.getKey(), tempValues[0]);
				} else {
					tempBuffer.setLength(0);

					for (int i = 0; i < tempValues.length; i++) {
						if (i == 0) {
							tempBuffer.append(tempValues[i]);
						} else {
							tempBuffer.append(",").append(tempValues[i]);
						}
					}

					parameterValues.put(tempEntry.getKey(), String.format("[%s]", tempBuffer.toString()));
				}
			}
		}

		log.debug("# Param: " + parameterValues.entrySet());
	}
}
