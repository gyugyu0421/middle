<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

<!-- <!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>자유게시판 글쓰기</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#4F46E5'
          },
          borderRadius: {
            'button': '8px'
          }
        }
      }
    }
  </script>
</head>
<body class="bg-gray-100"> -->

  <div class="max-w-2xl mx-auto mt-10 bg-white p-8 rounded shadow">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">
    <c:choose>
      <c:when test="${empty free.fbkey}">자유게시판 글쓰기</c:when>
      <c:otherwise>자유게시판 글 수정</c:otherwise>
    </c:choose>
  </h2>
    
    <c:choose>
  <c:when test="${empty free.fbkey}">
    <form action="${pageContext.request.contextPath}/user/free/write" method="post">
  </c:when>
  <c:otherwise>
    <form action="${pageContext.request.contextPath}/user/free/edit" method="post">
      <input type="hidden" name="fbkey" value="${free.fbkey}" />
  </c:otherwise>
</c:choose>
      
      
     <!-- 수정인 경우 글번호 히든으로 전달 -->
    <c:if test="${not empty free.fbkey}">
      <input type="hidden" name="fbkey" value="${free.fbkey}" />
    </c:if> 
      
      
      <!-- 작성자 이름 추가 -->
  <div class="mb-4">
    <label for="username" class="block text-sm font-medium text-gray-700 mb-1">작성자 이름</label>
    <input type="text" id="username" name="username" required
           class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary">
  </div>
      
       
        
      
      <div class="mb-4">
        <label for="fbtitle" class="block text-sm font-medium text-gray-700 mb-1">제목</label>
        <input type="text" id="fbtitle" name="fbtitle" required
               class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary">
      </div>

      <div class="mb-4">
        <label for="fbcategory" class="block text-sm font-medium text-gray-700 mb-1">카테고리</label>
        <select id="fbcategory" name="fbcategory" required
                class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary">
          <option value="">카테고리 선택</option>
          <option value="취업/이직">취업/이직</option>
          <option value="커리어">커리어</option>
          <option value="회사생활">회사생활</option>
          <option value="자기개발">자기개발</option>
          <option value="일상">일상</option>
        </select>
      </div>

      <div class="mb-6">
        <label for="fbcontent" class="block text-sm font-medium text-gray-700 mb-1">내용</label>
        <textarea id="fbcontent" name="fbcontent" rows="10" required
                  class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary resize-none"></textarea>
      </div>

      <div class="flex justify-end">
        <a href="${pageContext.request.contextPath}/user/free/list"
           class="px-6 py-2 border border-gray-300 rounded text-gray-700 bg-white hover:bg-gray-50 mr-3">
          취소
        </a>
        <button type="submit"
                class="px-6 py-2 bg-primary text-white rounded hover:bg-opacity-90">
          등록하기
        </button>
      </div>
    </form>
  </div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>