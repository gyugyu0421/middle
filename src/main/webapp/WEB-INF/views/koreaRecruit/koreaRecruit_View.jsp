<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>



  <!-- Main content -->
  <main class="max-w-7xl mx-auto p-6 flex flex-col lg:flex-row">
    <!-- Main Left Section -->
    <section class="w-full lg:w-2/3 space-y-4">
      <!-- Job Header -->
      <div class="bg-white p-6 shadow rounded">
        <div class="flex justify-between items-center">
          <div>
            <h2 class="text-xl font-bold">${kRecru.rctitle }</h2>
            <p class="text-gray-500">${kRecru.username } · ${kRecru.rcwtype } · 마감일: <c:out value="${fn:substringBefore(kRecru.rcdeadline, ' ')}" /></p>
          </div>
<!--           <div>
            <button class="text-sm text-red-500 border px-2 py-1 rounded">관심기업 추가</button>
          </div> -->
        </div>

        <!-- Info Grid -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4 text-sm text-gray-700">
          <div><strong>경력:</strong> ${kRecru.rchist }</div>
          <div><strong>학력:</strong> ${kRecru.rcedu }</div>
          <div><strong>근무형태:</strong> ${kRecru.rcwtype }</div>
          <div><strong>급여:</strong> ${kRecru.rcsal }만 원(&#8361;)</div>
          <div><strong>우대사항:</strong> ${kRecru.rcpreffer }</div>
          <div><strong>직급/직책:</strong> ${kRecru.rcrank }</div>
          <div><strong>근무지역:</strong> ${kRecru.rregion }</div>
        </div>

        <!-- Action Buttons -->
<!--         <div class="mt-6 flex space-x-2">
          <button class="bg-orange-500 text-white px-4 py-2 rounded">즉시지원</button>
          <button class="border px-4 py-2 rounded">스크랩</button>
          <button class="ml-auto border px-4 py-2 rounded text-sm">번역</button>
        </div> -->
      </div>

      <!-- 채용 상세 내용 -->
      <div class="bg-white p-6 shadow rounded">
        <h3 class="text-lg font-semibold mb-2">채용 상세 내용</h3>
        <p class="text-sm text-gray-700 leading-relaxed">
          ${kRecru.rccontent }
          
        </p>
      </div>
    </section>

    <!-- Sidebar: Company info + Related Jobs -->
    <aside class="w-full lg:w-1/3 lg:pl-6 mt-6 lg:mt-0 space-y-4">
      <!-- 기업 정보 -->
      <div class="bg-white p-6 shadow rounded">
        <div class="flex items-center space-x-4">
<!--           <img src="https://via.placeholder.com/60" alt="기업로고" class="rounded-full"> -->
          <div>
            <h4 class="font-bold">${kRecru.username }</h4>
            <!-- <p class="text-sm text-gray-500">콜센터·아웃소싱·기타</p> -->
          </div>
        </div>
        <ul class="mt-4 text-sm text-gray-700 space-y-1">
          <li><strong>사원수:</strong> ${kRecru.rccount }</li>
          <li><strong>설립일:</strong> <c:out value="${fn:substringBefore(kRecru.rccestab, ' ')}" /></li>
          <li><strong>기업형태:</strong> ${kRecru.rccform }</li>
          <li><strong>홈페이지:</strong> <a href="${kRecru.rccweb}" class="text-blue-500">${kRecru.rccweb}</a></li>
        </ul>
      </div>

      <!-- 다른 채용공고 -->
      <div class="bg-white p-6 shadow rounded">
        <h3 class="text-lg font-semibold mb-4">최신 채용공고</h3>
        <ul class="space-y-2 text-sm">
        <c:forEach items="${getOtherKRecruList}" var="kRecru2"> 
          <li>
       <%-- <p>리스트 크기: ${fn:length(getOtherKRecruList)}</p> --%>
            <a href="koreaRecruit_View?rckey=${kRecru2.rckey }" class="text-blue-600 font-semibold hover:underline">${kRecru2.rctitle } - ${kRecru2.username }</a>
            <p class="text-gray-500">${kRecru.rregion } · 마감: <c:out value="${fn:substringBefore(kRecru2.rcdeadline, ' ')}" /></p>
          </li>
           </c:forEach>

        </ul>
      </div>
      
      <!-- google map -->
      <div class="bg-white p-6 shadow rounded">
        <h3 class="text-lg font-semibold mb-4">위치</h3>
			<div id="map"></div>
      </div>
      
    </aside>
  </main>

 <!--  <footer class="text-center text-sm text-gray-400 py-4 border-t mt-6">
    &copy; 2025 Respot. All rights reserved.
  </footer> -->
<jsp:include page="../common/footer.jsp" />
</body>

</html>
