package com.multi.mini6.reviewboard.controller;

import com.multi.mini6.reviewboard.domain.ReviewVO;
import com.multi.mini6.reviewboard.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ReviewController {
    @Autowired
    ReviewService reviewService;



    @RequestMapping("review_insert")
    public void insert(ReviewVO reviewVO, Model model) {

        reviewService.insert(reviewVO);
    }
    @RequestMapping("review_update")
    public String update(ReviewVO reviewVO, Model model){
        int result = reviewService.update(reviewVO);
        model.addAttribute("review_update" , result);
        if (result>=1){
            return "review_update";
        }
        else {
            return "redirect:review.jsp";
        }
    }
    @RequestMapping("review_delete")
    public void delete(ReviewVO reviewVO) {

        reviewService.delete(reviewVO);
    }

    @RequestMapping("review_list3")
    public String list(Model model) {
        System.out.println("ReviewCommentController");

        List<ReviewVO> list = reviewService.list();
        for (ReviewVO reviewVO : list) {
            System.out.println(reviewVO);
        }
        model.addAttribute("list", list);

        return "review_list";
    }


    @RequestMapping("delete")
    public String delete2(ReviewVO reviewVO, Model model) {
        // BbsDAO dao = new BbsDAO();
        int result = reviewService.delete(reviewVO);

        model.addAttribute("result", result);

        return "review_delete";
    }

//    @RequestMapping("review_one")
//    public void one(ReviewVO reviewVO, Model model) throws Exception {
//        // BbsDAO dao = new BbsDAO();
//        System.out.println(reviewVO);
//        ReviewVO reviewVO2 = reviewService.one(reviewVO);
//        List<ReviewCommentVO> list = dao2.list(reviewVO.getReview_id());
//        model.addAttribute("reviewVO", reviewVO2);
//        model.addAttribute("list", list);

    }

