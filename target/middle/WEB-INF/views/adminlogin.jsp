<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>관리자 로그인</title>
  <!-- ✅ Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<!-- ✅ 로그아웃 메시지 -->
<c:if test="${not empty logoutMsg}">
  <div class="max-w-md mx-auto mt-6">
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
      <span class="block sm:inline">${logoutMsg}</span>
    </div>
  </div>
</c:if>

<!-- ✅ 로그인 섹션 -->
<section class="flex items-center justify-center min-h-screen">
  <div class="bg-white p-8 rounded-2xl shadow-2xl w-full max-w-md">
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">🔐 관리자 로그인</h2>

    <form action="${pageContext.request.contextPath}/adminlogin" method="post" class="space-y-6">
      <!-- 아이디 입력 -->
      <div>
        <label class="block text-gray-700 font-semibold mb-1">아이디</label>
        <input type="text" name="id" required 
               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
      </div>

      <!-- 비밀번호 입력 -->
      <div>
        <label class="block text-gray-700 font-semibold mb-1">비밀번호</label>
        <input type="password" name="pw" required 
               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
      </div>

      <!-- 로그인 버튼 -->
      <button type="submit" 
              class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded-lg font-semibold transition duration-200">
        로그인
      </button>
    </form>
  </div>
</section>

</body>
</html>