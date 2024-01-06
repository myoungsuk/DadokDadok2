package com.multi.mini6.loginpage.controller;

import com.multi.mini6.loginpage.service.GuestBookService;
import com.multi.mini6.loginpage.vo.GuestBookVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/GuestBookController")
@RequiredArgsConstructor
public class GuestBookController {

    final private GuestBookService guestBookService;

    @PostMapping("/addGuestBook")
    public void addGuestBook(@RequestBody GuestBookVO guestBookVO) {
        log.info("addGuestBook() invoked.");
        guestBookService.addGuestBook(guestBookVO);
    }

    @GetMapping("/getGuestBookList")
    public void getGuestBookList() {
        log.info("getGuestBookList() invoked.");
        guestBookService.getGuestBookList();
    }
}
