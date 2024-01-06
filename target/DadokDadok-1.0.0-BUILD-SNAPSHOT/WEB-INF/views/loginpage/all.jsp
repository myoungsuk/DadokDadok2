<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>all 로그인 성공</h1>

<sec:authorize access="isAnonymous()">
    <!-- 로그인 안 한 익명일 경우 -->
    <a href="/loginpage/customLogin">로그인</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <!-- 로그인(인증된) 사용자인 경우 -->
    <a href="/loginpage/customLogout">로그아웃</a>
</sec:authorize>




</body>
</html>