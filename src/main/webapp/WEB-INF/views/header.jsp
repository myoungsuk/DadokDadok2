<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- ======= Header ======= -->
<header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">

        <div class="logo">
            <a href="/mainpage/index" class="logo-link">
                <img src="../../resources/assets/img/logo.png" alt="DadokDadok Logo" class="logo-image">
                <span class="logo-text">DadokDadok</span>
            </a>
        </div>


        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="/bookpage/bookmain">Book</a></li>
                <li><a href="services.jsp">Library</a></li>
                <li><a href="testimonials.jsp">ReviewBoard</a></li>
                <li><a href="pricing.jsp">FreeBoard</a></li>
                <li><a href="portfolio.jsp">NoticeBoard</a></li>
                <%--                <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>--%>
                <%--                    <ul>--%>
                <%--                        <li><a href="#">Drop Down 1</a></li>--%>
                <%--                        <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>--%>
                <%--                            <ul>--%>
                <%--                                <li><a href="#">Deep Drop Down 1</a></li>--%>
                <%--                                <li><a href="#">Deep Drop Down 2</a></li>--%>
                <%--                                <li><a href="#">Deep Drop Down 3</a></li>--%>
                <%--                                <li><a href="#">Deep Drop Down 4</a></li>--%>
                <%--                                <li><a href="#">Deep Drop Down 5</a></li>--%>
                <%--                            </ul>--%>
                <%--                        </li>--%>
                <%--                        <li><a href="#">Drop Down 2</a></li>--%>
                <%--                        <li><a href="#">Drop Down 3</a></li>--%>
                <%--                        <li><a href="#">Drop Down 4</a></li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
                <%--                <li><a href="contact.jsp">Contact</a></li>--%>
                <li><a href="/settingpage/settingpage">Setting</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->
