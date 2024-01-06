<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>


    <!-- Favicons -->
    <link href="../resources/assets/img/favicon.png" rel="icon">
    <link href="../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../resources/assets/css/style.css" rel="stylesheet">

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
                <h2>Register</h2>
                <ol>
                    <li><a href="index.jsp">Home</a></li>
                    <li>register</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= 설정 섹션 시작 ======= -->
    <section id="sign-up" class="sign-up">
        <div class="container mt-5">
            <h2 class="mb-4">회원가입</h2>
            <form id="signupForm" action="/loginpage/signup" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                </div>

                <div class="form-group">
                    <label for="nickname">Nickname</label>
                    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Nickname"
                           required>
                </div>

                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="*Email" required>
                <button type="button" id="checkEmail" class="btn btn-info btn-sm">이메일 중복 확인</button>
                <div id="emailFeedback" class="invalid-feedback" style="display: none;">
                    이메일이 이미 사용 중입니다.
                </div>
                <div id="emailFeedbackSuccess" class="valid-feedback" style="display: none;">
                    사용 가능한 이메일입니다.
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password"
                           required>
                </div>

                <div class="form-group">
                    <label for="phoneNum">Phone</label>
                    <input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="Phone" required>
                </div>

                <div style="text-align: center;">
                    <button type="submit" class="btn btn-primary" id="signupButton">회원가입하기</button>
                </div>
            </form>
        </div>
    </section>
</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!-- End Footer -->

<!-- Vendor JS Files -->
<script src="../resources/assets/vendor/aos/aos.js"></script>
<script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="../resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../resources/assets/js/main.js"></script>

<script>
    $(document).ready(function () {
        // 초기 상태에서 '회원가입하기' 버튼 비활성화
        $('#signupButton').prop('disabled', true);

        $('#checkEmail').click(function () {
            var email = $('#email').val();
            // Hide any previous feedback
            $('#emailFeedback').hide();
            $('#emailFeedbackSuccess').hide();

            $.ajax({
                url: '/loginpage/check-email',
                type: 'POST',
                data: {'email': email},
                success: function (response) {
                    // Show the appropriate message based on the response
                    if (response.exists) {
                        $('#emailFeedback').show();
                        $('#signupButton').prop('disabled', true); // 이메일 중복 시 버튼 비활성화
                    } else {
                        $('#emailFeedbackSuccess').show();
                        $('#signupButton').prop('disabled', false); // 이메일 사용 가능 시 버튼 활성화
                    }
                },
                error: function () {
                    // Handle errors here
                    alert('Error checking email');
                    $('#signupButton').prop('disabled', true); // 에러 발생 시 버튼 비활성화
                }
            });
        });

        // 회원가입 폼 제출 시 유효성 검사
        $('#signupForm').submit(function (event) {
            // 이메일 중복 검사 없이 폼 제출 시도 방지
            if ($('#signupButton').prop('disabled')) {
                event.preventDefault();
                alert('이메일 중복 확인이 필요합니다.');
            }
        });
    });

</script>


</body>
</html>