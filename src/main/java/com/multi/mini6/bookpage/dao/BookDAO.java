package com.multi.mini6.bookpage.dao;

import com.multi.mini6.bookpage.vo.BookVO;
import com.multi.mini6.bookpage.vo.PageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class BookDAO {

    @Autowired
    SqlSessionTemplate sqlSession;

    // 책 정보 삽입
    public int insertOne(BookVO bookVO){
        return sqlSession.insert("insertOne", bookVO);
    }

    // ISBN으로 책 정보 조회
    public BookVO selectOneByISBN(String bookISBN){
        return sqlSession.selectOne("selectOneByISBN", bookISBN);
    }

    // 책 이름으로 책 정보 조회
    public BookVO selectOneByName(String bookName){
        return sqlSession.selectOne("selectOneByName", bookName);
    }

    // 모든 책 정보 조회
    public List<BookVO> selectAll(){
        return sqlSession.selectList("selectAll");

    }

    // 총 책 개수 조회
    public int getBookCount(){
        return sqlSession.selectOne("getBookCount");
    }

    // 도서 정보 페이징 처리 리스트
    public List<BookVO> getPagedBooks(PageVO pageVO){
        return sqlSession.selectList("getPagedBooks", pageVO);
    }

    // 책 정보 업데이트
    public int updateOne(BookVO bookVO){
        return sqlSession.update("updateOne", bookVO);
    }

    // 책 정보 삭제
    public int deleteOne(String bookISBN){
        return sqlSession.delete("deleteOne", bookISBN);
    }

    // 책 검색
    public List<BookVO> searchBook(String keyword){
        return sqlSession.selectList("searchBook", keyword);
    }


}
