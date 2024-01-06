package com.multi.mini6.loginpage.vo;

import lombok.Data;

import java.util.Date;

@Data
public class GuestBookVO {
    private int id;
    private String authorEmail;
    private String recipientEmail;
    private String message;
    private Date modifiedAt;
    private Date createdAt;
}
