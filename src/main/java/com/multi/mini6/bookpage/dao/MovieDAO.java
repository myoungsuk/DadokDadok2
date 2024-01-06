package com.multi.mini6.bookpage.dao;

import com.multi.mini6.bookpage.vo.MovieVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class MovieDAO {

    @Autowired
    SqlSessionTemplate sqlSession;

//    public void insert(MovieVO movieVO) {
//        my.insert("movie.insert", movieVO);
//    }
//
//    public List<MovieVO> getPagedMovieList(PageVO pageVO) {
//        Map<String, Integer> map = new HashMap<>();
//        map.put("offset", pageVO.getOffset());
//        map.put("pageSize", pageVO.getPageSize());
//        return my.selectList("movie.getPagedMovieList", map);
//    }
//
//    public int getMovieCount() {
//        return my.selectOne("movie.getMovieCount");
//    }
//
//    public MovieVO selectMovieById(int movie_id) {
//        return my.selectOne("movie.selectMovieById", movie_id);
//    }

    public int insert(MovieVO movieVO){
        return sqlSession.insert("insert", movieVO);
    }

    public List<MovieVO> getPagedMovieList(Map<String, Integer> pageVO){
        return sqlSession.selectList("getPagedMovieList", pageVO);
    }

    public int getMovieCount(){
        return sqlSession.selectOne("getMovieCount");
    }

    public MovieVO selectMovieById(int movie_id){
        return sqlSession.selectOne("selectMovieById", movie_id);
    }
}
