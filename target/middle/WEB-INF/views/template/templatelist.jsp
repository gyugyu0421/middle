<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>이력서 템플릿</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    .modal { display: none; }
    .modal.active { display: flex; }
  </style>
</head>
<body class="bg-gray-100">

  <!-- 페이지 제목 -->
  <section class="bg-gradient-to-r from-indigo-50 to-indigo-100 py-12">
    <div class="container mx-auto px-4">
      <div class="max-w-4xl mx-auto">
        <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">이력서 템플릿</h1>
        <p class="text-lg text-gray-700">
          다양한 직무와 경력에 맞는 전문적인 이력서 템플릿을 찾아보세요. 취업 성공률을 높이는 맞춤형 디자인으로 당신의 경력을 돋보이게 만들어 드립니다.
        </p>
      </div>
    </div>
  </section>

  <!-- 템플릿 커드 리스트 -->
  <section class="py-10 bg-white">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <c:forEach var="i" begin="1" end="8">
          <div class="bg-white border border-gray-200 rounded-xl shadow hover:shadow-lg p-4">
            <img src="${pageContext.request.contextPath}/resources/images/template${i}.jpg"
                 alt="템플릿${i}" class="rounded-lg w-full h-auto object-cover" />
            <div class="mt-4">
              <h3 class="text-lg font-semibold text-gray-900">템플릿 ${i} 제목</h3>
              <p class="text-sm text-gray-600 mt-1">이 템플리트는 다양한 직무와 경력자에게 적합한 디자인입니다.</p>
              <div class="flex flex-wrap gap-1 mt-2">
                <span class="bg-blue-100 text-blue-600 text-xs font-medium px-2 py-1 rounded-full">경력</span>
                <span class="bg-gray-100 text-gray-700 text-xs font-medium px-2 py-1 rounded-full">전문가</span>
                <span class="bg-purple-100 text-purple-600 text-xs font-medium px-2 py-1 rounded-full">미니머만</span>
              </div>
              <div class="flex justify-between mt-4">
                <button onclick="openModal('${pageContext.request.contextPath}/resources/images/template${i}.jpg')"
                        class="px-4 py-2 text-sm font-semibold bg-gray-100 hover:bg-gray-200 text-gray-800 rounded-lg">미리보기</button>
                <a href="${pageContext.request.contextPath}/resources/images/template${i}.jpg" download
                   class="px-4 py-2 text-sm font-semibold bg-blue-600 hover:bg-blue-700 text-white rounded-lg">다운로드</a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>

  <!-- 상세 미리보기 모니터 모니터 -->
  <div id="modal" class="fixed inset-0 bg-black bg-opacity-70 flex items-center justify-center z-50 hidden">
    <div class="bg-white rounded-xl p-6 w-full max-w-5xl relative">
      <span onclick="closeModal()" class="absolute top-4 right-6 text-gray-500 text-xl cursor-pointer">&times;</span>
      <h2 class="text-2xl font-semibold mb-4">템플릿 미리보기</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 items-start">
        <div>
          <img id="modalImage" src="" alt="템플릿 미리보기" class="w-full border rounded" />
        </div>
        <div>
          <div class="flex items-center mb-2">
            <div class="text-yellow-500 text-lg">★★★★☆</div>
            <span class="text-sm text-gray-500 ml-2">(32개 리뷰)</span>
          </div>
          <h3 class="text-lg font-bold mb-2">템플릿 특징:</h3>
          <ul class="list-disc list-inside text-sm text-gray-700 space-y-1">
            <li>ATS 최적화 디자인</li>
            <li>편집 가능한 세션</li>
            <li>MS Word, Google Docs 호환</li>
            <li>A4 사이즈 최적화</li>
            <li>전문 폰트 포함</li>
          </ul>
          <p class="mt-4 font-semibold text-sm text-gray-800">적합한 직무: <span class="font-normal">디자인, 마케팅, 신입 직원</span></p>
          <a id="downloadBtn" href="#" download
             class="mt-6 inline-block px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded font-medium">다운로드</a>
        </div>
      </div>
    </div>
  </div>

  <script>
    function openModal(src) {
      document.getElementById('modalImage').src = src;
      document.getElementById('downloadBtn').href = src;
      document.getElementById('modal').classList.remove('hidden');
      document.getElementById('modal').classList.add('flex');
    }
    function closeModal() {
      document.getElementById('modal').classList.add('hidden');
      document.getElementById('modal').classList.remove('flex');
    }
  </script>

<!-- 직무별 추천 템플릿 -->
<section class="py-12 bg-white">
  <div class="container mx-auto px-4">
    <h2 class="text-2xl font-bold mb-6">직무별 추천 템플릿</h2>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <!-- 개발자 템플릿 -->
      <div class="bg-blue-50 p-6 rounded-xl">
        <div class="text-blue-600 text-3xl mb-2">💻</div>
        <h3 class="text-lg font-semibold text-gray-900 mb-1">개발자 템플릿</h3>
        <p class="text-sm text-gray-700 mb-2">기술 스택과 프로젝트 경험을 효과적으로 보여주는 개발자 맞춤형 템플릿입니다.</p>
        <a href="#" class="text-blue-600 text-sm font-medium hover:underline">자세히 보기 →</a>
      </div>
      <!-- 디자이너 템플릿 -->
      <div class="bg-pink-50 p-6 rounded-xl">
        <div class="text-pink-600 text-3xl mb-2">🎨</div>
        <h3 class="text-lg font-semibold text-gray-900 mb-1">디자이너 템플릿</h3>
        <p class="text-sm text-gray-700 mb-2">창의성과 디자인 감각을 보여줄 수 있는 포트폴리오 중심의 템플릿입니다.</p>
        <a href="#" class="text-pink-600 text-sm font-medium hover:underline">자세히 보기 →</a>
      </div>
      <!-- 마케터 템플릿 -->
      <div class="bg-green-50 p-6 rounded-xl">
        <div class="text-green-600 text-3xl mb-2">📊</div>
        <h3 class="text-lg font-semibold text-gray-900 mb-1">마케팅 템플릿</h3>
        <p class="text-sm text-gray-700 mb-2">성과와 데이터를 강조하여 마케팅 전문성을 효과적으로 전달하는 템플릿입니다.</p>
        <a href="#" class="text-green-600 text-sm font-medium hover:underline">자세히 보기 →</a>
      </div>
    </div>
  </div>
</section>

<!-- 이력서 템플릿 사용 가이드 -->
<section class="py-12 bg-gray-50">
  <div class="container mx-auto px-4 text-center">
    <h2 class="text-2xl font-bold mb-10">이력서 템플릿 사용 가이드</h2>
    <div class="grid grid-cols-1 sm:grid-cols-3 gap-6">
      <!-- Step 1 -->
      <div class="bg-white rounded-xl p-6 shadow">
        <div class="text-4xl mb-4 text-gray-400">⬇️</div>
        <h3 class="font-semibold text-base mb-2">1. 템플릿 다운로드</h3>
        <p class="text-sm text-gray-600">원하는 템플릿을 선택하고 다운로드 버튼을 클릭하세요.</p>
      </div>
      <!-- Step 2 -->
      <div class="bg-white rounded-xl p-6 shadow">
        <div class="text-4xl mb-4 text-gray-400">✏️</div>
        <h3 class="font-semibold text-base mb-2">2. 내용 작성</h3>
        <p class="text-sm text-gray-600">템플릿에 자신의 정보와 경력을 입력하고 맞춤 설정하세요.</p>
      </div>
      <!-- Step 3 -->
      <div class="bg-white rounded-xl p-6 shadow">
        <div class="text-4xl mb-4 text-gray-400">📤</div>
        <h3 class="font-semibold text-base mb-2">3. 지원하기</h3>
        <p class="text-sm text-gray-600">완성된 이력서를 PDF로 저장하고 원하는 기업에 지원하세요.</p>
      </div>
    </div>
  </div>
</section>


<%@ include file="../common/footer.jsp" %>
</body>
</html>
