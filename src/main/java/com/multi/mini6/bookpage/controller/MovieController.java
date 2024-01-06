package com.multi.mini6.bookpage.controller;

import com.multi.mini6.bookpage.vo.MovieVO;
import com.multi.mini6.bookpage.vo.PageVO;
import com.multi.mini6.bookpage.service.MovieService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MovieController {

    private final MovieService movieService;

    @GetMapping("upload/movie_insert")
    public void movie_insert() {
        log.info("movie_insert page 입장");
    }

    @PostMapping("/post_movie")
    public String insert(
            MovieVO movieVO,
            HttpServletRequest request,
            MultipartFile file,
            Model model) throws Exception {

        String savedName =  file.getOriginalFilename();
        String uploadPath
                = request.getSession().getServletContext().getRealPath("resources/upload");
        File target = new File(uploadPath + "/" + savedName);
        file.transferTo(target);

        model.addAttribute("savedName", savedName);
        System.out.println("img넣기 전>> " + movieVO);
        movieVO.setImg(savedName);
        System.out.println("img넣은 후>> " + movieVO);

        movieService.insertMovie(movieVO);
        //컨트롤로의 vo변수명을 맨앞글자만 소문자로 바꾸어서 변수를 만들면,
        //자동으로 모델의 속성으로 등록시켜줌.
        //model.addAttribute("movieVO", movieVO);

        return "redirect:/upload/movie_list";
    }

    @GetMapping("upload/movie_list")
    public void movie_list(Model model,
                           @RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "3") int pageSize) {
        log.info("movie_list page 입장");

        // 전체 아이템 수 (예: 전체 책의 수)
        int totalItemCount = movieService.getMovieCount();

        // PageVO 객체 생성
        PageVO pageVO = new PageVO(page, pageSize, totalItemCount);

        // 페이징 처리된 책 목록 가져오기
        List<MovieVO> getPagedMovieList = movieService.getPagedMovieList(pageVO);

        //전체 페이지 수
        int totalPages = pageVO.getTotalPages();

        //전체 게시글 수
        int count = movieService.getMovieCount(); //전체게시물 수

        System.out.println("getPagedMovieList: " + getPagedMovieList);
        System.out.println("pageVO: " + pageVO);
        // 모델에 데이터 추가
        model.addAttribute("pageVO", pageVO);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("count", count);
        model.addAttribute("getPagedMovieList", getPagedMovieList);
        model.addAttribute("currentPage", page);

    }

    @GetMapping("upload/movie_detail")
    public void movie_detail(MovieVO movieVO, Model model,
                             @RequestParam("movie_id") int movie_id,
                             @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        log.info("movie_detail page 입장");


        MovieVO vo = movieService.selectMovieById(movie_id);
        log.info("movie2VO: " + vo);

        model.addAttribute("currentPage",currentPage);
        model.addAttribute("vo", vo);
    }



//    @GetMapping("/insert2")
//    public void insert2(Movie2VO movieVO, Model model) {
//        System.out.println("컨트롤러에서 받은 값>> " + movieVO);
//        //db처리!!
//        model.addAttribute("movieVO", movieVO);
//
//        log.info("insert2 page 입장");
//    }


    @RequestMapping("uploadForm")
    public void uploadForm(
            HttpServletRequest request,
            MultipartFile file,
            Model model) throws Exception {
        String savedName = file.getOriginalFilename();
        String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
        File target = new File(uploadPath + "/" + savedName);
        file.transferTo(target);
        model.addAttribute("savedName", savedName);
    }


    @RequestMapping("movie")
    public void movie(String movie2VO, Model model) {
        System.out.println("컨트롤러에서 받은 값>> " + movie2VO);
        //db처리!!
        model.addAttribute("vo", movie2VO);
    }
}
