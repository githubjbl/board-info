package com.example.boardinfo.controller.member;

import com.example.boardinfo.service.member.MypageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import java.util.Map;

@RestController
@RequestMapping("mypage/*")
public class MypageController {
    private static final Logger logger
            = LoggerFactory.getLogger(MypageController.class);
    @Inject
    MypageService mypageService;

    /*유저의 postList를 get하는*/
    @RequestMapping("getPostList.do")
    @ResponseBody
    public Map<String, Object> getList(
            @RequestParam String userid) {
        logger.info("@@@ userid 잘 넘어오니 : " + userid + "@@@");
        Map<String, Object> map = mypageService.getPostList(userid);

        logger.info("@@@ map 잘 넘어오니 : " + map + "@@@");
        return map;
    }

    /*컬렉션 아마도*/
    @RequestMapping("collection")
    public ModelAndView collection(ModelAndView mav){
        mav.setViewName("member/collection");
        return mav;
    }
}