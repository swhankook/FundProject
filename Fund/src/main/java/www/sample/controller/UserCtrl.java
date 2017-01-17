package www.sample.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.common.common.User;
import www.common.ctrl.BaseCtrl;

@Controller
@RequestMapping("/user")
public class UserCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory.getLogger(UserCtrl.class);

    @RequestMapping(value="/join")
    public void join(Model model, Map<String,Object> commandMap) throws Exception{
    	model.addAttribute("test","tttttttttt");
    }

    @RequestMapping(value="/login")
    public void login(Model model, Map<String,Object> commandMap) throws Exception{
    	model.addAttribute("test","tttttttttt");
    }

    @RequestMapping(value="/loginCheck")
    public void login(Model model, User user) throws Exception{

    	model.addAttribute("test","tttttttttt");
    }
}