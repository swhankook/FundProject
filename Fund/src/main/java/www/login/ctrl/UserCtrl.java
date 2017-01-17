package www.login.ctrl;

import java.util.Map;

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

	@RequestMapping(value = "/loginCheck.json")
	public ModelMap login(ModelMap model, User user) throws Exception {
		boolean isUser = loginService.userCheck(user);
		if (!isUser) {
			model.addAttribute("status", "1");
		} else {
			loginService.userInsert(user);
			model.addAttribute("status", "0");
		}
		return model;
	}

	@RequestMapping(value = "/loginAccept")
	public void loginAccept(Model model, User user) throws Exception {

		model.addAttribute("test", "tttttttttt");
	}
}