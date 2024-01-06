package com.multi.mini6.loginpage.controller;

import com.multi.mini6.loginpage.service.MemberService;
import com.multi.mini6.loginpage.vo.CustomUser;
import com.multi.mini6.loginpage.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/profilepage")
@RequiredArgsConstructor
public class ProfileController {

    private final MemberService memberService;

    @PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
    @GetMapping("/mypage")
    public void mypage(Model model) {
        log.info("mypage");

        //info 정보 가져오기
        //info 정보를 model에 담아서 view로 전달
        CustomUser email = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        log.info("email = " + email);
        MemberVO member = memberService.getMember(email.getUsername());
        log.info("member = " + member);

        model.addAttribute("member", member); // 뷰에 사용자 정보 전달
    }



}
