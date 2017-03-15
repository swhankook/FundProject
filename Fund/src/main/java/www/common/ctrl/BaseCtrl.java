package www.common.ctrl;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Strings;

/**
 * <pre>
 *
 * Description : 기본 controller. 모든 controller는 이 controller를 상속받아야 한다.
 *

 */
public abstract class BaseCtrl {
	protected final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired(required = false)
	private HttpServletRequest request;

	/**
	 * 현재 요청한 url을 return url 형식으로 치환한다.
	 *
	 * @return returnUrl 문자
	 */
	public String returnStr() {
		String rtnStr = "index";
		String uriStr = request.getRequestURI().toString();

		if (!"/".equals(uriStr)) {

			String splitStr[] = {};

			if (uriStr.indexOf(".do") > -1) {
				splitStr = uriStr.split("\\.do");
			} else {
				splitStr = uriStr.split("\\.json");
			}

			if (splitStr.length > 0) {
				String str = splitStr[0].replaceAll("^".concat(Strings.nullToEmpty(request.getContextPath())), "");
				rtnStr = (str.replaceAll("/", "\\.")).replaceFirst("\\.", "");
			}
		}

		return rtnStr;
	}

	/**
	 * 기본 리턴 형식을 만든다.
	 *
	 * @param mv
	 * @return
	 */
	public ModelAndView success(ModelAndView mv) {
		mv.addObject("success", 0);

		return mv;
	}
}
