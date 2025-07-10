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
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>해외 채용공고 작성 | Respot</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
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
<body class="bg-gray-50 min-h-screen">

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

  <!-- Form Section -->
  <main class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow space-y-6">
    <h1 class="text-2xl font-bold text-gray-800 mb-4">해외 채용공고 작성</h1>

    <form class="space-y-6" action="${pageContext.request.contextPath}/overseaRecruit/insertOverseaRecru" method="post">
      <!-- 기업명 -->
      <div>
        <label class="block text-sm font-medium mb-1">기업명</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="username" placeholder="예: (주)리스팟">
      </div>

      <!-- 채용 제목 -->
      <div>
        <label class="block text-sm font-medium mb-1">채용 제목</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="rctitle" placeholder="예: 프론트엔드 개발자 모집 (React)">
      </div>

      <!-- 근무형태/급여/마감일 -->
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div>
          <label class="block text-sm font-medium mb-1" >근무형태</label>
          <select class="w-full border rounded px-3 py-2" name="rcwtype">
            <option>정규직</option>
            <option>계약직</option>
            <option>인턴</option>
            <option>프리랜서</option>
          </select>
        </div>
        <div>
          <label class="block text-sm font-medium mb-1" >급여</label>
          <input type="text" class="w-full border rounded px-4 py-2" name="rcsal" placeholder="예: 면접 후 결정">
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">마감일</label>
          <input type="date" class="w-full border rounded px-4 py-2" name="rcdeadline">
        </div>
      </div>

      <!-- 근무지역 -->
       <div>
        <label class="block text-sm font-medium mb-1">근무지역</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="rregion" placeholder="예: 서울특별시 강남구" name="rchist">
      </div>

      <!-- 경력/학력/직급 -->
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div>
          <label class="block text-sm font-medium mb-1">경력</label>
          <!-- <input type="text" class="w-full border rounded px-4 py-2" name="rchist" placeholder="예: 신입 / 1년 이상"> -->
          <select class="w-full border rounded px-3 py-2" name="rchist">
            <option>신입</option>
            <option>1년 미만</option>
            <option>1~3년</option>
            <option>3~5년</option>
            <option>5~10년</option>
            <option>10년 이상</option>
            <option>무관</option>
          </select>
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">학력</label>
          <!-- <input type="text" class="w-full border rounded px-4 py-2" name="rcedu" placeholder="예: 대졸 이상"> -->
          <select class="w-full border rounded px-3 py-2" name="rcedu">
            <option>고교 졸업 이상</option>
            <option>대학 졸업 이상</option>
            <option>대학원 졸업 이상</option>
            <option>석사 졸업 이상</option>
            <option>박사 졸업 이상</option>
            <option>무관</option>
          </select>
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">직급/직책</label>
          <input type="text" class="w-full border rounded px-4 py-2" name="rcrank" placeholder="예: 대리 / 팀장급">
        </div>
      </div>

      <!-- 우대사항 -->
      <div>
        <label class="block text-sm font-medium mb-1">우대사항</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="rcpreffer" placeholder="예: 인근 거주자, 관련 자격증 보유자 등">
      </div>

      <!-- 상세내용 -->
      <div>
        <label class="block text-sm font-medium mb-1">채용 상세 내용</label>
        <textarea rows="6" class="w-full border rounded px-4 py-2" name="rccontent" placeholder="채용에 대한 상세 설명을 입력해주세요."></textarea>
      </div>

      <!-- 기업정보 섹션 -->
      <div class="border-t pt-6">
        <h2 class="text-lg font-semibold text-gray-800 mb-4">기업 정보</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-medium mb-1">사원수</label>
            <input type="text" class="w-full border rounded px-4 py-2" name="rccount" placeholder="예: 100명">
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">설립일</label>
            <input type="date" class="w-full border rounded px-4 py-2" name="rccestab">
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">기업형태</label>
            <!-- <input type="text" class="w-full border rounded px-4 py-2" name="rccform" placeholder="예: 중소기업, 스타트업 등"> -->
            <select class="w-full border rounded px-3 py-2" name="rccform">
            <option>대기업</option>
            <option>중견기업</option>
            <option>중소기업</option>
            <option>스타트</option>
          </select>
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">홈페이지</label>
            <input type="url" class="w-full border rounded px-4 py-2" name="rccweb" placeholder="예: https://respot.co.kr">
          </div>
        </div>
      </div>

      <!-- 제출 버튼 -->
      <div class="text-right">
        <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">등록하기</button>
      </div>
    </form>
  </main>

  <!-- Footer -->
<!--   <footer class="text-center text-sm text-gray-400 py-6 border-t mt-10">
    © 2025 Respot. All rights reserved.
  </footer> -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>