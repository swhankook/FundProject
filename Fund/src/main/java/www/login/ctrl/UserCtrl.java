package www.login.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import www.common.common.User;
import www.common.ctrl.BaseCtrl;
import www.login.service.LoginService;

@Controller
@RequestMapping("/user")
public class UserCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory
			.getLogger(UserCtrl.class);

	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/join")
	public void join(Model model, Map<String, Object> commandMap)
			throws Exception {
		model.addAttribute("test", "tttttttttt");
	}

	@RequestMapping(value = "/login")
	public void login(Model model, Map<String, Object> commandMap)
			throws Exception {
		model.addAttribute("test", "tttttttttt");
	}

	@RequestMapping(value = "/loginCheck")
	public void login(User user, HttpServletResponse response) throws Exception {
		boolean isUser = loginService.userCheck(user);
		JSONObject jsonObj = new JSONObject();
		if (!isUser) {
			jsonObj.put("status", "1");
		} else {
			loginService.userInsert(user);
			jsonObj.put("status", "0");
		}

		responseToJson(response, jsonObj);
	}

	public static void responseToJson(HttpServletResponse response,
			JSONObject retObj) {
		response.setContentType("application/json; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = null;

		try {
			out = response.getWriter();
		} catch (IOException e) {

		}

		out.write(retObj.toString());
		out.flush();
	}

	@RequestMapping(value = "/loginAccept")
	public void loginAccept(HttpServletResponse response, User user, HttpSession session)
			throws Exception {
		User loginUser = loginService.userLogin(user);

		JSONObject jsonObj = new JSONObject();
		if (loginUser == null) {
			jsonObj.put("status", "1");
		} else {
			session.setAttribute("user", user);
			jsonObj.put("status", "0");
		}

		responseToJson(response, jsonObj);
	}

	@RequestMapping(value = "/logout")
	public void logout(HttpServletResponse response, HttpSession session)
			throws Exception {
		JSONObject jsonObj = new JSONObject();
		session.isNew();
		jsonObj.put("status", "0");
		responseToJson(response, jsonObj);
	}
}