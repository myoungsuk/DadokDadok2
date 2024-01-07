package com.multi.mini6.mainpage.controller;

import lombok.Value;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static java.awt.SystemColor.info;

@Log4j2
@Controller
@PropertySource("classpath:kakao.properties")
public class MapController {

    @Autowired
    ApplicationContext applicationContext;

    @GetMapping("/map")
    @ResponseBody
    public String getMapData() {

        Environment env =  applicationContext.getEnvironment();
        log.info("env: " + env);

        // kakaoRestApiKey를 사용하여 카카오 API에 요청을 보내고 결과를 반환
        // 예시 코드
        String apiKey = env.getProperty("kakao.api.key");
        log.info("apiKey: " + apiKey);


        return apiKey;
    }

    @GetMapping("/mapTest")
    public void mapTest() {
        log.info("mapTest");
    }

    @GetMapping("/apiTest")
    public void apiTest() {
        log.info("apiTest");
    }

}
