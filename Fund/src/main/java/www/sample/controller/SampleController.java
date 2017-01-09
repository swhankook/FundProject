package www.sample.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import www.sample.service.SampleService;

@Controller
@RequestMapping("/sample")
public class SampleController {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

    @Resource(name="sampleService")
    private SampleService sampleService;

    @RequestMapping(value="/openSampleBoardList.do")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");

        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
        mv.addObject("list", list);

        return mv;
    }

    @RequestMapping(value="/sample.do")
    public String sample(Model model) throws Exception{
    	return "sample";
    }
}