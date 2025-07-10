<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

<div class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow">
  <h2 class="text-xl font-bold text-gray-800 mb-6">🔔 1:1 문의 답변 작성</h2>

  <form action="${pageContext.request.contextPath}/qna/answer" method="post">
    <input type="hidden" name="qnakey" value="${qna.qnakey}" />

    <div class="mb-4">
      <label class="block text-gray-700 font-semibold mb-2">문의 제목</label>
      <div class="text-gray-900">${qna.qnatitle}</div>
    </div>

    <div class="mb-4">
      <label class="block text-gray-700 font-semibold mb-2">문의 내용</label>
      <div class="text-gray-800 whitespace-pre-line">${qna.qnacontents}</div>
    </div>

    <div class="mb-4">
      <label class="block text-gray-700 font-semibold mb-2" for="adminTitle">답변 제목</label>
      <input type="text" id="adminTitle" name="adminTitle" class="w-full border px-4 py-2 rounded" required />
    </div>

    <div class="mb-6">
      <label class="block text-gray-700 font-semibold mb-2" for="adminContents">답변 내용</label>
      <textarea id="adminContents" name="adminContents" rows="6" class="w-full border px-4 py-2 rounded" required></textarea>
    </div>

    <div class="text-right">
      <button type="submit" class="bg-primary text-white px-6 py-2 rounded hover:bg-primary/80">등록</button>
      <a href="${pageContext.request.contextPath}/qna/view/${qna.qnakey}" class="ml-2 text-gray-600 underline">취소</a>
    </div>
  </form>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>