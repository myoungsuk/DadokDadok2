package com.multi.mini6.admingpage.controller;

import com.multi.mini6.admingpage.service.BookUploadService;
import com.multi.mini6.admingpage.service.BookUploadService2;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/adminpage")
public class BookUploadController {

    final private BookUploadService bookUploadService;
    final private BookUploadService2 bookUploadService2;
    // 책 업로드 관리자 페이지
    // TODO : 관리자만 접근 가능 페이지 권한 설정
    @GetMapping("/BookUploadPage")
    public void bookUploadPage() {
        log.info("bookUploadPage");
    }


    // 엑셀 파일 업로드 처리
    @PostMapping("/BookUploadPage/Excelupload")
    @ResponseBody
    public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file,
                                              @RequestParam("lib_code") int libCode) {
        try {
            // 서비스 메소드를 호출하여 파일 처리
            bookUploadService2.importBooksFromExcel2(file, libCode);
            return ResponseEntity.ok().body("파일이 성공적으로 업로드되었습니다.");
        } catch (Exception e) {
            // 예외 발생 시 오류 메시지 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드에 실패했습니다.");
        }
    }

    // CSV 파일 업로드 처리
    @PostMapping("/BookUploadPage/CSVupload")
    @ResponseBody
    public ResponseEntity<?> handleFileUploadCSV(@RequestParam("file") MultipartFile file,
                                                 @RequestParam("lib_code") int libCode) {
        try {
            // 서비스 메소드를 호출하여 파일 처리
            bookUploadService2.importBooksFromCSV2(file, libCode);
            return ResponseEntity.ok().body("파일이 성공적으로 업로드되었습니다.");
        } catch (Exception e) {
            // 예외 발생 시 오류 메시지 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드에 실패했습니다.");
        }
    }

    // 업로드 기록 가져오기
    @GetMapping("/BookUploadPage/UploadHistory")
    @ResponseBody
    public ResponseEntity<?> getUploadHistory() {
        try {
            return ResponseEntity.ok().body(bookUploadService.selectAllBooksHistory());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("업로드 기록을 가져오는데 실패했습니다.");
        }
    }

    //도서 총 개수 가져오기
    //booksLibraries 개수 가져오기
    @GetMapping("/BookUploadPage/AllBooksCount")
    @ResponseBody
    public ResponseEntity<?> getBookCount() {
        try {
            return ResponseEntity.ok().body(bookUploadService.getBooksAndBooksLibrariesCount());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("도서 개수를 가져오는데 실패했습니다.");
        }
    }

    // 첨부파일을 위한 도서관 검색
    @GetMapping("/BookUploadPage/librarySearch")
    @ResponseBody
    public ResponseEntity<?> getLibrarySearch(@RequestParam("libraries") String library) {
        try {
            return ResponseEntity.ok().body(bookUploadService.searchLibrary(library));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("도서관 검색에 실패했습니다.");
        }
    }
}