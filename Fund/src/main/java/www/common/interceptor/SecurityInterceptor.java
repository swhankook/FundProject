package www.common.interceptor;


import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.common.CommonsWeb;
import www.common.common.User;

import com.google.common.base.Strings;
/**
 * <pre>
 * Class Name : SecurityInterceptor.java
 * Description :
 * 로그인이 필요한 페이지에 대해 로그인 여부를 체크하여 해당 페이지로 리턴한다.
 * 로그인이 필요한 페이지에 대해 로그인이시 페이지 접근 권한여부를 체크한다.
 * </pre>
 */
public class SecurityInterceptor extends HandlerInterceptorAdapter {

    protected final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource(name = "commonsWeb")
    private CommonsWeb commons;
    private final String LOGIN_URL = "/user/login";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /* 로그인 체크 */
        User user = commons.getSession(); // 세션정보 가져오기
        if (user == null) {
            String preUrl = commons.getPreUrl();

            request.setAttribute("preUrl", preUrl);
            String ctx = Strings.nullToEmpty(request.getContextPath());
            logger.debug("context: {}", ctx);

            RequestDispatcher dispatcher = request.getRequestDispatcher(LOGIN_URL);

            dispatcher.forward(request, response);

            return false;
        }

        return true;
    }
}
