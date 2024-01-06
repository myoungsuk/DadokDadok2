package com.multi.mini6.bookpage.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class MovieVO {

    private int movie_id;
    private String title;
    private String img;
    private String genre;
    private String running_time;
    private String link;


}
