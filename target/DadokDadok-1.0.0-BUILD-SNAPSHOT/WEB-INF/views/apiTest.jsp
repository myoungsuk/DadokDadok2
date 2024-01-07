<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>

</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=feb6a3c31b035f2a61bd30ac29509330&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    // 주변 도서관을 검색하는 함수
    function searchNearbyLibrary(latitude, longitude) {
        var ps = new kakao.maps.services.Places();

        var callback = function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                console.log(result); // 검색 결과 확인

                // 여기서 result 배열에 검색된 '도서관' 목록이 있습니다.
                // 이를 원하는 방식으로 처리하실 수 있습니다.
            }
        };

        var keyword = '도서관'; // 검색할 키워드

        var options = {
            location: new kakao.maps.LatLng(latitude, longitude) // 현재 위치 좌표 설정
        };

        // 키워드로 장소를 검색합니다
        //ps.keywordSearch(keyword, placesSearchCB, options); // 수정된 부분: 콜백 함수로 placesSearchCB를 사용합니다.

        // 콘솔창에도 출력을 하고 키워드로 장소를 검색하는 코드
        // 키워드로 장소를 검색합니다
        ps.keywordSearch(keyword, function(result, status, pagination) {
            placesSearchCB(result, status, pagination);
            console.log(result); // 검색된 장소 정보를 콘솔에 출력
        }, options);
    }

    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB (data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();

            for (var i=0; i<data.length; i++) {
                displayMarker(data[i]);
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
            // 검색 결과를 모두 포함하고 난 후, 확대 레벨을 조정합니다.
            map.setLevel(5); // 원하는 확대 레벨로 설정, 필요에 따라 지도의 중심도 재조정
        }
    }

    // 중복 함수 제거 후 통합된 displayMarker 함수
    function displayMarker(place, customMessage) {
        var content = '<div style="padding:5px;font-size:12px;">' + (customMessage || place.place_name) + '</div>';
        var iwRemoveable = true;
        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x)
        });

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: content,
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });

        // 지도 중심좌표를 마커 위치로 변경합니다
        // 사용자 위치를 표시하는 경우에만 중심좌표를 변경하도록 조건을 추가합니다.
        if (customMessage) {
            map.setCenter(new kakao.maps.LatLng(place.y, place.x));
        }
    }

    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            // 현재 위치를 기준으로 검색하기 위해 검색 함수 호출
            searchNearbyLibrary(lat, lon);
        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을 때 기본 위치로 설정합니다

        var defaultLat = 37.566826, // 기본 위도 값
            defaultLon = 126.9786567; // 기본 경도 값

        // 현재 위치를 기준으로 검색하기 위해 검색 함수 호출
        var locPosition = new kakao.maps.LatLng(defaultLat, defaultLon);
        displayMarker({y: defaultLat, x: defaultLon}, "기본 위치입니다."); // 수정된 부분
    }




</script>
</body>
</html>