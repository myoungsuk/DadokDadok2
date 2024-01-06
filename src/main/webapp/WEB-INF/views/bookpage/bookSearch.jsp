<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.multi.mini6.bookpage.vo.BookVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Book</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<div class="container mt-3">
    <h1>Search Book by ISBN</h1>
    <form id="searchFormByISBN">
        <input type="text" id="isbnInput" placeholder="Enter ISBN" required>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div id="bookInfoByISBN" style="margin-top: 20px;"></div>

    <hr>

    <h1>Search Book by Name</h1>
    <form id="searchFormByName">
        <input type="text" id="nameInput" placeholder="Enter Book Name" required>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div id="bookInfoByName" style="margin-top: 20px;"></div>

    <hr>

    <h1>Search Book by All</h1>
    <form id="searchFormByAll">
    <input type="text" id="allInput" placeholder="Enter Search Query" required>
    <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div id="bookInfoByAll" style="margin-top: 20px;"></div>
</div>

<script>
    $(document).ready(function() {
        // Search by ISBN
        $("#searchFormByISBN").submit(function(event) {
            event.preventDefault();
            var isbn = $("#isbnInput").val();
            $.ajax({
                url: '/getBookByISBN',
                type: 'GET',
                data: {bookISBN: isbn},
                success: function(book) {
                    displayBookInfo(book, '#bookInfoByISBN');
                },
                error: function() {
                    $("#bookInfoByISBN").html('<p>An error has occurred</p>');
                }
            });
        });

        // Search by Name
        $("#searchFormByName").submit(function(event) {
            event.preventDefault();
            var name = $("#nameInput").val();
            $.ajax({
                url: '/getBookByName', // 가정된 서버 엔드포인트
                type: 'GET',
                data: {bookName: name},
                success: function(book) {
                    displayBookInfo(book, '#bookInfoByName');
                },
                error: function() {
                    $("#bookInfoByName").html('<p>An error has occurred</p>');
                }
            });
        });


        // Search By All
        $("#searchFormByAll").submit(function(event) {
            event.preventDefault();
            var all = $("#allInput").val();
            $.ajax({
                url: '/getBookByAll', // 서버 엔드포인트
                type: 'GET',
                data: {AllBookThing: all}, // 서버로 보낼 데이터
                success: function(books) { // 서버로부터 반환된 책 목록을 처리
                    displayBooksInfo(books, '#bookInfoByAll');
                },
                error: function() {
                    $("#bookInfoByAll").html('<p>An error has occurred</p>');
                }
            });
        });









        function displayBooksInfo(books, elementId) {
            var booksInfoHtml = '';
            if (books && books.length > 0) {
                $.each(books, function(i, book) {
                    booksInfoHtml += '<div class="book-entry">' +
                        '<p><strong>ISBN:</strong> ' + book.book_ISBN + '</p>' +
                        '<p><strong>Name:</strong> ' + book.book_name + '</p>' +
                        '<p><strong>Author:</strong> ' + book.book_author + '</p>' +
                        '<p><strong>Publisher:</strong> ' + book.book_publisher + '</p>' +
                        '<p><strong>Content:</strong> ' + book.book_content + '</p>' +
                        '<p><strong>CreatedAt:</strong> ' + book.book_createdAt + '</p>' +
                        '<p><strong>Genre:</strong> ' + book.book_genre + '</p>' +
                        '<p><strong>Img:</strong> ' + book.book_img + '</p>' +
                        '</div>'+
                        '<hr>';
                });
            } else {
                booksInfoHtml = '<p>No books found.</p>';
            }
            $(elementId).html(booksInfoHtml);
        }


        function displayBookInfo(book, elementId) {
            if (book) {
                var bookInfoHtml = '<p><strong>ISBN:</strong> ' + book.book_ISBN + '</p>' +
                    '<p><strong>Name:</strong> ' + book.book_name + '</p>' +
                    '<p><strong>Author:</strong> ' + book.book_author + '</p>' +
                    '<p><strong>Publisher:</strong> ' + book.book_publisher + '</p>' +
                    '<p><strong>Content:</strong> ' + book.book_content + '</p>' +
                    '<p><strong>CreatedAt:</strong> ' + book.book_createdAt + '</p>' +
                    '<p><strong>Genre:</strong> ' + book.book_genre + '</p>' +
                    '<p><strong>Img:</strong> ' + book.book_img + '</p>';
                $(elementId).html(bookInfoHtml);
            } else {
                $(elementId).html('<p>No book found.</p>');
            }
        }
    });
</script>

</body>
</html>
