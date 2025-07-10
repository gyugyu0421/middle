<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

  
  <%-- <!-- 구글 번역 api -->
  <div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
   function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'ko',autoDisplay: false}, 'google_translate_element');}
</script>
  
    
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

<main class="container mx-auto px-4 py-10">
  <div class="flex justify-between items-center mb-6">
    <h1 class="text-2xl font-bold text-gray-900">자유게시판</h1>
    <a href="${pageContext.request.contextPath}/free/write" class="bg-primary text-white px-6 py-2 rounded-button hover:bg-opacity-90">글쓰기</a>
  </div>

  <div class="flex space-x-4 mb-6 text-sm text-gray-600">
    <a href="${pageContext.request.contextPath}/free/list" class="px-3 py-1 rounded-full ${empty category ? 'bg-primary text-white' : 'bg-gray-100'}">전체</a>
    <a href="${pageContext.request.contextPath}/free/list?category=취업/이직" class="px-3 py-1 rounded-full ${category == '취업/이직' ? 'bg-primary text-white' : 'bg-gray-100'}">취업/이직</a>
    <a href="${pageContext.request.contextPath}/free/list?category=커리어" class="px-3 py-1 rounded-full ${category == '커리어' ? 'bg-primary text-white' : 'bg-gray-100'}">커리어</a>
    <a href="${pageContext.request.contextPath}/free/list?category=회사생활" class="px-3 py-1 rounded-full ${category == '회사생활' ? 'bg-primary text-white' : 'bg-gray-100'}">회사생활</a>
    <a href="${pageContext.request.contextPath}/free/list?category=자기개발" class="px-3 py-1 rounded-full ${category == '자기개발' ? 'bg-primary text-white' : 'bg-gray-100'}">자기개발</a>
    <a href="${pageContext.request.contextPath}/free/list?category=일상" class="px-3 py-1 rounded-full ${category == '일상' ? 'bg-primary text-white' : 'bg-gray-100'}">일상</a>
  </div>

  <div class="bg-white rounded shadow-sm divide-y">
    <c:forEach var="post" items="${freeList}">
      <a href="${pageContext.request.contextPath}/free/view/${post.fbkey}" class="block px-6 py-4 hover:bg-gray-50">
        <div class="flex justify-between items-center mb-1">
          <h3 class="text-base font-semibold text-gray-800">${post.fbtitle}</h3>
          <span class="text-sm text-gray-500">
            <fmt:formatDate value="${post.fbdate}" pattern="yyyy-MM-dd" />
          </span>
        </div>
        <div class="text-sm text-gray-500 flex items-center space-x-3">
          <span>작성자: ${post.username}</span>
          <span>조회수: ${post.fbview}</span>
          <span>추천: ${post.fblike}</span>
          <span>카테고리: ${post.fbcategory}</span>
        </div>
      </a>
    </c:forEach>
  </div>
</main>

<%@ include file="../common/footer.jsp" %>
</body>
</html>