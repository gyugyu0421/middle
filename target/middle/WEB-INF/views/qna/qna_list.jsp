<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <body class="flex flex-col min-h-screen"> -->
<%@ include file="../common/header.jsp" %>

  
  <!-- 구글 번역 api -->
  <div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
   function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'ko',autoDisplay: false}, 'google_translate_element');}
</script>
  
    
<!-- ✅ 본문 영역 -->
<main class="max-w-5xl mx-auto p-6">
  <!-- 제목 + 문의하기 버튼 -->
  <div class="flex items-center justify-between mb-6">
    <div>
      <h2 class="text-2xl font-bold">1:1 문의</h2>
      <p class="text-gray-600 text-sm">궁금한 점을 남겨주세요. 운영팀이 신속히 답변드립니다.</p>
    </div>
    <a href="${pageContext.request.contextPath}/user/qna/write"
       class="bg-primary text-white px-4 py-2 rounded-button hover:bg-opacity-90 transition">
       문의하기
    </a>
  </div>

  <!-- 문의 카드 리스트 -->
  <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
    <c:forEach var="qna" items="${qnaList}">
      <a href="${pageContext.request.contextPath}/user/qna/view/${qna.qnakey}"
         class="block bg-white p-5 rounded shadow hover:bg-gray-50 transition">
        <div class="flex justify-between items-center mb-2">
          <span class="text-sm text-gray-400">#${qna.qnakey}</span>
          <c:choose>
            <c:when test="${not empty qna.adminContents}">
              <span class="inline-block px-3 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-700">
                답변완료
              </span>
            </c:when>
            <c:otherwise>
              <span class="inline-block px-3 py-1 text-xs font-semibold rounded-full bg-gray-200 text-gray-700">
                답변대기
              </span>
            </c:otherwise>
          </c:choose>
        </div>
        
        <!-- 제목 -->
        <h3 class="text-lg font-medium text-gray-900 mb-1 line-clamp-1">${qna.qnatitle}</h3>
        
         <!-- 작성일 -->
        <p class="text-sm text-gray-500">
          <fmt:formatDate value="${qna.qnadate}" pattern="yyyy-MM-dd" />
        </p>
        
        <p class="text-sm text-gray-500">
		  작성자: 
		  <c:choose>
		    <c:when test="${qna.username eq 'guest'}">익명</c:when>
		    <c:otherwise>${qna.username}</c:otherwise>
		  </c:choose>
		  | 회원유형: ${qna.type}
		</p>
    
      </a>
    </c:forEach>
  </div>
</main>

<%@ include file="../common/footer.jsp" %>
</body>
</html>