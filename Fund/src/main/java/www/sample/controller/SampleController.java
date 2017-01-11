package www.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import www.common.common.CommandMap;
import www.common.ctrl.BaseCtrl;
import www.sample.service.SampleService;

@Controller
@RequestMapping("/sample")
public class SampleController extends BaseCtrl {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

    @Resource(name="sampleService")
    private SampleService sampleService;

    @RequestMapping(value="/openSampleBoardList")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");

        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
        mv.addObject("list", list);

        return mv;
    }

    @RequestMapping(value="/testMapArgumentResolver")
    public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("");

        if(commandMap.isEmpty() == false){
            Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
            Entry<String,Object> entry = null;
            while(iterator.hasNext()){
                entry = iterator.next();
                logger.debug("key : "+entry.getKey()+", value : "+entry.getValue());
            }
        }
        return mv;
    }

    @RequestMapping(value="/sample")
    public String sample(Map<String,Object> commandMap) throws Exception{
        return returnStr();
    }
}