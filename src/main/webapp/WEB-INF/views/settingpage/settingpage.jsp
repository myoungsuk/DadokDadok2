<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Setting</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../../../resources/assets/img/favicon.png" rel="icon">
    <link href="../../../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../../../resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Template Main CSS File -->
    <link href="../../../resources/assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Flattern
    * Updated: Sep 18 2023 with Bootstrap v5.3.2
    * Template URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->

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
        /* 푸터를 화면 하단에 고정 */
        /*#footer {*/
        /*    position: fixed;*/
        /*    left: 0;*/
        /*    bottom: 0;*/
        /*    width: 100%;*/
        /*    !* 푸터의 높이 및 기타 스타일링을 여기에 추가하세요 *!*/
        /*}*/

        #profileForm {
            text-align: center;
            margin-top: 20px;
        }

        #userImg {
            display: none; /* 파일 입력 필드를 숨깁니다 */
        }

        #userImg + label {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f5f5f5;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #userImg + label:hover {
            background-color: #e1e1e1;
        }

        .img-fluid {
            border-radius: 50%; /* 이미지를 원형으로 만듭니다 */
            width: 200px;
            height: 200px;
            object-fit: cover;
            border: 2px solid #ddd;
            margin-bottom: 10px;
        }

        .submit-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #45a049;
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
                <h2>Setting</h2>
                <ol>
                    <li><a href="../mainpage/index.jsp">Home</a></li>
                    <li>Setting</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= 설정 섹션 시작 ======= -->
    <section id="settings" class="settings">
        <div class="container my-5">
            <%--            <h1 class="text-center mb-4">설정</h1>--%>
            <div class="row">
                <div class="col-md-4">
                    <!-- 설정 탭 내비게이션 -->
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home"
                           role="tab" aria-controls="v-pills-home" aria-selected="true">프로필 정보 수정</a>
                        <a class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile"
                           role="tab" aria-controls="v-pills-profile" aria-selected="false">비밀번호 변경</a>
                        <a class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" href="#v-pills-messages"
                           role="tab" aria-controls="v-pills-messages" aria-selected="false">알림(구현 예정)</a>
                        <!-- 회원탈퇴 -->
                        <a class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" href="#v-pills-settings"
                           role="tab" aria-controls="v-pills-settings" aria-selected="false">회원탈퇴</a>
                    </div>
                </div>
                <div class="col-md-8">
                    <!-- 설정 내용 -->
                    <div class="tab-content" id="v-pills-tabContent">
                        <!-- 프로필 설정 탭 -->
                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                             aria-labelledby="v-pills-home-tab">

                            <!-- 프로필 설정 폼 -->
                            <form id="profileForm" action="/settingpage/update-profile" method="post"
                                  enctype="multipart/form-data">
                                <input type="file" id="userImg" name="userImg" accept="image/*"
                                       onchange="chooseImage(this)">
                                <label for="userImg" class="img-upload-label">
                                    <c:set var="dbPath" value="/Users/Kang/Downloads/apache-tomcat-8.5.95/bin/upload-dir/"/>
                                    <c:set var="defaultImagePath" value="${pageContext.request.contextPath}/resources/assets/img/profile/profile.png"/>
                                    <c:set var="imagePath" value="${member.userImg}"/>
                                    <c:set var="relativePath" value="${fn:replace(imagePath, dbPath, '')}"/>
                                    <c:choose>
                                        <c:when test="${not empty imagePath}">
                                            <!-- 사용자가 이미지를 업로드한 경우 -->
                                            <img src="${pageContext.request.contextPath}/upload-dir/${relativePath}" class="img-fluid" alt="Profile">
                                        </c:when>
                                        <c:otherwise>
                                            <!-- 기본 이미지 표시 -->
                                            <img src="${defaultImagePath}" class="img-fluid" alt="Profile">
                                        </c:otherwise>
                                    </c:choose>

                                    <span>이미지 선택</span>
                                </label>
                                <button type="submit" class="submit-btn">프로필 사진 변경</button>
                            </form>

                            <form action="/settingpage/update" method="post" enctype="multipart/form-data" class="mt-3">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                <!-- 이름 필드 -->
                                <div class="form-group mb-4">
                                    <label for="name">이름</label>
                                    <input type="text" class="form-control bg-light" id="name" name="name"
                                           value="${member.name}" readonly data-toggle="tooltip" data-placement="top"
                                           title="변경할 수 없는 사안입니다">
                                </div>

                                <!-- 이메일 필드 -->
                                <div class="form-group mb-4">
                                    <label for="email">이메일</label>
                                    <input type="email" class="form-control bg-light" id="email" name="email"
                                           value="${member.email}" readonly data-toggle="tooltip" data-placement="top"
                                           title="변경할 수 없는 사안입니다">
                                </div>

                                <!-- 전화번호 필드 (Read-only with Tooltip) -->
                                <div class="form-group mb-4">
                                    <label for="phoneNum">전화번호</label>
                                    <input type="text" class="form-control bg-light" id="phoneNum" name="phoneNum"
                                           value="${member.phoneNum}" readonly data-toggle="tooltip"
                                           data-placement="top" title="변경할 수 없는 사안입니다">
                                </div>

                                <!-- 닉네임 필드 -->
                                <div class="form-group mb-4">
                                    <label for="nickname">닉네임</label>
                                    <input type="text" class="form-control" id="nickname" name="nickname"
                                           value="${member.nickname}" required>
                                </div>

                                <!-- 자기소개 필드 -->
                                <div class="form-group mb-4">
                                    <label for="info">자기소개</label>
                                    <textarea class="form-control" id="info" name="info"
                                              rows="3">${member.info}</textarea>
                                </div>

                                <!-- 저장 버튼 -->
                                <button type="submit" class="btn btn-primary">저장하기</button>
                            </form>
                        </div>


                        <!-- 비밀번호 변경 탭 -->
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <!-- 계정 설정 폼 -->
                            <form id="passwordChangeForm">
                                <div class="mb-3">
                                    <label for="currentPassword" class="form-label">현재 비밀번호</label>
                                    <input type="password" class="form-control" id="currentPassword" placeholder="현재 비밀번호를 입력하세요" required>
                                </div>
                                <div class="mb-3">
                                    <label for="newPassword" class="form-label">새 비밀번호</label>
                                    <input type="password" class="form-control" id="newPassword" placeholder="새 비밀번호를 입력하세요" required>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmNewPassword" class="form-label">새 비밀번호 확인</label>
                                    <input type="password" class="form-control" id="confirmNewPassword" placeholder="새 비밀번호를 다시 입력하세요" required>
                                </div>
                                <button type="button" id="submitPasswordChange" class="btn btn-primary">변경 사항 저장</button>
                            </form>
                        </div>


                        <!-- 알림 설정 탭 -->
                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
                             aria-labelledby="v-pills-messages-tab">
                            <!-- 알림 설정 폼 구현 -->
                            <form>
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="emailNotifications">
                                    <label class="form-check-label" for="emailNotifications">이메일 알림 받기</label>
                                </div>
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="smsNotifications">
                                    <label class="form-check-label" for="smsNotifications">SMS 알림 받기</label>
                                </div>
                                <button type="submit" class="btn btn-primary">설정 저장</button>
                            </form>
                        </div>

                        <!-- 회원탈퇴 설정 탭 -->
                        <div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
                             aria-labelledby="v-pills-settings-tab">
                            <form action="/settingpage/delete" method="post">
                                <h5>회원 탈퇴 전 주의 사항</h5>
                                <ul>
                                    <li>계정을 삭제하면 모든 데이터가 영구적으로 삭제됩니다.</li>
                                    <li>계정 삭제 전 데이터 백업을 권장합니다.(문의사항으로 연락 주세요)</li>
                                </ul>
                                <div class="form-group">
                                    <label for="feedback">탈퇴 이유 (선택사항):</label>
                                    <textarea class="form-control" id="feedback" name="feedback" rows="3"
                                              placeholder="여기에 입력하세요"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input type="checkbox" required> 위 사항을 모두 확인하였으며, 회원 탈퇴를 원합니다.
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-danger"
                                        onclick="return confirm('정말로 계정을 삭제하시겠습니까?');">회원 탈퇴
                                </button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ======= 설정 섹션 끝 ======= -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<!-- End Footer -->

<!-- Vendor JS Files -->
<script src="../../../resources/assets/vendor/aos/aos.js"></script>
<script src="../../../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../../../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../../../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../../../resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="../../../resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../../../resources/assets/js/main.js"></script>

<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip(); // Initialize tooltips
    });

    function chooseImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var imgElement = document.querySelector('#profileForm .img-fluid');
                imgElement.src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(document).ready(function() {
        $('#submitPasswordChange').on('click', function() {
            var currentPassword = $('#currentPassword').val();
            var newPassword = $('#newPassword').val();
            var confirmNewPassword = $('#confirmNewPassword').val();

            $.ajax({
                url: '/settingpage/change-password',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    currentPassword: currentPassword,
                    newPassword: newPassword,
                    confirmNewPassword: confirmNewPassword
                }),
                success: function(response) {
                    // 비밀번호 변경 성공 시, 사용자에게 알립니다.
                    alert('비밀번호가 변경되었습니다.');
                    // 로그인 성공 후 로그아웃 페이지로 리다이렉션
                    window.location.href = '/loginpage/customLogout';
                },
                error: function(xhr, status, error) {
                    // 비밀번호 변경 실패 시, 오류 메시지를 사용자에게 보여줍니다.
                    alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.');
                }
            });
        });
    });
</script>

</body>

</html>