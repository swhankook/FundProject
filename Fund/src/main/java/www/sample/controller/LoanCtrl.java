package www.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import www.board.service.BoardService;
import www.common.CommonsWeb;
import www.common.common.CommandMap;
import www.common.common.User;
import www.common.ctrl.BaseCtrl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/loan")
public class LoanCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory.getLogger(LoanCtrl.class);

	@Resource(name = "boardService")
	private BoardService boardService;

	@Resource(name = "commonsWeb")
	private CommonsWeb commons;

	@RequestMapping(value = "/loanWrite")
	public void boardWrite(Model model, CommandMap commandMap) throws Exception {
	}

	@RequestMapping(value = "/loanDetail")
	public void openBoardDetail(Model mv, CommandMap commandMap) throws Exception {
		Map<String, Object> data = commandMap.getMap();
		logger.debug(data.get("IDX").toString());

		Map<String, Object> map = boardService.selectLoanDetail(commandMap.getMap());
		List<Map<String, Object>> list = boardService.selectSubLoanList(commandMap.getMap());

		mv.addAttribute("list", list);
		mv.addAttribute("map", map);
	}
	
	@RequestMapping(value="loanDelete")
	public ModelAndView loanDelete(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/loan/loanMyList");
	     
	    boardService.loanDelete(commandMap.getMap());
	     
	    return mv;

	}

	@RequestMapping(value = "/subLoanWrite")
	public ModelAndView subLoanWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = null;

		if (StringUtils.isNotBlank(commandMap.getMap().get("PARENT_IDX").toString())
				|| StringUtils.isNotBlank(commandMap.getMap().get("CONTENTS").toString())) {
			boardService.insertBoard(commandMap.getMap());
		}
		mv = new ModelAndView("redirect:/loan/loanDetail?IDX=" + commandMap.get("PARENT_IDX") + "&PARENT_IDX="
				+ commandMap.get("PARENT_IDX"));

		return mv;
	}

	@RequestMapping(value = "/subLoanUpdate")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = null;

		if (StringUtils.isNotBlank(commandMap.getMap().get("IDX").toString())
				|| StringUtils.isNotBlank(commandMap.getMap().get("CONTENTS").toString())) {
			boardService.updateBoard(commandMap.getMap());
		}
		mv = new ModelAndView("redirect:/loan/loanDetail?IDX=" + commandMap.get("PARENT_IDX") + "&PARENT_IDX="
				+ commandMap.get("PARENT_IDX"));

		return mv;
	}

	@RequestMapping(value = "/subLoanDelete")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/loan/loanDetail?IDX=" + commandMap.get("PARENT_IDX") + "&PARENT_IDX="
				+ commandMap.get("PARENT_IDX"));

		boardService.deleteBoard(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/loanList")
	public void loanList(Model model, CommandMap commandMap) throws Exception {
		Map<String, Object> resultMap = boardService.selectLoanList(commandMap.getMap());

		model.addAttribute("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		model.addAttribute("list", resultMap.get("result"));
	}

	@RequestMapping(value = "/loanMyList")
	public void loanMyList(Model model, CommandMap commandMap) throws Exception {
		User user = commons.getSession();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (user != null) {
			commandMap.getMap().put("USERID", user.getEmail());
			resultMap = boardService.selectLoanMyList(commandMap.getMap());
		}
		model.addAttribute("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		model.addAttribute("list", resultMap.get("result"));
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