package com.multi.mini6.bookpage.vo;

import lombok.Data;

@Data
public class BooksVO {
    private int id;
    private String title;
    private String author;
    private String publisher;
    private String yearOfPublication;
    private String isbn;
    private String setIsbn;
    private String additionalSymbol;
    private String volume;
    private String subjectClassificationNumber;
}