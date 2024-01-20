package com.multi.mini6.bookpage.vo.bookAPI;

import lombok.Data;

@Data
public class BookDTO {
    private Integer no;
    private String bookname;
    private String authors;
    private String publisher;
    private String class_no;
    private String class_nm;
    private String publication_year;
    private String publication_date;
    private String bookImageURL;
    private String isbn;
    private String isbn13;
    private String description;
}