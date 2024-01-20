package com.multi.mini6.bookpage.controller;


import com.multi.mini6.bookpage.service.BookService;
import com.multi.mini6.bookpage.vo.BooksVO;
import com.multi.mini6.bookpage.vo.bookAPI.ResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/bookpage")
public class BookController {

    private final BookService bookService;
//    private final BookAPIService bookAPIService;

    @GetMapping("/bookmain")
    public void book() { // JSP 뷰 이름 반환
    }

    @GetMapping("/booklist")
    public void bookListAfterSearch() {
    }

    @GetMapping("/bookdetail/{isbn}")
    public String bookDetail(@PathVariable("isbn") String isbn, Model model) {
        BooksVO booksVO = bookService.getBookInfo(isbn);
        model.addAttribute("booksVO", booksVO);
        return "/bookpage/bookdetail";
    }

//    @GetMapping("/bookdetail/{isbn}")
//    public String bookDetail(@PathVariable("isbn") String isbn, Model model) {
//        ResponseDTO responseDTO = bookAPIService.getBookDetails(isbn);
//        log.info("컨트롤러에서 bookdetailDTO 받아오는지 : " + responseDTO.toString());
//        model.addAttribute("bookDetailsDTO", responseDTO);
//        return "/bookpage/bookdetail";
//    }

    //도서 검색 기능
    //Rest API
    @GetMapping("/book-search")
    @ResponseBody
    public ResponseEntity<List<BooksVO>> bookSearch(@RequestParam("searchKeyword") String searchKeyword) {
        return ResponseEntity.ok(bookService.bookSearch(searchKeyword));
    }


}
