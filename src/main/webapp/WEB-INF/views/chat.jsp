<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            
            <a href="resume/resume_Write" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">이력서 작성</a>
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
            <a href="${pageContext.request.contextPath}/user/faq/list" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">자주 묻는 질문</a>
          </div>
        </div>
      </nav>

      <!-- 로그인/회원가입 -->
      <div class="flex items-center space-x-4">
        <c:choose>
          <c:when test="${not empty sessionScope.loginUser}">
            <span class="text-gray-700 font-medium">${sessionScope.loginUser.username} 님</span>
            <%-- <a href="${pageContext.request.contextPath}/logout" class="text-gray-600 hover:underline">마이페이지</a> --%>
            <a href="MY_PAGE.jsp" class="text-gray-600 hover:underline">마이페이지</a>
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

  <main class="max-w-7xl mx-auto px-4 pt-28 pb-16">
    <div class="mb-8">
        <h1 class="text-3xl font-bold mb-2">자주 묻는 질문 (FAQ)</h1>
        <div class="flex items-center text-sm text-gray-500">
            <a href="#" class="hover:text-primary">게시판</a>
            <span class="mx-2">&gt;</span>
            <span class="text-gray-700">자주 묻는 질문</span>
        </div>
    </div>

    <!-- FAQ와 챗봇 영역을 flex로 나란히 배치 -->
    <div class="flex flex-col md:flex-row gap-8">
        <!-- FAQ 리스트 -->
        <section class="flex-1 bg-gray-50 p-6 rounded-lg max-h-[600px] overflow-y-auto">
            <h2 class="text-xl font-bold mb-6">자주 보는 질문</h2>
            <div class="space-y-2" id="faq-list">
                <c:forEach var="faq" items="${faqList}">
                    <button 
                        type="button"
                        class="w-full flex justify-between items-center bg-white border border-gray-300 hover:bg-blue-50 text-gray-800 font-medium px-4 py-3 rounded-lg transition shadow-sm text-left"
                        onclick="sendQuestion('${faq.question}')"
                    >
                        <span>${faq.question}</span>
                        <svg class="w-5 h-5 text-blue-500" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                             xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path>
                        </svg>
                    </button>
                </c:forEach>
            </div>
        </section>

        <!-- Gemini 챗봇 -->
        <section class="flex-1 bg-white rounded-2xl shadow-lg p-8 max-w-lg w-full space-y-6">
            <h1 class="text-3xl font-bold text-center text-blue-600">Gemini 챗봇</h1>

            <!-- 수동 질문 입력 -->
            <div class="flex gap-3" onsubmit="return false;">
                <input 
                    type="text" 
                    id="manualQuestion" 
                    placeholder="질문을 입력하세요" 
                    class="flex-1 border border-gray-300 rounded-xl px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
                    required
                />
                <button 
                    type="button" 
                    onclick="submitManualQuestion()"
                    class="bg-blue-500 hover:bg-blue-600 text-white font-semibold px-5 py-2 rounded-xl transition">
                    전송
                </button>
            </div>

            <!-- 챗봇 응답 -->
            <div id="chat-response" class="mt-4">
                <c:if test="${not empty userMessage}">
                    <div class="bg-gray-50 border border-gray-200 rounded-xl p-4 space-y-3">
                        <p><strong class="text-gray-700">내 질문:</strong> <span class="text-gray-900">${userMessage}</span></p>
                        <p><strong class="text-blue-700">챗봇 답변:</strong> <span class="text-gray-800">${botResponse}</span></p>
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</main>
<!-- 푸터 -->
    <footer class="bg-gray-800 text-white pt-12 pb-6">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
          <div>
            <a href="#" class="font-['Pacifico'] text-2xl mb-4 inline-block">
              <span class="text-primary">Re</span
              ><span class="text-white">spot</span>
            </a>
            <p class="text-gray-300 text-sm mb-4">
              Respot은 전 세계 구직자들이 더 나은 커리어를 찾을 수 있도록 돕는
              글로벌 채용 플랫폼입니다.
            </p>
            <!-- <div class="flex space-x-4">
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-facebook-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-twitter-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-linkedin-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-instagram-fill"></i>
              </a>
            </div> -->
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">서비스</h3>
            <ul class="space-y-2 text-gray-300 text-sm">
              <li><a href="koreaRecruit/koreaRecruit_List" class="hover:text-primary">국내채용공고</a></li>
              <li><a href="overseaRecruit/overseaRecruit_List" class="hover:text-primary">해외채용공고</a></li>
              <li><a href="resume/resume_Write" class="hover:text-primary">이력서 작성</a></li>
              <li><a href="#" class="hover:text-primary">이력서 템플릿</a></li>
              <!-- <li>
                <a href="#" class="hover:text-primary">합격 자기소개서</a>
              </li>
              <li><a href="#" class="hover:text-primary">면접 후기</a></li> -->
              <li><a href="#" class="hover:text-primary">자주 묻는 질문(FAQ)</a></li>

            </ul>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">회사 정보</h3>
            <ul class="space-y-2 text-gray-300 text-sm">
              <li><a href="#" class="hover:text-primary">회사 소개</a></li>
              <li><a href="#" class="hover:text-primary">이용약관</a></li>
              <li>
                <a href="#" class="hover:text-primary">개인정보처리방침</a>
              </li>
              <li><a href="#" class="hover:text-primary">채용 정보</a></li>
              <li><a href="#" class="hover:text-primary">제휴 문의</a></li>
            </ul>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">고객센터</h3>
            <p class="text-gray-300 text-sm mb-2">
              평일 09:00 - 18:00 (주말, 공휴일 휴무)
            </p>
            <p class="text-white font-medium mb-4">1588-1234</p>
            <a
              href="#"
              class="bg-primary text-white px-4 py-2 rounded-button text-sm font-medium hover:bg-blue-600 transition-colors inline-block whitespace-nowrap"
              >1:1 문의하기</a
            >
          </div>
        </div>
        <div
          class="border-t border-gray-700 pt-6 flex flex-col md:flex-row justify-between items-center"
        >
          <p class="text-gray-400 text-sm mb-4 md:mb-0">
            © 2025 Respot. All rights reserved.
          </p>
          <div class="flex items-center space-x-4">
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-visa-fill mr-1 text-lg"></i> Visa
            </span>
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-mastercard-fill mr-1 text-lg"></i> Mastercard
            </span>
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-paypal-fill mr-1 text-lg"></i> PayPal
            </span>
          </div>
        </div>
      </div>
    </footer>
    
    <script>
function sendQuestion(message) {
    fetch('${pageContext.request.contextPath}/send', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({ message })
    })
    .then(response => response.text())
    .then(html => {
        // 응답을 DOM에서 특정 부분만 추출하는 게 아니라,
        // 전체 응답을 파싱하는 게 복잡하므로, REST로 응답 구조 변경 권장
        // 그러나 지금은 일단 결과 영역만 대체
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        const newResponse = doc.querySelector('#chat-response');
        const responseContainer = document.getElementById('chat-response');

        if (newResponse && responseContainer) {
            responseContainer.innerHTML = newResponse.innerHTML;
            responseContainer.scrollIntoView({ behavior: 'smooth' });
        }
    });
    
    
}
</script>
<script>
function submitManualQuestion() {
    const input = document.getElementById('manualQuestion');
    const message = input.value.trim();
    if (!message) return;

    // fetch로 서버에 POST 요청
    fetch('${pageContext.request.contextPath}/send', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({ message })
    })
    .then(response => response.text())
    .then(html => {
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        const newResponse = doc.querySelector('#chat-response');
        const responseContainer = document.getElementById('chat-response');

        if (newResponse && responseContainer) {
            responseContainer.innerHTML = newResponse.innerHTML;
            responseContainer.scrollIntoView({ behavior: 'smooth' });
        }

        input.value = ''; // 입력창 비우기
    });
}
</script>
<script>
document.getElementById('manualQuestion').addEventListener('keydown', function(e) {
    if (e.key === 'Enter') {
        e.preventDefault(); // 폼 전송 막고
        submitManualQuestion(); // 직접 전송
    }
});
</script>

</body>
</html>