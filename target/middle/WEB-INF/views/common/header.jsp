<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- 공통 CSS 및 Head 영역 -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Respot - 채용 및 커리어 플랫폼</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: { primary: "#3b82f6", secondary: "#64748b" },
          borderRadius: {
            button: "8px",
          },
        },
      },
    };
  </script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet" />
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
    }
    .dropdown { display: none; }
    .dropdown-trigger:hover .dropdown { display: block; }
  </style>
</head>
<body class="bg-gray-50 min-h-screen">

<!-- 구글 번역 -->
<div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script>
  function googleTranslateElementInit() {
    new google.translate.TranslateElement({ pageLanguage: 'ko', autoDisplay: false }, 'google_translate_element');
  }
</script>

  <!-- 구글 지도 API 스크립트 -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB79rVj--SmRgODMNQA8mrkhVRlYDg2Pz0"></script>
  <style>
    /* 지도 크기 지정 */
    #map {
      width: 100%;
      height: 500px;
    }
  </style>
  
  <script>
    // 서버에서 받은 위도, 경도 값을 숫자로 받음 (null 체크 포함)
    const myLat = ${freeboard.latitude != null ? freeboard.latitude : 37.5665};
    const myLng = ${freeboard.longitude != null ? freeboard.longitude : 126.9780};

    function initMap() {
      // 지도 생성
      const map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: myLat, lng: myLng },
        zoom: 17
      });

      // 마커 생성
      new google.maps.Marker({
        position: { lat: myLat, lng: myLng },
        map: map,
        title: "위치"
      });
    }

    window.onload = initMap;
  </script>
  


<!-- 네비게이션 바 -->
<header class="bg-white shadow-sm sticky top-0 z-50">
  <div class="container mx-auto px-4 py-3">
    <div class="flex items-center justify-between">
      <!-- 로고 -->
      <a href="${pageContext.request.contextPath}/main_recru" class="font-['Pacifico'] text-2xl">
        <span class="text-primary">Re</span><span class="text-gray-800">spot</span>
      </a>

      <!-- 메뉴 -->
      <nav class="hidden md:flex space-x-8">
        <div class="dropdown-trigger relative group">
          <button class="text-gray-700 font-medium hover:text-primary py-2">채용공고</button>
          <div class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10">
            <a href="${pageContext.request.contextPath}/koreaRecruit/koreaRecruit_List" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">국내공고</a>
            <a href="${pageContext.request.contextPath}/overseaRecruit/overseaRecruit_List" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">해외공고</a>
          </div>
        </div>

        <div class="dropdown-trigger relative group">
          <button class="text-gray-700 font-medium hover:text-primary py-2">이력서</button>
          <div class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10">
            
            <a href="${pageContext.request.contextPath}/resume/resume_Write" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">이력서 작성</a>
          </div>
        </div>

        <a href="${pageContext.request.contextPath}/template/templatelist" class="text-gray-700 font-medium hover:text-primary py-2">템플릿</a>

        <!-- <div class="dropdown-trigger relative group">
          <button class="text-gray-700 font-medium hover:text-primary py-2">커리어</button>
          <div class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10">
            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">합격 이력서</a>
            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">합격 자기소개서</a>
            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">면접 후기</a>
            <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">기업 리뷰</a>
          </div>
        </div> -->

        <div class="dropdown-trigger relative group">
          <button class="text-gray-700 font-medium hover:text-primary py-2">게시판</button>
          <div class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10">
            <a href="${pageContext.request.contextPath}/user/qna/list" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">1:1 문의</a>
            <a href="${pageContext.request.contextPath}/user/free/list" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">자유게시판</a>
            <a href="${pageContext.request.contextPath}/chat" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">자주 묻는 질문</a>
          </div>
        </div>
      </nav>

      <!-- 로그인/회원가입 -->
      <div class="flex items-center space-x-4">
        <c:choose>
          <c:when test="${not empty sessionScope.loginUser}">
            <span class="text-gray-700 font-medium">${sessionScope.loginUser.username} 님</span>
            <%-- <a href="${pageContext.request.contextPath}/logout" class="text-gray-600 hover:underline">마이페이지</a> --%>
            <%-- <a href="${pageContext.request.contextPath}/login/mypage" class="text-gray-600 hover:underline">마이페이지</a> --%>
            <a href="${pageContext.request.contextPath}/resume/resume_Mylist?mkey=${sessionScope.loginUser.mkey}" class="text-gray-600 hover:underline">내 이력서</a>
            <a href="${pageContext.request.contextPath}/logout" class="text-gray-600 hover:underline">로그아웃</a>
          </c:when>
          <c:otherwise>
            <a href="#" onclick="document.getElementById('loginModal').classList.remove('hidden')" class="text-gray-700 hover:underline">로그인</a>
            <a href="${pageContext.request.contextPath}/login/signupUser" class="bg-primary text-white px-4 py-2 rounded-button text-sm font-medium hover:bg-blue-600">회원가입</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</header>

<!-- 로그인 모달 -->
<div id="loginModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50 hidden">
  <div class="bg-white p-8 rounded-xl w-full max-w-md relative shadow-lg">
    <button onclick="document.getElementById('loginModal').classList.add('hidden')" class="absolute top-2 right-2 text-gray-500 hover:text-black text-xl">&times;</button>
    <h2 class="text-2xl font-bold text-center text-blue-600 mb-6">로그인</h2>
    <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-5">
      <div>
        <label for="id" class="block text-gray-700 mb-1">ID:</label>
        <input type="text" id="id" name="id" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <div>
        <label for="pw" class="block text-gray-700 mb-1">PASSWORD:</label>
        <input type="password" id="pw" name="pw" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 font-semibold">로그인</button>
    </form>
    <div class="text-center mt-4 text-sm text-gray-600">
      계정이 없으신가요?
      <a href="${pageContext.request.contextPath}/login/signupUser" class="text-blue-600 hover:underline ml-1">회원가입</a>
      <a href="${pageContext.request.contextPath}/login/signupCorp" class="text-blue-600 hover:underline ml-1">기업가입</a>
    </div>
  </div>
</div>