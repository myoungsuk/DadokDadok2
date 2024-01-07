package com.multi.mini6.loginpage.dao;

import com.multi.mini6.loginpage.vo.GuestBookVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GuestBookDAO {

    @Autowired
    SqlSessionTemplate sqlSession;

    //방명록 추가
    public void addEntry(GuestBookVO guestBookVO) {
        sqlSession.insert("addEntry", guestBookVO);
    }

    //방명록 리스트 가져오기
    public List<GuestBookVO> getGuestBookEntryList() {
        return sqlSession.selectList("getGuestBookEntryList");
    }

    //방명록 삭제
    public void deleteEntry(int id) {
        sqlSession.delete("deleteEntry", id);
    }

    //방명록 수정
    public void updateEntry(GuestBookVO guestBookVO) {
        sqlSession.update("updateEntry", guestBookVO);
    }

    //방명록 아이디로 검색해서 가져오기
    public GuestBookVO getEntryByEmail(String email) {
        return sqlSession.selectOne("getEntryByEmail", email);
    }

    //방명록 5개만 가져오기
    public List<GuestBookVO> getEntriesByEmail(String email) {
        return sqlSession.selectList("getEntriesByEmail", email); // 'getEntriesByEmail' MyBatis 쿼리 ID
    }

    //방명록 전체 가져오기
    public List<GuestBookVO> getAllEntriesByEmail(String email) {
        return sqlSession.selectList("getAllEntriesByEmail", email);
    }

    public GuestBookVO getGuestBookCommnetById(int id) {
    	return sqlSession.selectOne("getGuestBookCommnetById", id);
    }

}
