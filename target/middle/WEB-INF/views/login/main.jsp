<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Respot - 메인</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
</head>
<body class="bg-gray-50">

<!-- 상단 네비게이션 -->
<header class="bg-white shadow-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 py-3 flex justify-between items-center">
    <a href="/main" class="text-2xl font-bold text-blue-600">Respot</a>
    <nav class="space-x-6 text-gray-700 font-medium hidden md:flex">
      <a href="#" class="hover:text-blue-500">채용공고</a>
      <a href="#" class="hover:text-blue-500">이력서</a>
      <a href="#" class="hover:text-blue-500">템플릿</a>
      <a href="#" class="hover:text-blue-500">커리어</a>
      <a href="#" class="hover:text-blue-500">게시판</a>
    </nav>
    
    
    <!-- 로그인  -->
    <div class="text-sm space-x-4">
      <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
          <span class="text-gray-700 font-medium">${sessionScope.loginUser.username} 님</span>
          <a href="${pageContext.request.contextPath}/logout" class="text-gray-600 hover:underline">로그아웃</a>
        </c:when>
        <c:otherwise>
          <a href="#" onclick="document.getElementById('loginModal').classList.remove('hidden')"
             class="text-blue-600 font-semibold">로그인</a>
          <a href="/signup.jsp" class="text-gray-600 hover:underline">회원가입</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</header>

<!-- 메인 콘텐츠 -->
<main class="max-w-7xl mx-auto px-4 py-12">
  <section class="text-center mb-12">
    <h1 class="text-4xl font-bold text-gray-900">당신의 커리어를 시작하세요</h1>
    <p class="text-gray-600 mt-2">국내외 채용 정보와 합격 이력서까지, Respot에서 확인하세요</p>
    <div class="mt-6 space-x-4">
      <a href="#" class="bg-blue-600 text-white px-6 py-2 rounded-button hover:bg-blue-700">채용공고 둘러보기</a>
      <a href="#" class="bg-white text-blue-600 border border-blue-600 px-6 py-2 rounded-button hover:bg-blue-50">이력서 작성하기</a>
    </div>
  </section>
</main>

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

</body>
</html>