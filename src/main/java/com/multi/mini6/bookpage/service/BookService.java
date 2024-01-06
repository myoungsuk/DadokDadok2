package com.multi.mini6.bookpage.service;

import com.multi.mini6.bookpage.vo.BookVO;
import com.multi.mini6.bookpage.vo.PageVO;
import com.multi.mini6.bookpage.dao.BookDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@RequiredArgsConstructor
@Log4j2
public class BookService {

	@Autowired
	private BookDAO bookDAO;


	//select문
	public List<BookVO> getAllBooks() {

		return bookDAO.selectAll();
	}

	public BookVO getBookByISBN(String bookISBN) {
		return bookDAO.selectOneByISBN(bookISBN);
	}

	public BookVO getBookByName(String bookName) {
		return bookDAO.selectOneByName(bookName);
	}

	public List<BookVO> getBookByAll(String AllBookThing) {
		return bookDAO.searchBook(AllBookThing);
	}

	public List<BookVO> getPagedBooks(PageVO pageVO) {
		return bookDAO.getPagedBooks(pageVO);
	}

	public int getBookCount() {
		return bookDAO.getBookCount();
	}



	//insert문
	public int addBook(BookVO bookVO) {
		return bookDAO.insertOne(bookVO);
	}

	//update문
	public int updateBook(BookVO bookVO) {
		return bookDAO.updateOne(bookVO);
	}

	//delete문
	public int deleteBook(String bookISBN) {
		return bookDAO.deleteOne(bookISBN);
	}


}
