package com.multi.mini6.reviewboard.service;

import com.multi.mini6.reviewboard.domain.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.List;

@Repository
public class ReviewService {

    @Autowired
    SqlSessionTemplate my;

    public void insert(ReviewVO reviewVO) {
        my.insert("review.insert", reviewVO);
    }

    public int update(ReviewVO reviewVO) {
        return my.update("review.update", reviewVO);
    }

    public int delete(ReviewVO reviewVO) {
        return my.delete("review.delete", reviewVO);
    }
    public List<ReviewVO> list() {
        return my.selectList("review.list");
    }
    public ReviewVO one(ReviewVO reviewVO) throws Exception {
        // 3.SQL문 결정/생성
        ReviewVO dto = my.selectOne("review.one", reviewVO);

        return dto;
    }

}
