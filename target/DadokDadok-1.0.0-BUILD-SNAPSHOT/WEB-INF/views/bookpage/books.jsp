<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.multi.mini6.bookpage.vo.BookVO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-3">
    <h1>Books List</h1>
    <p>Total Books: ${count}</p>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ISBN</th>
            <th>Name</th>
            <th>Content</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Created At</th>
            <th>Genre</th>
            <th>Image</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${books}" var="book">
            <tr>
                <td>${book.book_ISBN}</td>
                <td>${book.book_name}</td>
                <td>${book.book_content}</td>
                <td>${book.book_author}</td>
                <td>${book.book_publisher}</td>
                <td>${book.book_createdAt}</td>
                <td>${book.book_genre}</td>
                <td><img src="${book.book_img}" alt="Book Image" style="height:100px;"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <nav>
        <ul class="pagination">
            <c:forEach begin="1" end="${totalPages}" var="i">
                <li class="page-item ${pageVO.page == i ? 'active' : ''}">
                    <a class="page-link" href="books?page=${i}&pageSize=${pageVO.pageSize}">${i}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
