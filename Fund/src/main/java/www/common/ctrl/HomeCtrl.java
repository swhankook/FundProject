package www.common.ctrl;

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
@RequestMapping("/home")
public class HomeCtrl extends BaseCtrl {
	private static final Logger logger = LoggerFactory.getLogger(HomeCtrl.class);

	@RequestMapping(value = "/home")
	public void boardList(Model model, CommandMap commandMap) throws Exception {
	}
}