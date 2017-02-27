package www.sample.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import www.board.service.BoardService;
import www.common.common.CommandMap;
import www.common.ctrl.BaseCtrl;

@Controller
@RequestMapping("/loan")
public class LoanCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory.getLogger(LoanCtrl.class);

	@Resource(name = "boardService")
	private BoardService boardService;

    @RequestMapping(value="/list")
    public void list(Model model, Map<String,Object> commandMap) throws Exception{
    	model.addAttribute("test","tttttttttt");
    }

    @RequestMapping(value="/check")
    public void check(Model model, Map<String,Object> commandMap) throws Exception{
    	model.addAttribute("test","tttttttttt");
    }

    @RequestMapping(value = "/loanWrite")
	public void boardWrite(Model model, CommandMap commandMap) throws Exception {
	}


	@RequestMapping(value = "/loanDetail")
	public void openBoardDetail(Model mv, CommandMap commandMap) throws Exception {
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addAttribute("map", map);
	}

    @RequestMapping(value = "/subLoanWrite")
	public ModelAndView subLoanWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = null;

		if (StringUtils.isNotBlank(commandMap.getMap().get("PARENT_IDX").toString()) || StringUtils.isNotBlank(commandMap.getMap().get("CONTENTS").toString())) {
			boardService.insertBoard(commandMap.getMap());
		}
		mv = new ModelAndView("redirect:/board/loanDetial");

		return mv;
	}

    @RequestMapping(value = "/subLoanUpdate")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/loan/loanDetail");

		boardService.updateBoard(commandMap.getMap());

		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

    @RequestMapping(value = "/loanList")
	public void loanList(Model model, CommandMap commandMap) throws Exception {
		Map<String, Object> resultMap = boardService.selectLoanList(commandMap.getMap());

		model.addAttribute("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		model.addAttribute("list", resultMap.get("result"));
	}

	@RequestMapping(value = "/subLoanDelete")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/loan/loanList");

		boardService.deleteBoard(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/write")
	public ModelAndView write(CommandMap commandMap) throws Exception {
		ModelAndView mv = null;
		Map<String, Object> map = commandMap.getMap();
		String purpose = map.get("purpose").toString();
		String money = map.get("money").toString();
		String period = map.get("period").toString();
		String income = map.get("income").toString();
		String name = map.get("name").toString();
		String birthday = map.get("birthday").toString();
		String sex = map.get("sex").toString();
		String email = map.get("email").toString();
		String phone = map.get("phone").toString();
		if (StringUtils.isNotBlank(purpose) || StringUtils.isNotBlank(money) || StringUtils.isNotBlank(period)
				|| StringUtils.isNotBlank(income) || StringUtils.isNotBlank(name) || StringUtils.isNotBlank(birthday)
				|| StringUtils.isNotBlank(sex) || StringUtils.isNotBlank(email) || StringUtils.isNotBlank(phone)) {
			boardService.insertLoanBoard(commandMap.getMap());
			mv = new ModelAndView("redirect:/loan/loanList");
		} else {
			mv = new ModelAndView("redirect:/loan/loanWrite");
		}
		return mv;
	}
}