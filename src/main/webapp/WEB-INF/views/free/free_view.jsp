<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>


<div class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow">
  <h2 class="text-2xl font-bold text-gray-800 mb-4">${free.fbtitle}</h2>

	<div
		class="flex justify-between items-center text-sm text-gray-500 mb-6">
		<div>
			작성자: <strong>${free.username}</strong> <span class="ml-3">카테고리:
				${free.fbcategory}</span>
		</div>
		<div class="flex items-center space-x-2">
			<span> 작성일: <fmt:formatDate value="${free.fbdate}"
					pattern="yyyy-MM-dd" /> | 조회수: ${free.fbview} | 추천: ${free.fblike}
			</span>
			
			
		<!-- ✅ 추천 버튼 여기 넣기 -->
		<form action="${pageContext.request.contextPath}/user/free/like" method="post">
	  <input type="hidden" name="fbkey" value="${free.fbkey}" />
	  <button type="submit"
	    class="text-blue-600 hover:text-blue-800 font-medium transition">
	    👍 추천하기 
	  </button>
	</form>
			
			
			<!-- 신고 버튼 -->
			<button onclick="document.getElementById('reportModal').classList.remove('hidden')"
      class="text-red-500 hover:text-red-600 font-medium transition">
      🚩 신고하기
    </button>
		
		</div>
	</div>

	<!--  신고 모달창 -->
	<div id="reportModal"
		class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50 hidden">
		<div class="bg-white rounded-lg p-6 w-96">
			<h2 class="text-xl font-bold mb-4">신고 사유</h2>
			<form action="${pageContext.request.contextPath}/user/free/report"
				method="post">
				<input type="hidden" name="boardId" value="${free.fbkey}" />
				<textarea name="reason" rows="4" class="w-full border p-2 rounded"
					placeholder="신고 내용을 입력하세요" required></textarea>
				<div class="flex justify-end space-x-2 mt-4">
					<button type="button"
						onclick="document.getElementById('reportModal').classList.add('hidden')"
						class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">취소</button>
					<button type="submit"
						class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600">제출</button>
				</div>
			</form>
		</div>
	</div>

	<div class="border-t border-gray-200 pt-4 whitespace-pre-line text-gray-800 leading-relaxed">
    ${free.fbcontent}
  </div>


	<!-- 로그인한 사용자와 작성자가 같을 때만 수정/삭제 버튼 보이도록 -->
	<c:if test="${sessionScope.id == free.id}">
	  <div class="flex justify-end mt-6 space-x-3">
	    <a href="${pageContext.request.contextPath}/user/free/edit/${free.fbkey}"
	       class="px-6 py-2 bg-primary text-white rounded hover:bg-opacity-90">
	      수정
	    </a>
	    <a href="${pageContext.request.contextPath}/user/free/delete/${free.fbkey}"
	       class="px-6 py-2 bg-red-500 text-white rounded hover:bg-opacity-90"
	       onclick="return confirm('정말 삭제하시겠습니까?');">
	      삭제
	    </a>
	  </div>
	</c:if>
	
	
	<!--  목록 버튼은 모두에게 보여줌 -->
	<div class="flex justify-end mt-6 space-x-3">
	  <a href="${pageContext.request.contextPath}/user/free/list"
	     class="px-6 py-2 border border-gray-300 rounded text-gray-700 bg-white hover:bg-gray-50">
	    목록
	  </a>
	</div>
</div>
  <%-- <div class="flex justify-end mt-6 space-x-3">
    <a href="${pageContext.request.contextPath}/user/free/list"
       class="px-6 py-2 border border-gray-300 rounded text-gray-700 bg-white hover:bg-gray-50">
      목록
    </a>
    <a href="${pageContext.request.contextPath}/user/free/edit/${free.fbkey}"
       class="px-6 py-2 bg-primary text-white rounded hover:bg-opacity-90">
      수정
    </a>
    <a href="${pageContext.request.contextPath}/user/free/delete/${free.fbkey}"
       class="px-6 py-2 bg-red-500 text-white rounded hover:bg-opacity-90"
       onclick="return confirm('정말 삭제하시겠습니까?');">
      삭제
    </a>
  </div>
</div> --%>
<br>
<br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
