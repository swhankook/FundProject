package www.board.ctrl;

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
import www.common.common.CommandMap;
import www.common.ctrl.BaseCtrl;

@Controller
@RequestMapping("/board")
public class BoardCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory
			.getLogger(BoardCtrl.class);

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/boardList")
	public void sample(Model model, Map<String, Object> commandMap)
			throws Exception {
		List<Map<String, Object>> list = boardService
				.selectBoardList(commandMap);
		logger.debug("List Size : " + list.size());
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/boardWrite")
	public void boardWrite(Model model, CommandMap commandMap) throws Exception {
	}

	@RequestMapping(value = "/boardInsert")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = null;

		if (StringUtils.isNotBlank(commandMap.getMap().get("TITLE").toString())
				|| StringUtils.isNotBlank(commandMap.getMap().get("CONTENTS")
						.toString())) {
			mv = new ModelAndView("redirect:/board/boardList");
			boardService.insertBoard(commandMap.getMap());
		} else {
			mv = new ModelAndView("redirect:/board/boardWrite");
		}

		return mv;
	}

	@RequestMapping(value = "/boardDetail")
	public void openBoardDetail(Model mv, CommandMap commandMap)
			throws Exception {
		Map<String, Object> map = boardService.selectBoardDetail(commandMap
				.getMap());
		mv.addAttribute("map", map);
	}
}