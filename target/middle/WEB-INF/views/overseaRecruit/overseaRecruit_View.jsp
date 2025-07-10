<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

<%-- <!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>채용 상세 정보</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: { primary: "#3b82f6", secondary: "#64748b" },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
    </script>
    
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"
    />
    <style>
      :where([class^="ri-"])::before { content: "\f3c2"; }
      body {
      font-family: 'Noto Sans KR', sans-serif;
      }
      .dropdown {
      display: none;
      }
      .dropdown-trigger:hover .dropdown {
      display: block;
      }
      .hero-section {
      background-image: url('https://readdy.ai/api/search-image?query=professional%20modern%20office%20environment%20with%20diverse%20people%20working%20on%20computers%2C%20bright%20and%20airy%20workspace%20with%20large%20windows%2C%20natural%20light%2C%20minimal%20design%2C%20soft%20colors%2C%20career%20and%20job%20search%20concept%2C%20high-quality%20professional%20photography&width=1920&height=600&seq=1&orientation=landscape');
      background-size: cover;
      background-position: center;
      }
      .hero-overlay {
      background: linear-gradient(90deg, rgba(255,255,255,0.95) 0%, rgba(255,255,255,0.9) 50%, rgba(255,255,255,0.5) 100%);
      }
      .continent-tab.active {
      color: #3b82f6;
      border-bottom: 2px solid #3b82f6;
      }
      .continent-content {
      display: none;
      }
      .continent-content.active {
      display: grid;
      }
    </style>
</head>

<body class="bg-gray-50">

  <!-- 구글 번역 api -->
  <div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
	function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'ko',autoDisplay: false}, 'google_translate_element');}
</script>

<!-- 네비게이션 바 -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
      <div class="container mx-auto px-4 py-3">
        <div class="flex items-center justify-between">
          <!-- 로고 -->
          <a href="#" class="font-['Pacifico'] text-2xl">
            <span class="text-primary">Re</span
            ><span class="text-gray-800">spot</span>
          </a>
          <!-- 메인 메뉴 -->
          <nav class="hidden md:flex space-x-8">
            <!-- 채용공고 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                채용공고
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >국내공고</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >해외공고</a
                >
              </div>
            </div>
            <!-- 이력서 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                이력서
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="https://readdy.ai/home/6dd34a74-a32d-44e9-b27d-db7ebada69a5/3916e0ea-3168-4bc4-a57f-bd0682b929ed"
                  data-readdy="true"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >이력서 서식</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >이력서 작성</a
                >
              </div>
            </div>
            <!-- 템플릿 -->
            <a
              href="#"
              class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >템플릿</a
            >
            <!-- 커리어 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                커리어
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >합격 이력서</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >합격 자기소개서</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >면접 후기</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >기업 리뷰</a
                >
              </div>
            </div>
            <!-- 게시판 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                게시판
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >1:1 문의</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >자유게시판</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >자주 묻는 질문 (FAQ)</a
                >
              </div>
            </div>
          </nav>
          <!-- 로그인/회원가입 버튼 -->

    <div class="flex items-center space-x-4">
      <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
          <span class="text-gray-700 font-medium">${sessionScope.loginUser.username} 님</span>
          <a href="${pageContext.request.contextPath}/logout" class="text-gray-600 hover:underline">로그아웃</a>
        </c:when>
        <c:otherwise>
          <a href="#" onclick="document.getElementById('loginModal').classList.remove('hidden')"
             class="flex items-center space-x-4">로그인</a>
          <a href="/signup.jsp" class="bg-primary text-white px-4 py-2 rounded-button text-sm font-medium hover:bg-blue-600 transition-colors whitespace-nowrap">회원가입</a>
        </c:otherwise>
      </c:choose>
    </div>


<!-- 로그인 모달 나오게하기 -->
<div id="loginModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50 hidden">
  <div class="bg-white p-8 rounded-xl w-full max-w-md relative shadow-lg">
    <!-- 닫기 버튼 -->
    <button onclick="document.getElementById('loginModal').classList.add('hidden')"
            class="absolute top-2 right-2 text-gray-500 hover:text-black text-xl">
      &times;
    </button>

    <h2 class="text-2xl font-bold text-center text-blue-600 mb-6">로그인</h2>

    <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-5">
      <div>
        <label for="id" class="block text-gray-700 mb-1">ID:</label>
        <input type="text" id="id" name="id" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <div>
        <label for="pw" class="block text-gray-700 mb-1">PASSWORD:</label>
        <input type="password" id="pw" name="pw" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <button type="submit"
              class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 font-semibold">
        로그인
      </button>
    </form>

    <div class="text-center mt-4 text-sm text-gray-600">
      계정이 없으신가요?
      <a href="/signup.jsp" class="text-blue-600 hover:underline ml-1">회원가입</a>
      <a href="/signup.jsp" class="text-blue-600 hover:underline ml-1">기업가입</a>
    </div>
  </div>


        </div>
      </div>
    </header> --%>
  <!-- Main content -->
  <main class="max-w-7xl mx-auto p-6 flex flex-col lg:flex-row">
    <!-- Main Left Section -->
    <section class="w-full lg:w-2/3 space-y-4">
      <!-- Job Header -->
      <div class="bg-white p-6 shadow rounded">
        <div class="flex justify-between items-center">
          <div>
            <h2 class="text-xl font-bold">${oRecru.rctitle }</h2>
            <p class="text-gray-500">${oRecru.username } · ${oRecru.rcwtype } · 마감일: <c:out value="${fn:substringBefore(oRecru.rcdeadline, ' ')}" /></p>
          </div>
<!--           <div>
            <button class="text-sm text-red-500 border px-2 py-1 rounded">관심기업 추가</button>
          </div> -->
        </div>

        <!-- Info Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4 text-sm text-gray-700">
          <div><strong>경력:</strong> ${oRecru.rchist }</div>
          <div><ㅁstrong>학력:</strong> ${oRecru.rcedu }</div>
          <div><strong>근무형태:</strong> ${oRecru.rcwtype }</div>
          <div><strong>급여:</strong> ${oRecru.rcsal }만 달러(&dollar;)</div>
          <div><strong>우대사항:</strong> ${oRecru.rcpreffer }</div>
          <div><strong>직급/직책:</strong> ${oRecru.rcrank }</div>
          <div><strong>근무지역:</strong> ${oRecru.rregion }</div>
        </div>

        <!-- Action Buttons -->
        <!-- <div class="mt-6 flex space-x-2">
          <button class="bg-orange-500 text-white px-4 py-2 rounded">즉시지원</button>
          <button class="border px-4 py-2 rounded">스크랩</button>
          <button class="ml-auto border px-4 py-2 rounded text-sm">번역</button>
        </div> -->
      </div>

      <!-- 채용 상세 내용 -->
      <div class="bg-white p-6 shadow rounded">
        <h3 class="text-lg font-semibold mb-2">채용 상세 내용</h3>
        <p class="text-sm text-gray-700 leading-relaxed">
          ${oRecru.rccontent }
          
        </p>
      </div>
    </section>

    <!-- Sidebar: Company info + Related Jobs -->
    <aside class="w-full lg:w-1/3 lg:pl-6 mt-6 lg:mt-0 space-y-4">
      <!-- 기업 정보 -->
      <div class="bg-white p-6 shadow rounded">
        <div class="flex items-center space-x-4">
<!--           <img src="https://via.placeholder.com/60" alt="기업로고" class="rounded-full"> -->
          <div>
            <h4 class="font-bold">${oRecru.username }</h4>
            <!-- <p class="text-sm text-gray-500">콜센터·아웃소싱·기타</p> -->
          </div>
        </div>
        <ul class="mt-4 text-sm text-gray-700 space-y-1">
          <li><strong>사원수:</strong> ${oRecru.rccount }</li>
          <li><strong>설립일:</strong> <c:out value="${fn:substringBefore(oRecru.rccestab, ' ')}" /></li>
          <li><strong>기업형태:</strong> ${oRecru.rccform }</li>
          <li><strong>홈페이지:</strong> <a href="${oRecru.rccweb}" class="text-blue-500">${oRecru.rccweb}</a></li>
        </ul>
      </div>

      <!-- 다른 채용공고 -->
      <div class="bg-white p-6 shadow rounded">
        <h3 class="text-lg font-semibold mb-4">최신 채용공고</h3>
        <ul class="space-y-2 text-sm">
        <c:forEach items="${getOtherOverseaRecruList}" var="oRecru2"> 
          <li>
           <a href="overseaRecruit_View?rckey=${oRecru2.rckey }" class="text-blue-600 font-semibold hover:underline">${oRecru2.rctitle } - ${oRecru2.username }</a>
            <p class="text-gray-500">${oRecru2.rregion } · 마감: <c:out value="${fn:substringBefore(oRecru2.rcdeadline, ' ')}" /></p>
          </li>
           </c:forEach>

        </ul>
      </div>
      
      
      <!-- google map -->
      <div class="bg-white p-6 shadow rounded">
        <h3 class="text-lg font-semibold mb-4">위치</h3>
			<div id="map"></div>
      </div>

      </div>
      
    </aside>
  </main>

<!--   <footer class="text-center text-sm text-gray-400 py-4 border-t mt-6">
    &copy; 2025 Respot. All rights reserved.
  </footer> -->
  
<jsp:include page="../common/footer.jsp" />
</body>

</html>
