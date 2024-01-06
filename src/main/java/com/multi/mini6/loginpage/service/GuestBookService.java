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

    public GuestBookVO getGuestBookById(int id) {
        log.info("getGuestBookEntryById() invoked.");
        return guestBookDAO.getEntryById(id);
    }

    public void deleteGuestBook(int id) {
        log.info("deleteGuestBookEntry() invoked.");
        guestBookDAO.deleteEntry(id);
    }

    public void updateGuestBook(GuestBookVO guestBookVO) {
        log.info("updateGuestBookEntry() invoked.");
        guestBookDAO.updateEntry(guestBookVO);
    }

}
