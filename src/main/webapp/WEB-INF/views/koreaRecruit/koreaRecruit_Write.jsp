<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

    
  <!-- Form Section -->
  <main class="max-w-3xl mx-auto mt-10 bg-white p-8 rounded shadow space-y-6">
    <h1 class="text-2xl font-bold text-gray-800 mb-4">국내 채용공고 작성</h1>

    <form class="space-y-6" action="${pageContext.request.contextPath}/koreaRecruit/insertRecru" method="post">
      <!-- 기업명 -->
      <div>
        <label class="block text-sm font-medium mb-1">기업명</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="username" placeholder="예: (주)리스팟">
      </div>

      <!-- 채용 제목 -->
      <div>
        <label class="block text-sm font-medium mb-1">채용 제목</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="rctitle" placeholder="예: 프론트엔드 개발자 모집 (React)">
      </div>

      <!-- 근무형태/급여/마감일 -->
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div>
          <label class="block text-sm font-medium mb-1" >근무형태</label>
          <select class="w-full border rounded px-3 py-2" name="rcwtype">
            <option>정규직</option>
            <option>계약직</option>
            <option>인턴</option>
            <option>프리랜서</option>
          </select>
        </div>
        <div>
          <label class="block text-sm font-medium mb-1" >급여</label>
          <input type="text" class="w-full border rounded px-4 py-2" name="rcsal" placeholder="예: 면접 후 결정">
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">마감일</label>
          <input type="date" class="w-full border rounded px-4 py-2" name="rcdeadline">
        </div>
      </div>

      <!-- 근무지역 -->
       <div>
        <label class="block text-sm font-medium mb-1">근무지역</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="rregion" placeholder="예: 서울특별시 강남구" name="rchist">
      </div>

      <!-- 경력/학력/직급 -->
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div>
          <label class="block text-sm font-medium mb-1">경력</label>
          <!-- <input type="text" class="w-full border rounded px-4 py-2" name="rchist" placeholder="예: 신입 / 1년 이상"> -->
          <select class="w-full border rounded px-3 py-2" name="rchist">
            <option>신입</option>
            <option>1년 미만</option>
            <option>1~3년</option>
            <option>3~5년</option>
            <option>5~10년</option>
            <option>10년 이상</option>
            <option>무관</option>
          </select>
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">학력</label>
          <!-- <input type="text" class="w-full border rounded px-4 py-2" name="rcedu" placeholder="예: 대졸 이상"> -->
          <select class="w-full border rounded px-3 py-2" name="rcedu">
            <option>고교 졸업 이상</option>
            <option>대학 졸업 이상</option>
            <option>대학원 졸업 이상</option>
            <option>석사 졸업 이상</option>
            <option>박사 졸업 이상</option>
            <option>무관</option>
          </select>
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">직급/직책</label>
          <input type="text" class="w-full border rounded px-4 py-2" name="rcrank" placeholder="예: 대리 / 팀장급">
        </div>
      </div>

      <!-- 우대사항 -->
      <div>
        <label class="block text-sm font-medium mb-1">우대사항</label>
        <input type="text" class="w-full border rounded px-4 py-2" name="rcpreffer" placeholder="예: 인근 거주자, 관련 자격증 보유자 등">
      </div>

      <!-- 상세내용 -->
      <div>
        <label class="block text-sm font-medium mb-1">채용 상세 내용</label>
        <textarea rows="6" class="w-full border rounded px-4 py-2" name="rccontent" placeholder="채용에 대한 상세 설명을 입력해주세요."></textarea>
      </div>

      <!-- 기업정보 섹션 -->
      <div class="border-t pt-6">
        <h2 class="text-lg font-semibold text-gray-800 mb-4">기업 정보</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-medium mb-1">사원수</label>
            <input type="text" class="w-full border rounded px-4 py-2" name="rccount" placeholder="예: 100명">
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">설립일</label>
            <input type="date" class="w-full border rounded px-4 py-2" name="rccestab">
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">기업형태</label>
            <!-- <input type="text" class="w-full border rounded px-4 py-2" name="rccform" placeholder="예: 중소기업, 스타트업 등"> -->
            <select class="w-full border rounded px-3 py-2" name="rccform">
            <option>대기업</option>
            <option>중견기업</option>
            <option>중소기업</option>
            <option>스타트</option>
          </select>
          </div>
          <div>
            <label class="block text-sm font-medium mb-1">홈페이지</label>
            <input type="url" class="w-full border rounded px-4 py-2" name="rccweb" placeholder="예: https://respot.co.kr">
          </div>
        </div>
      </div>

      <!-- 제출 버튼 -->
      <div class="text-right">
        <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">등록하기</button>
      </div>
    </form>
  </main>

  <!-- Footer -->
  <!-- <footer class="text-center text-sm text-gray-400 py-6 border-t mt-10">
    © 2025 Respot. All rights reserved.
  </footer> -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>