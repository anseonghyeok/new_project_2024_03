<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>



  <div class="bg-cover bg-no-repeat bg-center w-full h-80" style="background-image: url('/resource/image1.png');"></div>
<!-- <script>
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }

    function showPosition(pos) {
        console.log(pos);
        var latitude = pos.coords.latitude;
        var longitude = pos.coords.longitude;
        alert("현재 위치는 : " + latitude + ", "+ longitude);
    }

    // 페이지가 로드될 때 위치 정보를 가져옴
    window.onload = getLocation;
</script> -->
 
<%@ include file="../common/foot.jspf"%>
