package www.board.ctrl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import www.board.service.BoardService;
import www.common.common.Board;
import www.common.common.CommandMap;
import www.common.common.User;
import www.common.ctrl.BaseCtrl;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/board")
public class BoardCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory.getLogger(BoardCtrl.class);

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/boardList")
	public void boardList(Model model, CommandMap commandMap) throws Exception {
		Map<String, Object> resultMap = boardService.selectBoardList(commandMap.getMap());

		model.addAttribute("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		model.addAttribute("list", resultMap.get("result"));
	}

	@RequestMapping(value = "/boardListTest")
	public void boardListTest(Model model, CommandMap commandMap, HttpSession session) throws Exception {
		Map<String, Object> resultMap = boardService.boardList(commandMap.getMap());

		model.addAttribute("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		User user = (User) session.getAttribute("user");
		if (user == null) {
			user = new User();
			user.setEmail("admin");
		}
		List<Board> list = (List<Board>) resultMap.get("result");
		for (Board board : list) {
			if (!board.getCrea_id().equals(user.getEmail())) {
				board.setContents("비밀글입니다.");
				board.setTitle("비밀글입니다.");
			}
		}
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/boardWrite")
	public void boardWrite(Model model, CommandMap commandMap) throws Exception {
	}

	@RequestMapping(value = "/boardInsert")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = null;

		if (StringUtils.isNotBlank(commandMap.getMap().get("TITLE").toString())
				|| StringUtils.isNotBlank(commandMap.getMap().get("CONTENTS").toString())) {
			mv = new ModelAndView("redirect:/board/boardList");
			boardService.insertBoard(commandMap.getMap());
		} else {
			mv = new ModelAndView("redirect:/board/boardWrite");
		}

		return mv;
	}

	@RequestMapping(value = "/boardDetail")
	public void openBoardDetail(Model mv, CommandMap commandMap) throws Exception {
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addAttribute("map", map);
	}

	@RequestMapping(value = "/boardUpdate")
	public void openBoardUpdate(Model mv, CommandMap commandMap) throws Exception {

		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addAttribute("map", map);
	}

	@RequestMapping(value = "/updateBoard")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/boardDetail");

		boardService.updateBoard(commandMap.getMap());

		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	@RequestMapping(value = "/deleteBoard")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/boardList");

		boardService.deleteBoard(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/loan")
	public ModelAndView loanCons(CommandMap commandMap) throws Exception {
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
			mv = new ModelAndView("redirect:/board/loanList");
		} else {
			mv = new ModelAndView("redirect:/board/boardWrite");
		}
		return mv;
	}

	@RequestMapping(value = "/loanList")
	public void loanList(Model model, CommandMap commandMap) throws Exception {
		Map<String, Object> resultMap = boardService.selectLoanList(commandMap.getMap());

		model.addAttribute("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		model.addAttribute("list", resultMap.get("result"));
	}

	@RequestMapping(value = "/loanDetail")
	public void openLoanDetail(Model mv, CommandMap commandMap) throws Exception {
		Map<String, Object> map = boardService.selectLoanDetail(commandMap.getMap());
		List<Map<String, Object>> list = boardService.selectSubLoanList(commandMap.getMap());
		

		mv.addAttribute("map", map);
		mv.addAttribute("list", list);
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
	
	
}