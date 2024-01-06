<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="apikey.js"></script>
<%--        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=feb6a3c31b035f2a61bd30ac29509330"></script>--%>
        <script type="text/javascript">
            let mapkey = ""
            $.ajax({
                url: "library_getKakaoMapApi",
                success : function(key){
                    mapkey = key
                }
            })
        </script>



    <script type="text/javascript">
        $(function () {
            $('.pages').click(function () {
                $.ajax({
                    url: "library_list4",
                    data: {
                        page: $(this).text()
                    },
                    success: function (table) {
                        $('#result').html(table)
                    }
                })
            })
        })
    </script>
    <style>
        /* Some basic custom styles */
        .container {
            margin-top: 20px;
        }

        .container2 {
            display: flex;
        }

        .left-panel, .right-panel {
            flex: 1;
            border: 0px solid #ccc;
            padding: 20px;
        }

        .pages {
            margin: 5px;
        }

        /* 맵을 표시할 영역의 스타일을 지정할 수 있습니다. */
        #map {
            width: 50%;
            height: 300px; /* 맵의 높이 설정 */
        }
    </style>
</head>
<body>
<div class="container2">
    <div class="left-panel">
        <!-- 좌측 패널의 내용 -->
        <h2>도서관 찾기</h2>

        <div class="container mt-4">
            <p>이름으로 찾기</p>
            <!-- 검색창 -->
            <form class="form-inline">
                <div class="form-group">
                    <input type="text" class="form-control mr-2" placeholder="검색어를 입력하세요">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </form>
        </div>

        <div class="container mt-4">
            <p>지역으로 찾기</p>
            <!-- 지역별 카테고리 검색창 -->
            <form class="form-inline">
                <div class="form-group mr-2">
                    <select class="form-control">
                        <option selected disabled>지역 선택</option>
                        <option value="seoul">서울</option>
                        <option value="busan">부산</option>
                        <option value="incheon">인천</option>
                        <!-- 여기에 추가적인 지역 옵션을 넣어주세요 -->
                    </select>
                </div>
                <div class="form-group mr-2">
                    <select class="form-control">
                        <option selected disabled>카테고리 선택</option>
                        <option value="category1">카테고리 1</option>
                        <option value="category2">카테고리 2</option>
                        <option value="category3">카테고리 3</option>
                        <!-- 여기에 추가적인 카테고리 옵션을 넣어주세요 -->
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
    </div>
    <div class="right-panel" id="map">
        <!-- 우측 패널의 내용 -->
        <h2>Right Panel</h2>
        <p>This is the content of the right panel.</p>
    </div>
</div>

<!-- 맵을 표시할 영역 -->
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 10 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }
</script>


<div class="container">
    <div id="result">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th>도서관코드</th>
                <th>도서관명</th>
                <th>도서관주소</th>
                <th>도서관전화번호</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="libraryVO">
                <tr>
                    <td>${libraryVO.lib_code }</td>
                    <td><a href="library_one?lib_code=${libraryVO.lib_code }">${libraryVO.lib_name }</a></td>
                    <td>${libraryVO.lib_address }</td>
                    <td>${libraryVO.lib_tel }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="container mt-4">
<%--    <%--%>
<%--        int pages = (int) request.getAttribute("pages");--%>
<%--        for (int p = 1; p <= pages; p++) {--%>
<%--    %>--%>
<%--    <button class="btn btn-outline-success pages"><%=p%>--%>
<%--    </button>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
</div>

<%--<div class="container mt-2">--%>
<%--    <p>전체 도서관 수 : ${count }개 </p>--%>
<%--    <p>전체 페이지 수 : ${pages }개</p>--%>
<%--</div>--%>

<script>
    $(function() {
        $.ajax({
            url: "/map",
            type: "GET",
            success: function(apiKey) {
                // 서버로부터 받은 API 키를 사용하여 카카오 지도 SDK를 로드합니다.
                <!-- apikey 로그 -->
                console.log(apiKey)
                $.getScript(`//dapi.kakao.com/v2/maps/sdk.js?appkey=` + apiKey, function() {
                    // 카카오 지도 SDK 초기화 코드
                    // 지도 생성 로직...
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                        mapOption = {
                            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                            level: 10 // 지도의 확대 레벨
                        };

                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
                    if (navigator.geolocation) {

                        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                        navigator.geolocation.getCurrentPosition(function (position) {

                            var lat = position.coords.latitude, // 위도
                                lon = position.coords.longitude; // 경도

                            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

                            // 마커와 인포윈도우를 표시합니다
                            displayMarker(locPosition, message);

                        });

                    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

                        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                            message = 'geolocation을 사용할수 없어요..'

                        displayMarker(locPosition, message);
                    }

                    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
                    function displayMarker(locPosition, message) {

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: locPosition
                        });

                        var iwContent = message, // 인포윈도우에 표시할 내용
                            iwRemoveable = true;

                        // 인포윈도우를 생성합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            content: iwContent,
                            removable: iwRemoveable
                        });

                        // 인포윈도우를 마커위에 표시합니다
                        infowindow.open(map, marker);

                        // 지도 중심좌표를 접속위치로 변경합니다
                        map.setCenter(locPosition);
                    }
                });
            },
            error: function(xhr, status, error) {
                // API 키를 불러오는 데 실패한 경우 처리
                console.error("API Key fetch error: ", status, error);
            }
        });
    });
</script>

</body>
</html>