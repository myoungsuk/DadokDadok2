<%@ page import="com.multi.mini6.bookpage.vo.BookVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <link rel="stylesheet" type="text/css" href="resources/css/project.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-3">
    <h1>Book List</h1>
    <br>

    <%
        List<BookVO> bookList = (List<BookVO>) request.getAttribute("AllBooks");
        if (bookList != null && !bookList.isEmpty()) {
    %>
    전체게시물: <%= bookList.size() %>개
    <%
    } else {
    %>
    전체게시물: 0개
    <%
        }
    %>

    <table class="table table-bordered">
        <thead class="thead-light">
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
        <%
            if (bookList != null && !bookList.isEmpty()) {
                for (BookVO book : bookList) {
        %>
        <tr>
            <td><%= book.getBook_ISBN() %></td>
            <td><%= book.getBook_name() %></td>
            <td><%= book.getBook_content() %></td>
            <td><%= book.getBook_author() %></td>
            <td><%= book.getBook_publisher() %></td>
            <td><%= book.getBook_createdAt() %></td> <!-- 생성일 -->
            <td><%= book.getBook_genre() %></td> <!-- 장르 -->
            <td><img src="<%= book.getBook_img() %>" alt="Book Image" style="height:100px;"/></td> <!-- 이미지 -->
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="8">No book entries found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
