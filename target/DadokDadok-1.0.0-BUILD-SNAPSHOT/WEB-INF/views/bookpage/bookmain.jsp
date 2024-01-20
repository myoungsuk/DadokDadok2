<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>BookMain</title>
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

        /* 추천 도서 카드 스타일링 */
        .hotTrend-books .card, .popular-books .card {
            transition: transform .2s; /* 호버 시 애니메이션 효과 */
            cursor: pointer; /* 마우스 포인터 모양 변경 */
        }

        /* 호버 효과 */
        .hotTrend-books .card:hover, .popular-books .card:hover {
            transform: scale(1.05); /* 카드 확대 */
        }

        /* 호버 시 그림자 효과 */
        .hotTrend-books .card:hover, .popular-books .card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 미디어 쿼리를 사용하여 반응형으로 한 줄에 3개씩 표시 */
        @media (min-width: 992px) {
            .hotTrend-books .col-lg-4, .popular-books .col-lg-4 {
                flex: 0 0 33.333333%;
                max-width: 33.333333%;
            }
        }

        @media (max-width: 991px) {
            .hotTrend-books .col-lg-4, .popular-books .col-lg-4 {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }

        @media (max-width: 767px) {
            .hotTrend-books .col-lg-4, .popular-books .col-lg-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }

        /* Custom CSS for five items per row */
        @media (min-width: 992px) {
            /* lg breakpoint */
            .col-custom-five {
                flex: 0 0 auto;
                width: 20%;
            }
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
                <h2>Book</h2>
                <ol>
                    <li><a href="../mainpage/index.jsp">Home</a></li>
                    <li>Book</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <section id="about-us" class="about-us">
        <div class="container">
            <h3 data-aos="fade-up">도서 검색</h3>
            <div class="row no-gutters text-center">
                <div class="book-search  d-flex align-items-stretch justify-content-center" data-aos="fade-right">
                    <!-- 도서 검색 폼 -->
                    <form action="/bookpage/booklist" method="get">
                        <div class="input-group" style="margin-bottom: 50px; width: 310%">
                            <input type="text" name="searchKeyword" placeholder="도서 검색" class="form-control">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary">검색</button>
                            </div>
                        </div>
                    </form>

                </div>
                <hr>
            </div>
        </div>
    </section>


    <section id="hotTrend-books" class="hotTrend-books section-bg">
        <div class="container">
            <div class="section-title" data-aos="fade-up">
                <h2>대출 급상승 <strong>도서</strong></h2>
                <p>3일간 대출빈도가 급상승한 도서입니다</p>
            </div>

            <div id="hotTrendBooksRow" class="row">
                <!-- 여기에 서버로부터 불러온 추천 도서 목록을 동적으로 삽입 -->
            </div>
        </div>
    </section>


    <section id="popular-books" class="popular-books">
        <div class="container">
            <div class="section-title" data-aos="fade-up">
                <h2>인기 <strong>도서</strong></h2>
                <p>독자들에게 가장 사랑받는 도서들을 소개합니다.</p>
            </div>

            <div id="popularBooksRow" class="row">
                <!-- 여기에 서버로부터 불러온 추천 도서 목록을 동적으로 삽입 -->
            </div>
        </div>
    </section>


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
    // results:[
    //     {
    //         result:{
    //             date: "2024-01-10",
    //             docs:[
    //                 {
    //                     doc: {
    //                         no:"1",
    //                         isbn13: "9791188331790",
    //                         bookname: "코딩을 지탱하는 기술",
    //                         authors: "김태곤",
    //                         publisher: "위키북스",
    //                         publication_year: "2020",
    //                         class_no: "005.133",
    //                         class_nm: "컴퓨터프로그램"
    //                     }
    //                 },
    //                 {
    //                     doc: {
    //                         no:"2",
    //                         isbn13: "9791188331790",
    //                         bookname: "코딩을 지탱하는 기술",
    //                         authors: "김태곤",
    //                         publisher: "위키북스",
    //                         publication_year: "2020",
    //                         class_no: "005.133",
    //                         class_nm: "컴퓨터프로그램"
    //                     }
    //                 }
    //             ]
    //         }
    //     }
    // ]
    var authKey = 'c500550c260a842b762bc86dc21ee159406d97cfdc35d10d71726d7a7d998b6b';

    function formatDate(date) {
        var d = new Date(date);
        d.setDate(d.getDate() - 2); // 하루 전 날짜로 설정

        var month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    function increaseDateByOne(dateString) {
        var date = new Date(dateString);
        date.setDate(date.getDate() + 2); // 날짜에 1을 더합니다.

        var month = '' + (date.getMonth() + 1),
            day = '' + date.getDate(),
            year = date.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    function fetchHotTrendBooks() {
        var searchDt = formatDate(new Date()); // 오늘 날짜를 'yyyy-mm-dd' 형식으로 설정
        $.ajax({
            url: 'http://data4library.kr/api/hotTrend',
            type: 'GET',
            data: {
                authKey: authKey,
                searchDt: searchDt,
                format: 'json'
            },
            success: function (response) {
                var results = response.response.results; // results 배열입니다.
                var html = '';

                // results 배열을 순회합니다.
                results.forEach(function (resultElement) {
                    var date = increaseDateByOne(resultElement.result.date) // 날짜 정보
                    html += '<h4>' + date + '</h4>'; // 날짜별 제목을 추가합니다.
                    var docs = resultElement.result.docs; // docs 배열

                    // docs 배열을 순회합니다.
                    for (var i = 0; i < docs.length && i < 5; i++) { // 하루에 최대 5권까지만 가져옵니다.
                        var book = docs[i].doc; // doc 객체 안의 책 정보
                            html += '<div class="col-custom-five mb-4">' +
                                '<div class="card h-100 book-card" data-isbn="' + book.isbn13 + '">' +
                                '<img src="' + book.bookImageURL + '" class="card-img-top" alt="' + book.bookname + '">' +
                                '<div class="card-body">' +
                                '<h5 class="card-title book-title">' + book.bookname + '</h5>' +
                                '<p class="card-text">' + book.authors + '</p>' +
                                '<p class="card-text">' + book.publisher + ', ' + book.publication_year + '</p>' +
                                '<p class="card-text">' + book.class_no + '</p>' +
                                '<p class="card-text">' + book.class_nm + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        }
                });
                $('#hotTrendBooksRow').html(html); // HTML을 #hotTrendBooksRow에 삽입합니다.
            },
            error: function () {
                alert("급상승 도서를 불러오는 데 실패했습니다.");
            }
        });
    }

    // CSS for hover effects
    $(document).ready(function () {
        $('head').append('<style>' +
            '.book-card:hover .book-title { color: #007bff; }' +
            '.book-card:hover { box-shadow: 0 5px 15px rgba(0,0,0,.1); transform: translateY(-2px); }' +
            '</style>');

        // Click event for each book card
        $('#hotTrendBooksRow').on('click', '.book-card', function () {
            var isbn = $(this).data('isbn');
            window.location.href = '/bookpage/bookdetail/' + isbn;
        });
    });

    $(document).ready(function () {
        fetchHotTrendBooks();
    });
</script>


</body>
</html>