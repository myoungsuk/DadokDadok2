package com.multi.mini6.bookpage.service;

import com.multi.mini6.bookpage.vo.MovieVO;
import com.multi.mini6.bookpage.vo.PageVO;
import com.multi.mini6.bookpage.dao.MovieDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@RequiredArgsConstructor
@Log4j2
public class MovieService {

	@Autowired
	private MovieDAO movieDAO;

	public void insertMovie(MovieVO movieVO) {
		movieDAO.insert(movieVO);
	}

	public List<MovieVO> getPagedMovieList(PageVO pageVO) {
		Map<String, Integer> map = new HashMap<>();
		map.put("offset", pageVO.getOffset());
		map.put("pageSize", pageVO.getPageSize());
		return movieDAO.getPagedMovieList(map);
	}

	public int getMovieCount() {
		return movieDAO.getMovieCount();
	}

	public MovieVO selectMovieById(int movie_id) {
		return movieDAO.selectMovieById(movie_id);
	}
}
