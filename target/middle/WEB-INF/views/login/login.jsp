<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

<!-- 실패 시 alert 표시 -->
<c:if test="${not empty error}">
  <script>alert("${error}");</script>
</c:if>


<!-- 로그인 폼 -->
<main class="flex justify-center items-center min-h-screen bg-gray-100">
  <div class="bg-white p-8 rounded-xl shadow-md w-full max-w-md">
    <h2 class="text-2xl font-bold text-center text-blue-600 mb-6">로그인</h2>
    <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-5">
      <div>
        <label for="id" class="block text-gray-700 mb-1">아이디</label>
        <input type="text" id="id" name="id" required class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <div>
        <label for="pw" class="block text-gray-700 mb-1">비밀번호</label>
        <input type="password" id="pw" name="pw" required class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 font-semibold">로그인</button>
    </form>
    
    <c:if test="${not empty error}">
      <p class="text-red-600 text-sm text-center mt-4">${error}</p> <!-- 로그인 실패 시 메세지 출력  -->
    </c:if>
    
    <div class="text-center mt-6">
      <span class="text-sm text-gray-600">계정이 없으신가요?</span>
      <a href="${pageContext.request.contextPath}/signupUser" class="text-blue-600 hover:underline ml-1">회원가입</a>
      <a href="${pageContext.request.contextPath}/signupCorp" class="text-blue-600 hover:underline ml-1">기업가입</a>
    </div>
  </div>
</main>

<%@ include file="../common/footer.jsp" %>
</body>
</html>