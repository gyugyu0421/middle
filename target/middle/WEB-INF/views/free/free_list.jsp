<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

  
  <!-- 구글 번역 api -->
  <!-- <div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
   function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'ko',autoDisplay: false}, 'google_translate_element');}
</script> -->
  
 
<main class="container mx-auto px-4 py-10">
  <div class="flex justify-between items-center mb-6">
    <h1 class="text-2xl font-bold text-gray-900">자유게시판</h1>
    <a href="${pageContext.request.contextPath}/user/free/write" class="bg-primary text-white px-6 py-2 rounded-button hover:bg-opacity-90">글쓰기</a>
  </div>

  <div class="flex space-x-4 mb-6 text-sm text-gray-600">
    <a href="${pageContext.request.contextPath}/user/free/list" class="px-3 py-1 rounded-full ${empty category ? 'bg-primary text-white' : 'bg-gray-100'}">전체</a>
    <a href="${pageContext.request.contextPath}/user/free/list?category=취업/이직" class="px-3 py-1 rounded-full ${category == '취업/이직' ? 'bg-primary text-white' : 'bg-gray-100'}">취업/이직</a>
    <a href="${pageContext.request.contextPath}/user/free/list?category=커리어" class="px-3 py-1 rounded-full ${category == '커리어' ? 'bg-primary text-white' : 'bg-gray-100'}">커리어</a>
    <a href="${pageContext.request.contextPath}/user/free/list?category=회사생활" class="px-3 py-1 rounded-full ${category == '회사생활' ? 'bg-primary text-white' : 'bg-gray-100'}">회사생활</a>
    <a href="${pageContext.request.contextPath}/user/free/list?category=자기개발" class="px-3 py-1 rounded-full ${category == '자기개발' ? 'bg-primary text-white' : 'bg-gray-100'}">자기개발</a>
    <a href="${pageContext.request.contextPath}/user/free/list?category=일상" class="px-3 py-1 rounded-full ${category == '일상' ? 'bg-primary text-white' : 'bg-gray-100'}">일상</a>
  </div>

  <div class="bg-white rounded shadow-sm divide-y">
    <c:forEach var="free" items="${freeList}">
      <a href="${pageContext.request.contextPath}/user/free/view/${free.fbkey}" class="block px-6 py-4 hover:bg-gray-50">
        <div class="flex justify-between items-center mb-1">
          <h3 class="text-base font-semibold text-gray-800">${free.fbtitle}</h3>
          <span class="text-sm text-gray-500">
            <fmt:formatDate value="${free.fbdate}" pattern="yyyy-MM-dd" />
          </span>
        </div>
        <div class="text-sm text-gray-500 flex items-center space-x-3">
          <span>작성자: ${free.username}</span>
          <span>조회수: ${free.fbview}</span>
          <span>추천: ${free.fblike}</span>
		<span>
            <span class="px-2 py-1 rounded text-xs font-semibold
              <c:choose>
                <c:when test='${free.fbcategory == "취업/이직"}'>bg-blue-100 text-blue-800</c:when>
                <c:when test='${free.fbcategory == "커리어"}'>bg-purple-100 text-purple-800</c:when>
                <c:when test='${free.fbcategory == "회사생활"}'>bg-green-100 text-green-800</c:when>
                <c:when test='${free.fbcategory == "자기개발"}'>bg-orange-100 text-orange-800</c:when>
                <c:otherwise>bg-gray-100 text-gray-800</c:otherwise>
              </c:choose>
            ">
              ${free.fbcategory}
            </span>
          </span>
        </div>
      </a>
    </c:forEach>
  </div>


</main>
		
<%@ include file="../common/footer.jsp" %>
</body>
</html>