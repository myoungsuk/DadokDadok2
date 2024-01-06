package com.multi.mini6.bookpage.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
@NoArgsConstructor // 기본 생성자 자동 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자 자동 생성
@Builder
public class BookVO {

    private String book_ISBN; // PK
    private String book_name; // 제목
    private String book_content; // 내용
    private String book_author; // 저자
    private String book_publisher; // 출판사
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date book_createdAt; // 생성일
    private Integer book_genre; // 장르
    private String book_img; // 이미지

}
