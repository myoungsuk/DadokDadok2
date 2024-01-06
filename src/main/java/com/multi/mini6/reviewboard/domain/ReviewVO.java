package com.multi.mini6.reviewboard.domain;

import java.util.Date;

public class ReviewVO {

    private int review_id;
    private int member_id;
    private String book_ISBN;
    private String review_writer;
    private String review_title;
    private String review_content;
    private Date review_createdAt;
    private Date review_updatedAt;
    private int review_views;
    private String review_img1;
    private String review_img2;
    private String review_img3;
    private String review_img4;
    private String review_img5;

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public String getBook_ISBN() {
        return book_ISBN;
    }

    public void setBook_ISBN(String book_ISBN) {
        this.book_ISBN = book_ISBN;
    }

    public String getReview_writer() {
        return review_writer;
    }

    public void setReview_writer(String review_writer) {
        this.review_writer = review_writer;
    }

    public String getReview_title() {
        return review_title;
    }

    public void setReview_title(String review_title) {
        this.review_title = review_title;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public Date getReview_createdAt() {
        return review_createdAt;
    }

    public void setReview_createdAt(Date review_createdAt) {
        this.review_createdAt = review_createdAt;
    }

    public Date getReview_updatedAt() {
        return review_updatedAt;
    }

    public void setReview_updatedAt(Date review_updatedAt) {
        this.review_updatedAt = review_updatedAt;
    }

    public int getReview_views() {
        return review_views;
    }

    public void setReview_views(int review_views) {
        this.review_views = review_views;
    }

    public String getReview_img1() {
        return review_img1;
    }

    public void setReview_img1(String review_img1) {
        this.review_img1 = review_img1;
    }

    public String getReview_img2() {
        return review_img2;
    }

    public void setReview_img2(String review_img2) {
        this.review_img2 = review_img2;
    }

    public String getReview_img3() {
        return review_img3;
    }

    public void setReview_img3(String review_img3) {
        this.review_img3 = review_img3;
    }

    public String getReview_img4() {
        return review_img4;
    }

    public void setReview_img4(String review_img4) {
        this.review_img4 = review_img4;
    }

    public String getReview_img5() {
        return review_img5;
    }

    public void setReview_img5(String review_img5) {
        this.review_img5 = review_img5;
    }

    @Override
    public String toString() {
        return "BoardVO [review_id=" + review_id + ", member_id=" + member_id + ", book_ISBN=" + book_ISBN
                + ", review_writer=" + review_writer + ", review_title=" + review_title + ", review_content="
                + review_content + ", review_createdAt=" + review_createdAt + ", review_updatedAt=" + review_updatedAt
                + ", review_views=" + review_views + ", review_img1=" + review_img1 + ", review_img2=" + review_img2
                + ", review_img3=" + review_img3 + ", review_img4=" + review_img4 + ", review_img5=" + review_img5
                + "]";
    }

}
