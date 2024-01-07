package com.multi.mini6.loginpage.service;

import com.multi.mini6.loginpage.dao.GuestBookDAO;
import com.multi.mini6.loginpage.vo.GuestBookVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class GuestBookService {

    final private GuestBookDAO guestBookDAO;

    public void addGuestBook(GuestBookVO guestBookVO) {
        log.info("addGuestBookEntry() invoked.");
        guestBookDAO.addEntry(guestBookVO);
    }

    public List<GuestBookVO> getGuestBookList() {
        log.info("getGuestBookEntryList() invoked.");
        return guestBookDAO.getGuestBookEntryList();
    }
    // 이메일을 기반으로 방명록을 가져오는 메소드 5개만가져옴
    public List<GuestBookVO> getGuestBookEntriesByEmail(String email) {
        log.info("getGuestBookEntriesByEmail() invoked for email: " + email);
        return guestBookDAO.getEntriesByEmail(email); // DAO가 이메일을 기반으로 방명록을 가져올 수 있도록 메소드 구현
    }

    // 이메일을 기반으로 방명록을 가져오는 메소드 전체 가져옴
    public List<GuestBookVO> getAllGuestBookEntriesByEmail(String email) {
        log.info("getAllGuestBookEntriesByEmail() invoked.");
        return guestBookDAO.getAllEntriesByEmail(email); // DAO가 이메일을 기반으로 방명록을 가져올 수 있도록 메소드 구현
    }

    public GuestBookVO getGuestBookByEmail(String email) {
        log.info("getGuestBookEntryById() invoked.");
        return guestBookDAO.getEntryByEmail(email);
    }

    public void deleteGuestBook(int id) {
        log.info("deleteGuestBookEntry() invoked.");
        guestBookDAO.deleteEntry(id);
    }

    public void updateGuestBook(GuestBookVO guestBookVO) {
        log.info("updateGuestBookEntry() invoked.");
        guestBookDAO.updateEntry(guestBookVO);
    }

    public GuestBookVO getGuestBookCommnetById(int id) {
    	log.info("getGuestBookCommnetById() invoked.");
    	return guestBookDAO.getGuestBookCommnetById(id);
    }
}
