package www.sample.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.common.ctrl.BaseCtrl;

@Controller
@RequestMapping("/loan")
public class LoanCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory.getLogger(LoanCtrl.class);

    @RequestMapping(value="/list")
    public void list(Model model, Map<String,Object> commandMap) throws Exception{
    	model.addAttribute("test","tttttttttt");
    }

    @RequestMapping(value="/check")
    public void check(Model model, Map<String,Object> commandMap) throws Exception{
    	model.addAttribute("test","tttttttttt");
    }
}