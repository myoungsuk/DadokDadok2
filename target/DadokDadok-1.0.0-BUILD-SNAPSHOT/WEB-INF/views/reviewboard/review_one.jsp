<%@page import="com.multi.mini6.ReviewCommentVO"%>
<%@page import="com.multi.mini6.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.mini6.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
        	session.setAttribute("user", "1");
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS 추가 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    게시글 이미지 ${reviewVO.review_img1}<br>
    회원 아이디 ${reviewVO.member_id}<br>
    게시글 작성자 ${reviewVO.review_writer}<br>
    게시글 제목 ${reviewVO.review_title}<br>
    게시글 내용 ${reviewVO.review_content}<br>
    게시글 작성일자 ${reviewVO.review_createdAt}<br>
    게시글 수정일자 ${reviewVO.review_updatedAt}<br>
    게시글 조회수 ${reviewVO.review_views}<br>

    <!-- 댓글 입력 폼 -->
    <hr class="mt-4 mb-4">
    <div class="input-group mb-3">
        <input id="review" type="text" class="form-control" placeholder="댓글입력">
        <div class="input-group-append">
            <button id="b1" class="btn btn-primary" type="button">댓글 달기</button>
        </div>
    </div>
    <hr class="mt-4 mb-4">

    <!-- 댓글 목록 -->
    <div id="result">
    <%
    	List<ReviewCommentVO> list = (List<ReviewCommentVO>) request.getAttribute("list");
            for (ReviewCommentVO dto : list) {
    %>
        <div class="card mb-2">
            <div class="card-body">
                <%=dto.getReview_id()%>,
                <%=dto.getCm_content()%>,
                <%=dto.getMember_id()%>
            </div>
        </div>
    <%
        }
    %>
    </div>

    <!-- Bootstrap 및 jQuery JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Ajax 코드는 변경하지 않고 유지 -->
    <script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
    <script type="text/javascript">
        $(function() {
            $('#b1').click(function() {
                $.ajax({
                    url: "review_comment_insert",
                    data: {
                        review_id : '${reviewVO.review_id}',
                        cm_content : $('#review').val(),
                        member_id : '${user}'
                    },
                    success: function(response) {
                    	$('#result').append("<div class='card mb-2'><div class='card-body'>"  + response +"</div></div>" )
				        //$('#result').innerHtml("<div class='card-body'>")

                        alert("댓글 작성이 완료되었습니다." + response)

                    }
                })
            })
        })
    </script>
</body>
</html>