<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookDetail</title>
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
        .recommended-books .card, .manyBooksReader-books .card {
            transition: transform .2s; /* 호버 시 애니메이션 효과 */
            cursor: pointer; /* 마우스 포인터 모양 변경 */
        }

        /* 호버 효과 */
        .recommended-books .card:hover, .manyBooksReader-books .card:hover {
            transform: scale(1.05); /* 카드 확대 */
        }

        /* 호버 시 그림자 효과 */
        .recommended-books .card:hover, .manyBooksReader-books .card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 미디어 쿼리를 사용하여 반응형으로 한 줄에 3개씩 표시 */
        @media (min-width: 992px) {
            .recommended-books .col-lg-4, .manyBooksReader-books .col-lg-4 {
                flex: 0 0 33.333333%;
                max-width: 33.333333%;
            }
        }

        @media (max-width: 991px) {
            .recommended-books .col-lg-4, .manyBooksReader-books .col-lg-4 {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }

        @media (max-width: 767px) {
            .recommended-books .col-lg-4, .manyBooksReader-books .col-lg-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }
        /* Custom CSS for five items per row */
        @media (min-width: 992px) { /* lg breakpoint */
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

    <section id="book-details" class="book-details">
        <div class="container">
            <div id="bookDetailsCard" class="card">
                <!-- The src attribute of the image and the text content of the p tags will be set dynamically via JavaScript -->
                <img id="bookCover" alt="Book Cover" class="card-img-top">
                <div class="card-body">
                    <h5 id="bookTitle" class="card-title"></h5>
                    <p id="bookAuthor" class="card-text"></p>
                    <p id="bookPublisher" class="card-text"></p>
                    <p id="bookClass_no" class="card-text"></p>
                    <p id="bookClass_nm" class="card-text"></p>
                    <p id="bookPublication_year" class="card-text"></p>
                    <p id="bookYear" class="card-text"></p>
                    <p id="bookIsbn" class="card-text"></p>
                    <p id="bookDescription" class="card-text"></p>
                    <!-- Additional divs for loan information will be added here by the JavaScript -->
                </div>
            </div>
            <!-- Total Loan Information -->
            <div class="card my-3">
                <div class="card-header">
                    <h4>Total Loan Information</h4>
                </div>
                <div class="card-body">
                    <p class="card-text"><strong>Ranking:</strong> <span id="totalRanking"></span></p>
                    <p class="card-text"><strong>Name:</strong> <span id="totalName"></span></p>
                    <p class="card-text"><strong>Total Loans:</strong> <span id="totalLoanCount"></span></p>
                </div>
            </div>


            <!-- Age-Specific Loan Information -->
            <div>
                <h4>&nbsp;&nbsp;Age-Specific Loan Information</h4>
                <ul id="ageSpecificLoanInfo" class="list-group"></ul>
            </div>


        </div>
    </section>


    <!-- 추천 도서 섹션 -->
    <section id="recommended-books" class="recommended-books mt-4">
        <div class="container">
            <h3>이 책과 비슷한 책들을 보여드릴게요!</h3>
            <br>
            <div id="recommendedBooksRow" class="row">
                <!-- 여기에 서버로부터 불러온 추천 도서 목록을 동적으로 삽입 -->
            </div>
        </div>
    </section>

    <!-- 다독자를 위한 추천 도서 섹션 -->
    <section id="manyBooksReader-books" class="manyBooksReader-books mt-4">
        <div class="container">
            <h3>책을 많이 읽으시는 분들을 위한 맞춤 추천!</h3>
            <br>
            <div id="manyBooksReaderRow" class="row">
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
    var authKey = 'c500550c260a842b762bc86dc21ee159406d97cfdc35d10d71726d7a7d998b6b';
    // 이전에 제공된 fetchRecommendedBooks 함수 내부에 코드 추가
    // 각 책 카드에 마우스 호버 효과를 추가하기 위한 코드
    $('#recommendedBooksRow').on('mouseenter', '.card', function () {
        $(this).addClass('shadow-lg').css('cursor', 'pointer');
    });

    $('#recommendedBooksRow').on('mouseleave', '.card', function () {
        $(this).removeClass('shadow-lg');
    });

    //상세 정보 페이지의 JavaScript 예시
    // 서버로부터 도서의 상세 정보를 가져오는 함수
    function fetchBookDetails(isbn) {
        $.ajax({
            url: 'http://data4library.kr/api/srchDtlList',
            type: 'GET',
            data: {
                authKey: authKey,
                isbn13: isbn,
                loaninfoYN: 'Y',
                displayInfo: 'age',
                format: 'json'
            },
            dataType: 'json',
            success: function (response) {
                if (response && response.response && response.response.detail && response.response.detail.length > 0) {
                    var bookDetails = response.response.detail[0].book;
                    var loanInfo = response.response.loanInfo ? response.response.loanInfo[0] : {};
                    var ageResult = response.response.loanInfo ? response.response.loanInfo[1] : {};


                    $('#bookDetailsCard img').attr('src', bookDetails.bookImageURL).css({
                        'width': '800px',
                        'height': 'auto',
                        'display': 'block',
                        'margin-left': 'auto',
                        'margin-right': 'auto'
                    });

                    $('#bookDetailsCard .card-title').text(bookDetails.bookname);
                    $('#bookDetailsCard .card-text').first().text('저자: ' + bookDetails.authors);
                    $('#bookDetailsCard .card-text').eq(1).text('출판사: ' + bookDetails.publisher);
                    $('#bookDetailsCard .card-text').eq(2).text('분류 번호: ' + bookDetails.class_no);
                    $('#bookDetailsCard .card-text').eq(3).text('분류 장르: ' + bookDetails.class_nm);
                    $('#bookDetailsCard .card-text').eq(4).text('출판 연도: ' + bookDetails.publication_year);
                    $('#bookDetailsCard .card-text').eq(5).text('ISBN: ' + bookDetails.isbn13);
                    $('#bookDetailsCard .card-text').last().text(bookDetails.description);

                    updateLoanInfo(loanInfo, ageResult);
                    // http://localhost:8080/bookpage/bookdetail/9788936434267
                } else {
                    alert('상세 정보를 불러올 수 없습니다.');
                }
            },
            error: function () {
                alert('상세 정보를 불러오는 데 실패했습니다.');
            }
        });
    }

    function fetchRecommendedBooks(isbn) {
        $.ajax({
            url: 'http://data4library.kr/api/recommandList',
            type: 'GET',
            data: {
                authKey: authKey,
                isbn13: isbn,
                format: 'json'
            },
            success: function (response) {
                if (response.response.resultNum > 0) {
                    var books = response.response.docs;
                    console.log(books);
                    var html = '';
                    for (var i = 0; i < books.length && i < 10; i++) {
                        var book = books[i].book;
                        html += '<div class="col-custom-five mb-4">' + // Adjusted for 5 books per row
                            '<div class="card h-100 book-card" data-isbn="' + book.isbn13 + '">' + // Added class for hover effect and data attribute for ISBN
                            '<img src="' + book.bookImageURL + '" class="card-img-top" alt="' + book.bookname + '">' +
                            '<div class="card-body">' +
                            '<h5 class="card-title book-title">' + book.bookname + '</h5>' + // Added class for title hover effect
                            '<p class="card-text">' + book.authors + '</p>' +
                            '<p class="card-text">' + book.publisher + ', ' + book.publication_year + '</p>' +
                            '<p class="card-text">' + book.class_no + '</p>' +
                            '<p class="card-text">' + book.class_nm + '</p>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                    }
                    $('#recommendedBooksRow').html(html);
                }
            },
            error: function () {
                alert("추천 도서를 불러오는 데 실패했습니다.");
            }
        });
    }

    function fetchManyBooksReader(isbn) {
        $.ajax({
            url: 'http://data4library.kr/api/recommandList',
            type: 'GET',
            data: {
                authKey: authKey,
                type: 'reader',
                isbn13: isbn,
                format: 'json'
            },
            success: function (response) {
                if (response.response.resultNum > 0) {
                    var books = response.response.docs;
                    var html = '';
                    for (var i = 0; i < books.length && i < 10; i++) {
                        var book = books[i].book;
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
                    $('#manyBooksReaderRow').html(html); // 이 부분을 수정했습니다.
                } else {
                    alert("추천 도서가 없습니다.");
                }
            },
            error: function () {
                alert("추천 도서를 불러오는 데 실패했습니다.");
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
        $('#recommendedBooksRow').on('click', '.book-card', function () {
            var isbn = $(this).data('isbn');
            window.location.href = '/bookpage/bookdetail/' + isbn;
        });
        // Click event for each book card
        $('#manyBooksReaderRow').on('click', '.book-card', function () {
            var isbn = $(this).data('isbn');
            window.location.href = '/bookpage/bookdetail/' + isbn;
        });
    });


    // 사용 예시: 페이지 로드 시 해당 함수를 호출합니다.
    $(document).ready(function () {
        var isbn = window.location.pathname.split('/').pop(); // 현재 페이지의 URL에서 ISBN을 추출합니다.
        fetchRecommendedBooks(isbn);
        fetchBookDetails(isbn); // 상세 정보 가져오기
        fetchManyBooksReader(isbn);
    });

    // After fetching the details, update the HTML elements
    function updateLoanInfo(loanInfo, ageResult) {
        if (ageResult.ageResult) {
            ageResult.ageResult.forEach(function (ageInfo) {
                var ageLoanInfoHtml = '<li class="list-group-item">' +
                    '<strong>' + ageInfo.age.name + ' 연령대 대출 순위:</strong> ' + ageInfo.age.ranking +
                    ' <strong>대출 건수:</strong> ' + ageInfo.age.loanCnt +
                    '</li>';
                $('#ageSpecificLoanInfo').append(ageLoanInfoHtml);
            });
        }
        $('#totalRanking').text(loanInfo.Total.ranking);
        $('#totalName').text(loanInfo.Total.name);
        $('#totalLoanCount').text(loanInfo.Total.loanCnt);
    }
</script>
</body>
</html>
