package www.board.ctrl;

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
import www.common.common.CommandMap;
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
		Map<String,Object> resultMap = boardService.selectBoardList(commandMap.getMap());

		model.addAttribute("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		model.addAttribute("list", resultMap.get("result"));
	}

	@RequestMapping(value = "/boardListTest")
	public void boardListTest(Model model, CommandMap commandMap) throws Exception {
		Map<String,Object> resultMap = boardService.boardList(commandMap.getMap());

		model.addAttribute("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
		model.addAttribute("list", resultMap.get("result"));
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

	@RequestMapping(value="/deleteBoard")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/board/boardList");

	    boardService.deleteBoard(commandMap.getMap());

	    return mv;
	}
}