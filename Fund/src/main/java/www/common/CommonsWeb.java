package www.common;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import www.common.common.User;

@Component(value = "commonsWeb")
public class CommonsWeb {
	@Autowired(required = false)
    private HttpSession session;
    @Autowired(required = false)
    private HttpServletRequest request;

    private final String USER = "user";

    /**
     * session 정보 담기
     *
     * @param member : 사용자 정보
     */
    public void setSession(User user) {

        session.setMaxInactiveInterval(60 * 30);
        session.setAttribute(USER, user);
    }


    /**
     * session 정보 가져오기
     *
     * @return 사용자 정보 VO
     */
    public User getSession() {

    	User user = (User) session.getAttribute(USER);

        return user;
    }

    /**
     * session 삭제.
     *
     */
    public void removeSession() {

        session.invalidate();
    }

    /**
     * sessionKey에 해당하는 session 삭제.
     *
     * @param sessionKey
     */
    public void removeSession(String sessionKey) {

        session.removeAttribute(sessionKey);
    }


    /**
     *
     * 클라이언트 아이피 가져오기. PROXY SERVER 또는 LOAD BALANCER를 거쳐나온 대부분의 클라이언트IP 경우에는 CLIENT IP가 없어지는 것이 아니라 Request의 헤더에 X-FORWARDED_FOR라는 키워드로 정보를 남겨 놓음.
     *
     * @return : clientIp
     */
    public String getClientIp() {
        String clientIp = request.getHeader("HTTP_X_FORWARDED_FOR");

        if (StringUtils.isBlank(clientIp) || clientIp.equals("unknown")) {
            clientIp = request.getHeader("REMOTE_ADDR");
        }

        if (StringUtils.isBlank(clientIp) || clientIp.equals("unknown")) {
            clientIp = request.getRemoteAddr();
        }

        return clientIp;
    }


    /**
     * 이전 url 가져오기
     *
     * @return 이전 url 문자
     */
    public String getPreUrl() {

        String preUrl = "";
        String preParam = "";

        @SuppressWarnings("rawtypes")
		Enumeration param = request.getParameterNames();
        while (param.hasMoreElements()) {
            String name = (String) param.nextElement();
            String value = request.getParameter(name);
            preParam += name + "=" + value + "&";
        }
        preUrl = request.getRequestURI().toString().replaceAll("^".concat(request.getContextPath()), "");

        if (!preParam.equals("")) {
            preUrl += "?" + preParam;
        }

        return preUrl;
    }

    public String getRequestUrl() {
        return request.getRequestURL().toString();
    }

    public HttpServletRequest getRequest() {
        return request;
    }
}

