package com.multi.mini6;

import com.multi.mini6.bookpage.controller.MovieController;
import com.multi.mini6.bookpage.service.MovieService;
import lombok.extern.log4j.Log4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;



//@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(MockitoJUnitRunner.class)
@Log4j
public class MovieControllerTest {

    private MockMvc mockMvc;

    @Mock
    private MovieService movieService;

    @InjectMocks
    private MovieController movieController;

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(movieController).build();
    }

    @Test
    public void testMovieList() throws Exception {
        mockMvc.perform(get("/upload/movie_list")
                        .param("page", "1")
                        .param("pageSize", "3"))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("pageVO"))
                .andExpect(model().attributeExists("totalPages"))
                .andExpect(model().attributeExists("count"))
                .andExpect(model().attributeExists("getPagedMovieList"))
                .andExpect(model().attributeExists("currentPage"));
    }

    @Test
    public void testMovieDetail() throws Exception {
        mockMvc.perform(get("/upload/movie_detail")
                        .param("movie_id", "1"))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("movieVO"));
    }
}
