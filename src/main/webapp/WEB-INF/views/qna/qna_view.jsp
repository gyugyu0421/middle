<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>


<div class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">${qna.qnatitle}</h2>

  <div class="text-sm text-gray-500 mb-4">
  작성자:
  <c:choose>
    <c:when test="${empty qna.username}">익명</c:when>
    <c:otherwise>${qna.username}</c:otherwise>
  </c:choose>
  |
  작성일: <fmt:formatDate value="${qna.qnadate}" pattern="yyyy-MM-dd" />
</div>

  <div class="border-t border-gray-200 pt-4 whitespace-pre-line text-gray-800 leading-relaxed">
    ${qna.qnacontents}
  </div>

  <c:if test="${not empty qna.adminContents}">
    <hr class="my-6">
    <div class="bg-gray-50 p-5 rounded">
      <h3 class="text-lg font-bold text-primary mb-2">🔔 관리자 답변</h3>
      <p class="text-sm text-gray-600 mb-1">답변 제목: ${qna.adminTitle}</p>
      <p class="text-sm text-gray-500 mb-3">
        <fmt:formatDate value="${qna.adminDate}" pattern="yyyy-MM-dd HH:mm" />
      </p>
      <div class="text-gray-800 whitespace-pre-line">${qna.adminContents}</div>
    </div>
  </c:if>

  <div class="mt-6 flex justify-end gap-2">
    <a href="${pageContext.request.contextPath}/user/qna/list" class="px-4 py-2 bg-gray-300 rounded">목록으로</a>

	<!-- 삭제 버튼 -->
	 <c:if test="${sessionScope.id eq qna.id}">
    <form action="${pageContext.request.contextPath}/user/qna/delete" method="post">
      <input type="hidden" name="qnakey" value="${qna.qnakey}" />
      <button type="submit" class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600">
        삭제하기
      </button>
    </form>
  </c:if>
</div>
	
    <c:if test="${qna.qnaStatus eq 'N'}">
      <a href="${pageContext.request.contextPath}user/qna/answer/${qna.qnakey}"
         class="px-4 py-2 bg-primary text-white rounded hover:bg-primary/80">답변하기</a>
    </c:if>
  </div>
  
  
<%@ include file="../common/footer.jsp" %>
</body>
</html>
