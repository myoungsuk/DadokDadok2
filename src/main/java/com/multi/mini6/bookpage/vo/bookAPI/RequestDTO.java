package com.multi.mini6.bookpage.vo.bookAPI;

import lombok.Data;

@Data
public class RequestDTO {
    private String isbn13;
    private String loaninfoYN;
    private String displayInfo;
}
