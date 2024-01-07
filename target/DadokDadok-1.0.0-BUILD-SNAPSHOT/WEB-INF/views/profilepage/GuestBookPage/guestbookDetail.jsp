<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>MyPage</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>


    <!-- Favicons -->
    <link href="../../resources/assets/img/favicon.png" rel="icon">
    <link href="../../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../../resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="../../resources/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Template Main CSS File -->
    <link href="../../resources/assets/css/style.css" rel="stylesheet">


    <style>
        .logo-link {
            display: flex;
            align-items: center;
            text-decoration: none; /* 링크 밑줄 제거 */
        }

        .logo-image {
            max-width: 300px; /* 로고 이미지 크기 조정 */
            height: auto; /* 이미지 높이 자동 조절 */
        }

        .logo-text {
            font-size: 24px; /* 로고 텍스트 크기 */
            font-weight: bold; /* 글씨 굵게 */
            color: #333; /* 글씨 색상 */
            /*margin-left: 5px; !* 이미지와 텍스트 간격 *!*/
        }

        .rounded-image {
            border-radius: 50%; /* 원형으로 만듭니다 */
            width: 300px; /* 원하는 크기로 설정하세요 */
            height: 300px; /* 원하는 크기로 설정하세요 */
            object-fit: cover; /* 이미지가 div를 벗어나지 않도록 설정합니다 */
        }

        .guestbook-link:hover .sidebar-title {
            color: #fd5c28; /* 마우스 오버 시 색상 변경 */
        }

    </style>
</head>

<body>
<!-- ======= Top Bar ======= -->
<jsp:include page="/WEB-INF/views/topbar.jsp"/>
<!-- End Top Bar -->

<!-- ======= Header ======= -->
<jsp:include page="/WEB-INF/views/header.jsp"/>
<!-- End Header -->


<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>MyPage</h2>
                <ol>
                    <li><a href="/mainpage/index">Home</a></li>
                    <li>MyPage</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <!-- 방명록 상세페이지 -->
    <section id="guestbook-detail" class="guestbook-detail">
        <div class="guestbook-entry-form">
            <form id="guestbookForm" method="post" style="width: 60%; margin: auto;">
                <div class="form-group">
                    <textarea id="guestbookMessage" class="form-control" rows="4" required placeholder="방명록에 메시지를 남겨주세요."></textarea>
                </div>
                <button type="submit" class="btn btn-primary">방명록 남기기</button>
            </form>
        </div>

        <div class="container" data-aos="fade-up">
            <div class="section-title">
                <h2>방명록</h2>
            </div>
            <div class="guestbook-list" data-aos="fade-up" data-aos-delay="100">
                <!-- AJAX를 통해 여기에 방명록 목록이 로드됩니다 -->
            </div>
        </div>

        <!-- Edit Guestbook Modal -->
        <div class="modal fade" id="editGuestBookModal" tabindex="-1" role="dialog" aria-labelledby="editGuestBookModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editGuestBookModalLabel">방명록 수정</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editGuestBookForm">
                            <input type="hidden" id="editGuestBookId">
                            <div class="form-group">
                                <label for="editMessage">메시지</label>
                                <textarea class="form-control" id="editMessage" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">수정하기</button>
                            <button type="button" class="btn btn-secondary" id="cancelModalButton">취소</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </section>

</main><!-- End #main -->


<!-- ======= Footer ======= -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!-- End Footer -->


<!-- Vendor JS Files -->
<script src="../../resources/assets/vendor/aos/aos.js"></script>
<script src="../../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../../resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="../../resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../../resources/assets/js/main.js"></script>

<script>
    //모달창 오류로 인한 수동 취소 버튼
    $(document).ready(function() {
        $('#cancelModalButton').on('click', function() {
            $('#editGuestBookModal').modal('hide');
        });
    });


    $(document).ready(function () {
        // 현재 로그인한 사용자의 이메일
        var loggedInEmail = '현재 사용자 이메일'; // 현재 로그인한 사용자의 이메일을 적절한 방법으로 설정하세요.

        $.ajax({
            url: '/profilepage/GuestBookPage/currentUserEmail',
            type: 'GET',
            success: function(response) {
                loggedInEmail = response;
            },
            error: function(error) {
                console.log('사용자 이메일을 가져오는데 실패했습니다:', error);
            }
        });

        // 방명록 데이터 로드 AJAX 요청
        $.ajax({
            url: '/profilepage/GuestBookPage/guestbookDetailAPI',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var guestbookListDiv = $('.guestbook-list');
                guestbookListDiv.empty();

                $.each(response, function (index, entry) {
                    var buttons = '';
                    if (entry.author_email === loggedInEmail) {
                        // 현재 로그인한 사용자가 작성자인 경우 버튼 표시
                        buttons = '<button class="btn btn-sm btn-info" onclick="editGuestBookEntry(' + entry.id + ')">수정</button>' +
                            ' <button class="btn btn-sm btn-danger" onclick="deleteGuestBookEntry(' + entry.id + ')">삭제</button>';
                    }
                    var commentbuttons = '<button class="btn btn-sm btn-primary btn-rounded" onclick="commentGuestBookEntry(' + entry.id + ')">댓글달기</button>';

                    var entryHtml = '<div class="col-md-12 guestbook-entry">' +
                        '<div class="guestbook-content">' +
                        '<h4>' + entry.author_nickname + '</h4>' +
                        '<p>' + entry.message + '</p>' +
                        '<span>' + new Date(entry.modifiedAt).toLocaleString() + ' ' + '</span>' +
                        buttons + ' ' + // 버튼 추가
                        commentbuttons + //댓글 버튼 추가
                        '<hr></div></div>';
                    guestbookListDiv.append(entryHtml);
                });
            },
            error: function (error) {
                console.log('방명록 데이터를 가져오는데 실패했습니다:', error);
            }
        });
    });

    function editGuestBookEntry(entryId) {
        $.ajax({
            url: '/profilepage/GuestBookPage/guestbookDetail/' + entryId,
            type: 'GET',
            success: function(entry) {
                $('#editGuestBookId').val(entry.id);
                $('#editMessage').val(entry.message);
                $('#editGuestBookModal').modal('show');
            },
            error: function(error) {
                console.log('Error fetching guest book entry:', error);
            }
        });
    }

    $('#editGuestBookForm').on('submit', function(e) {
        e.preventDefault();
        var updatedEntry = {
            id: $('#editGuestBookId').val(),
            message: $('#editMessage').val()
        };

        $.ajax({
            url: '/profilepage/GuestBookPage/updateGuestBook',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(updatedEntry),
            success: function(response) {
                $('#editGuestBookModal').modal('hide');
                alert('Guest book entry updated successfully.');
                location.reload();
            },
            error: function(xhr) {
                alert('Error updating guest book entry: ' + xhr.responseText);
            }
        });
    });


    function deleteGuestBookEntry(entryId) {
        $.ajax({
            url: '/profilepage/GuestBookPage/deleteGuestBook/' + entryId,
            type: 'DELETE',
            success: function(response) {
                alert('Guest book entry deleted successfully.');
                location.reload();
            },
            error: function(xhr) {
                alert('Error deleting guest book entry: ' + xhr.responseText);
            }
        });
    }

    function commentGuestBookEntry(entryId) {
        // 댓글 로직 구현
    }
</script>



<script>
    $(document).ready(function () {
        $('#guestbookForm').on('submit', function (e) {
            e.preventDefault(); // 폼 기본 제출 이벤트 방지

            var message = $('#guestbookMessage').val(); // textarea에서 메시지 내용을 가져옴
            var postData = {
                message: message // 메시지 내용
            };

            $.ajax({
                url: '/profilepage/GuestBookPage/addGuestBook', // 서버의 POST 엔드포인트
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(postData), // JSON 형식으로 변환
                success: function (response) {
                    alert('Guest book entry added successfully.'); // 성공 메시지 표시
                    $('#guestbookMessage').val(''); // 메시지 입력 필드 초기화
                    //페이지 새로고침
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert('Error adding guest book entry: ' + error); // 오류 메시지 표시
                }
            });
        });
    });
</script>

</body>
</html>