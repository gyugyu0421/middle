<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>
  
  <!-- 구글 번역 api -->
  <div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
   function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'ko',autoDisplay: false}, 'google_translate_element');}
</script>
  

  <!-- 페이지 헤더 -->
  <section class="bg-gradient-to-r from-indigo-50 to-indigo-100 py-12">
   <div class="container mx-auto px-4">
    <div class="max-w-4xl mx-auto">
     <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
      이력서 템플릿
     </h1>
     <p class="text-lg text-gray-700">
      다양한 직무와 경력에 맞는 전문적인 이력서 템플릿을 찾아보세요. 취업 성공률을 높이는 맞춤형 디자인으로 당신의 경력을 돋보이게 만들어 드립니다.
     </p>
    </div>
   </div>
  </section>
  <!-- <!-- 검색 및 필터 섹션 -->
  <!-- <section class="py-8 bg-white border-b">
   <div class="container mx-auto px-4">
    <div class="flex flex-col md:flex-row gap-6">
     검색바
     <div class="flex-1">
      <div class="relative">
       <input class="w-full pl-10 pr-4 py-3 rounded border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-opacity-50 text-sm" placeholder="템플릿 검색" type="text"/>
       <div class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5 flex items-center justify-center">
        <i class="ri-search-line">
        </i>
       </div>
      </div>
     </div>  -->
     
  <!-- 카테고리 탭 섹션 -->
  <section class="py-6 bg-white">
   <div class="container mx-auto px-4">
    <div class="category-tabs flex overflow-x-auto pb-2 space-x-2">
     <button class="category-tab px-5 py-2 text-white bg-primary rounded-full whitespace-nowrap text-sm font-medium">
      전체보기
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      직무별 템플릿
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      경력별 템플릿
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      디자인별 템플릿
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      산업별 템플릿
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      외국계 기업용
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      영문 이력서
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      일문 이력서
     </button>
     <button class="category-tab px-5 py-2 text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-full whitespace-nowrap text-sm font-medium">
      중문 이력서
     </button>
    </div>
   </div>
  </section>
  
  <!-- 템플릿 그리드 섹션 -->
  <section class="py-8 bg-gray-50">
   <div class="container mx-auto px-4">
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
     <div class="bg-white rounded shadow hover:shadow-md overflow-hidden">
      <img alt="테스트 템플릿" class="w-full h-48 object-cover object-top" src="${pageContext.request.contextPath}/resources/images/sample_preview.png"/>
      <div class="p-4">
       <h3 class="text-lg font-bold text-gray-900 mb-1">
        테스트 템플릿
       </h3>
       <p class="text-sm text-gray-600 mb-3">
        이건 미리보기와 다운로드 기능을 테스트하기 위한 카드입니다.
       </p>
       <div class="flex justify-between">
        <a class="bg-gray-200 text-sm px-4 py-2 rounded hover:bg-gray-300 transition" href="#" onclick="document.getElementById('previewModal').classList.remove('hidden'); return false;" target="_blank">
         미리보기
        </a>
        <a class="bg-primary text-white text-sm px-4 py-2 rounded hover:bg-primary/90 transition" download="" href="${pageContext.request.contextPath}/resources/files/sample_resume.pdf">
         다운로드
        </a>
       </div>
      </div>
     </div>
     
    <!-- 템플릿 카드 1 -->
<div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
  <div class="relative">
    <!-- 실제 썸네일 이미지 -->
    <img alt="심플 모던 템플릿"
         class="w-full h-64 object-cover object-top cursor-pointer"
         src="${pageContext.request.contextPath}/resources/images/template1.jpg"
         onclick="openModal('${pageContext.request.contextPath}/resources/images/template1.jpg')" />
  </div>
  <div class="p-4">
    <h3 class="font-bold text-gray-900 mb-2">심플 모던 템플릿</h3>
    <p class="text-gray-600 text-sm mb-3">깔끔한 디자인의 기본 템플릿으로 모든 직무에 적합합니다.</p>
    <div class="flex flex-wrap gap-2 mb-4">
      <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">전문가</span>
      <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">경력 3-5년</span>
      <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">미니멀</span>
    </div>
    <div class="flex justify-between items-center">
      <div class="flex space-x-2">
        <button onclick="openModal('${pageContext.request.contextPath}/resources/images/template1.jpg')"
                class="bg-white border border-blue-500 text-blue-500 px-3 py-1.5 text-sm rounded hover:bg-blue-50">
          미리보기
        </button>
        <a href="${pageContext.request.contextPath}/resources/files/template1.jpg" download
           class="bg-blue-500 text-white px-3 py-1.5 text-sm rounded hover:bg-blue-600">
          다운로드
        </a>
      </div>
    </div>
  </div>
</div>
     
     <!-- 템플릿 카드 2 -->
     <div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      <div class="relative">
       <img alt="크리에이티브 템플릿" class="w-full h-64 object-cover object-top" src="https://readdy.ai/api/search-image?query=Creative%2520resume%2520template%2520with%2520colorful%2520accents%252C%2520modern%2520layout%252C%2520visual%2520elements%252C%2520infographics%2520for%2520skills%252C%2520timeline%2520for%2520experience%252C%2520suitable%2520for%2520creative%2520industries%2520like%2520design%2520or%2520marketing&amp;width=400&amp;height=500&amp;seq=2&amp;orientation=portrait"/>
       <button class="absolute top-3 left-3 bg-white rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
       </button>
      </div>
      <div class="p-4">
       <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold text-gray-900">
         크리에이티브 템플릿
        </h3>
       </div>
       <p class="text-gray-600 text-sm mb-3">
        디자인 직군을 위한 창의적인 레이아웃과 시각적 요소가 특징입니다.
       </p>
       <div class="flex flex-wrap gap-2 mb-4">
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         디자인
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         마케팅
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         창의적
        </span>
       </div>
       <div class="flex justify-between items-center">
        <div class="flex space-x-2">
         <button class="template-preview-btn bg-white border border-primary text-primary px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors" data-template="template2">
          미리보기
         </button>
         <button class="bg-primary text-white px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors">
          다운로드
         </button>
        </div>
       </div>
      </div>
     </div>
     <!-- 템플릿 카드 3 -->
     <div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      <div class="relative">
       <img alt="프로페셔널 템플릿" class="w-full h-64 object-cover object-top" src="https://readdy.ai/api/search-image?query=Professional%2520executive%2520resume%2520template%2520with%2520sophisticated%2520layout%252C%2520elegant%2520typography%252C%2520structured%2520sections%2520for%2520career%2520summary%252C%2520achievements%252C%2520leadership%2520experience%252C%2520suitable%2520for%2520senior%2520management%2520positions&amp;width=400&amp;height=500&amp;seq=3&amp;orientation=portrait"/>
       <button class="absolute top-3 left-3 bg-white rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
       </button>
      </div>
      <div class="p-4">
       <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold text-gray-900">
         프로페셔널 템플릿
        </h3>
       </div>
       <p class="text-gray-600 text-sm mb-3">
        경영진 및 관리자를 위한 세련된 디자인과 구조화된 레이아웃입니다.
       </p>
       <div class="flex flex-wrap gap-2 mb-4">
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         경영
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         경력 8년+
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         고급
        </span>
       </div>
       <div class="flex justify-between items-center">
        <div class="flex space-x-2">
         <button class="template-preview-btn bg-white border border-primary text-primary px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors" data-template="template3">
          미리보기
         </button>
         <button class="bg-primary text-white px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors">
          다운로드
         </button>
        </div>
       </div>
      </div>
     </div>
     <!-- 템플릿 카드 4 -->
     <div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      <div class="relative">
       <img alt="테크니컬 템플릿" class="w-full h-64 object-cover object-top" src="https://readdy.ai/api/search-image?query=Technical%2520resume%2520template%2520with%2520structured%2520layout%2520for%2520technical%2520skills%252C%2520project%2520experience%252C%2520coding%2520languages%252C%2520certifications%252C%2520education%252C%2520suitable%2520for%2520IT%2520professionals%252C%2520software%2520engineers%252C%2520and%2520developers&amp;width=400&amp;height=500&amp;seq=4&amp;orientation=portrait"/>
       <button class="absolute top-3 left-3 bg-white rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
       </button>
      </div>
      <div class="p-4">
       <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold text-gray-900">
         테크니컬 템플릿
        </h3>
        <div class="star-rating">
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-half-fill">
         </i>
         <span class="text-gray-600 text-sm ml-1">
          4.7
         </span>
        </div>
       </div>
       <p class="text-gray-600 text-sm mb-3">
        IT 및 개발자를 위한 기술 스킬과 프로젝트 경험을 강조하는 템플릿입니다.
       </p>
       <div class="flex flex-wrap gap-2 mb-4">
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         개발
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         IT
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         기술
        </span>
       </div>
       <div class="flex justify-between items-center">
        <div class="flex space-x-2">
         <button class="template-preview-btn bg-white border border-primary text-primary px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors" data-template="template4">
          미리보기
         </button>
         <button class="bg-primary text-white px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors">
          다운로드
         </button>
        </div>
       </div>
      </div>
     </div>
     <!-- 템플릿 카드 5 -->
     <div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      <div class="relative">
       <img alt="ATS 최적화 템플릿" class="w-full h-64 object-cover object-top" src="https://readdy.ai/api/search-image?query=ATS-friendly%2520resume%2520template%2520with%2520clean%2520design%252C%2520optimized%2520for%2520applicant%2520tracking%2520systems%252C%2520clear%2520section%2520headings%252C%2520bullet%2520points%2520for%2520achievements%252C%2520suitable%2520for%2520job%2520applications%2520to%2520large%2520corporations&amp;width=400&amp;height=500&amp;seq=5&amp;orientation=portrait"/>
       <button class="absolute top-3 left-3 bg-white rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
       </button>
      </div>
      <div class="p-4">
       <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold text-gray-900">
         ATS 최적화 템플릿
        </h3>
       </div>
       <p class="text-gray-600 text-sm mb-3">
        채용 관리 시스템(ATS)에 최적화된 템플릿으로 합격률을 높여줍니다.
       </p>
       <div class="flex flex-wrap gap-2 mb-4">
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         ATS 최적화
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         대기업
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         신입
        </span>
       </div>
       <div class="flex justify-between items-center">
        <div class="flex space-x-2">
         <button class="template-preview-btn bg-white border border-primary text-primary px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors" data-template="template5">
          미리보기
         </button>
         <button class="bg-primary text-white px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors">
          다운로드
         </button>
        </div>
       </div>
      </div>
     </div>
     <!-- 템플릿 카드 6 -->
     <div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      <div class="relative">
       <img alt="인포그래픽 템플릿" class="w-full h-64 object-cover object-top" src="https://readdy.ai/api/search-image?query=Modern%2520infographic%2520resume%2520template%2520with%2520visual%2520data%2520representation%252C%2520skill%2520bars%252C%2520pie%2520charts%252C%2520timeline%2520graphics%252C%2520suitable%2520for%2520data%2520analysts%252C%2520marketers%252C%2520and%2520professionals%2520who%2520want%2520to%2520showcase%2520achievements%2520visually&amp;width=400&amp;height=500&amp;seq=6&amp;orientation=portrait"/>
       <button class="absolute top-3 left-3 bg-white rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
       </button>
      </div>
      <div class="p-4">
       <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold text-gray-900">
         인포그래픽 템플릿
        </h3>
       </div>
       <p class="text-gray-600 text-sm mb-3">
        시각적 데이터 표현을 통해 스킬과 경험을 효과적으로 보여주는 템플릿입니다.
       </p>
       <div class="flex flex-wrap gap-2 mb-4">
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         데이터 분석
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         마케팅
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         시각화
        </span>
       </div>
       <div class="flex justify-between items-center">
        <div class="flex space-x-2">
         <button class="template-preview-btn bg-white border border-primary text-primary px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors" data-template="template6">
          미리보기
         </button>
         <button class="bg-primary text-white px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors">
          다운로드
         </button>
        </div>
       </div>
      </div>
     </div>
     <!-- 템플릿 카드 7 -->
     <div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      <div class="relative">
       <img alt="미니멀리스트 템플릿" class="w-full h-64 object-cover object-top" src="https://readdy.ai/api/search-image?query=Minimalist%2520resume%2520template%2520with%2520elegant%2520typography%252C%2520ample%2520white%2520space%252C%2520clean%2520lines%252C%2520subtle%2520design%2520elements%252C%2520suitable%2520for%2520professionals%2520in%2520any%2520industry%2520who%2520prefer%2520a%2520refined%252C%2520understated%2520presentation&amp;width=400&amp;height=500&amp;seq=7&amp;orientation=portrait"/>
       <button class="absolute top-3 left-3 bg-white rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
       </button>
      </div>
      <div class="p-4">
       <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold text-gray-900">
         미니멀리스트 템플릿
        </h3>
       </div>
       <p class="text-gray-600 text-sm mb-3">
        세련된 타이포그래피와 여백을 활용한 미니멀한 디자인의 템플릿입니다.
       </p>
       <div class="flex flex-wrap gap-2 mb-4">
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         미니멀
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         세련됨
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         다목적
        </span>
       </div>
       <div class="flex justify-between items-center">
        <div class="flex space-x-2">
         <button class="template-preview-btn bg-white border border-primary text-primary px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors" data-template="template7">
          미리보기
         </button>
         <button class="bg-primary text-white px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors">
          다운로드
         </button>
        </div>
       </div>
      </div>
     </div>
     <!-- 템플릿 카드 8 -->
     <div class="bg-white rounded shadow-sm hover:shadow-md transition-shadow overflow-hidden">
      <div class="relative">
       <img alt="글로벌 템플릿" class="w-full h-64 object-cover object-top" src="https://readdy.ai/api/search-image?query=International%2520resume%2520template%2520with%2520multilingual%2520support%252C%2520format%2520suitable%2520for%2520global%2520job%2520applications%252C%2520sections%2520for%2520language%2520proficiency%252C%2520international%2520experience%252C%2520cultural%2520competencies%252C%2520ideal%2520for%2520professionals%2520seeking%2520work%2520abroad&amp;width=400&amp;height=500&amp;seq=8&amp;orientation=portrait"/>
       <button class="absolute top-3 left-3 bg-white rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-primary">
       </button>
      </div>
      <div class="p-4">
       <div class="flex justify-between items-start mb-2">
        <h3 class="font-bold text-gray-900">
         글로벌 템플릿
        </h3>
       </div>
       <p class="text-gray-600 text-sm mb-3">
        해외 취업을 위한 다국어 지원 및 국제 경험을 강조하는 템플릿입니다.
       </p>
       <div class="flex flex-wrap gap-2 mb-4">
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         해외취업
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         다국어
        </span>
        <span class="bg-gray-100 text-gray-700 text-xs px-2 py-1 rounded-full">
         글로벌
        </span>
       </div>
       <div class="flex justify-between items-center">
        <div class="flex space-x-2">
         <button class="template-preview-btn bg-white border border-primary text-primary px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors" data-template="template8">
          미리보기
         </button>
         <button class="bg-primary text-white px-3 py-1.5 text-sm !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors">
          다운로드
         </button>
        </div>
       </div>
      </div>
     </div>
    </div>
    <!-- 페이지네이션 -->
    <div class="flex justify-center mt-10">
     <nav class="inline-flex rounded-md shadow">
      <a class="py-2 px-4 bg-white text-gray-500 hover:text-primary border border-gray-300 rounded-l-md" href="#">
       이전
      </a>
      <a class="py-2 px-4 bg-primary text-white border border-primary" href="#">
       1
      </a>
      <a class="py-2 px-4 bg-white text-gray-700 hover:text-primary border border-gray-300" href="#">
       2
      </a>
      <a class="py-2 px-4 bg-white text-gray-700 hover:text-primary border border-gray-300" href="#">
       3
      </a>
      <a class="py-2 px-4 bg-white text-gray-700 hover:text-primary border border-gray-300" href="#">
       4
      </a>
      <a class="py-2 px-4 bg-white text-gray-700 hover:text-primary border border-gray-300" href="#">
       5
      </a>
      <a class="py-2 px-4 bg-white text-gray-500 hover:text-primary border border-gray-300 rounded-r-md" href="#">
       다음
      </a>
     </nav>
    </div>
   </div>
  </section>
  <!-- 템플릿 추천 섹션 -->
  <section class="py-12 bg-white">
   <div class="container mx-auto px-4">
    <h2 class="text-2xl font-bold text-gray-900 mb-8">
     직무별 추천 템플릿
    </h2>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
     <!-- 개발자 템플릿 -->
     <div class="bg-gradient-to-r from-blue-50 to-indigo-50 rounded-lg p-6">
      <div class="flex items-center mb-4">
       <div class="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center mr-4">
        <i class="ri-code-s-slash-line text-blue-600 ri-xl">
        </i>
       </div>
       <h3 class="text-xl font-bold text-gray-900">
        개발자 템플릿
       </h3>
      </div>
      <p class="text-gray-700 mb-4">
       기술 스택과 프로젝트 경험을 효과적으로 보여주는 개발자 맞춤형 템플릿입니다.
      </p>
      <a class="text-primary hover:text-indigo-700 font-medium flex items-center" href="#">
       자세히 보기
       <i class="ri-arrow-right-line ri-lg ml-1">
       </i>
      </a>
     </div>
     <!-- 디자이너 템플릿 -->
     <div class="bg-gradient-to-r from-purple-50 to-pink-50 rounded-lg p-6">
      <div class="flex items-center mb-4">
       <div class="w-12 h-12 rounded-full bg-purple-100 flex items-center justify-center mr-4">
        <i class="ri-palette-line text-purple-600 ri-xl">
        </i>
       </div>
       <h3 class="text-xl font-bold text-gray-900">
        디자이너 템플릿
       </h3>
      </div>
      <p class="text-gray-700 mb-4">
       창의성과 디자인 감각을 보여줄 수 있는 포트폴리오 중심의 템플릿입니다.
      </p>
      <a class="text-primary hover:text-indigo-700 font-medium flex items-center" href="#">
       자세히 보기
       <i class="ri-arrow-right-line ri-lg ml-1">
       </i>
      </a>
     </div>
     <!-- 마케팅 템플릿 -->
     <div class="bg-gradient-to-r from-green-50 to-teal-50 rounded-lg p-6">
      <div class="flex items-center mb-4">
       <div class="w-12 h-12 rounded-full bg-green-100 flex items-center justify-center mr-4">
        <i class="ri-line-chart-line text-green-600 ri-xl">
        </i>
       </div>
       <h3 class="text-xl font-bold text-gray-900">
        마케팅 템플릿
       </h3>
      </div>
      <p class="text-gray-700 mb-4">
       성과와 데이터를 강조하여 마케팅 전문성을 효과적으로 전달하는 템플릿입니다.
      </p>
      <a class="text-primary hover:text-indigo-700 font-medium flex items-center" href="#">
       자세히 보기
       <i class="ri-arrow-right-line ri-lg ml-1">
       </i>
      </a>
     </div>
    </div>
   </div>
  </section>
  <!-- 템플릿 사용 가이드 섹션 -->
  <section class="py-12 bg-gray-50">
   <div class="container mx-auto px-4">
    <div class="max-w-4xl mx-auto">
     <h2 class="text-2xl font-bold text-gray-900 mb-8 text-center">
      이력서 템플릿 사용 가이드
     </h2>
     <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <div class="bg-white p-6 rounded-lg shadow-sm text-center">
       <div class="w-16 h-16 mx-auto bg-indigo-100 rounded-full flex items-center justify-center mb-4">
       </div>
       <h3 class="text-lg font-bold text-gray-900 mb-2">
        1. 템플릿 다운로드
       </h3>
       <p class="text-gray-600">
        원하는 템플릿을 선택하고 다운로드 버튼을 클릭하세요.
       </p>
      </div>
      <div class="bg-white p-6 rounded-lg shadow-sm text-center">
       <div class="w-16 h-16 mx-auto bg-indigo-100 rounded-full flex items-center justify-center mb-4">
        <i class="ri-edit-line text-primary ri-xl">
        </i>
       </div>
       <h3 class="text-lg font-bold text-gray-900 mb-2">
        2. 내용 작성
       </h3>
       <p class="text-gray-600">
        템플릿에 자신의 정보와 경력을 입력하고 맞춤 설정하세요.
       </p>
      </div>
      <div class="bg-white p-6 rounded-lg shadow-sm text-center">
       <div class="w-16 h-16 mx-auto bg-indigo-100 rounded-full flex items-center justify-center mb-4">
        <i class="ri-send-plane-line text-primary ri-xl">
        </i>
       </div>
       <h3 class="text-lg font-bold text-gray-900 mb-2">
        3. 지원하기
       </h3>
       <p class="text-gray-600">
        완성된 이력서를 PDF로 저장하고 원하는 기업에 지원하세요.
       </p>
      </div>
     </div>
    <!--  <div class="mt-10 text-center">
      <a class="bg-primary text-white px-6 py-3 !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors inline-block" href="#">
       템플릿 사용 상세 가이드
      </a>
     </div> -->
    </div>
   </div>
  </section>
  <!-- 뉴스레터 구독 섹션 -->
  <!-- <section class="py-12 bg-primary bg-opacity-5">
   <div class="container mx-auto px-4">
    <div class="max-w-3xl mx-auto text-center">
     <h2 class="text-2xl font-bold text-gray-900 mb-3">
      새로운 템플릿 소식 받아보기
     </h2>
     <p class="text-gray-700 mb-6">
      최신 이력서 템플릿과 취업 팁을 이메일로 받아보세요.
     </p>
     <form class="flex flex-col sm:flex-row gap-3 max-w-lg mx-auto">
      <input class="flex-1 px-4 py-3 rounded border-gray-300 border focus:outline-none focus:ring-2 focus:ring-primary focus:ring-opacity-50 text-sm" placeholder="이메일 주소를 입력하세요" type="email"/>
      <button class="bg-primary text-white px-6 py-3 !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors" type="submit">
       구독하기
      </button>
     </form>
     <p class="text-gray-500 text-sm mt-4">
      개인정보 보호정책에 동의하며, 언제든지 구독을 취소할 수 있습니다.
     </p>
    </div>
   </div>
  </section> -->
  
  <!-- 템플릿 미리보기 모달 -->
  <div class="template-modal" id="templateModal">
   <div class="bg-white w-full max-w-4xl mx-auto my-10 rounded-lg shadow-xl overflow-hidden">
    <div class="flex justify-between items-center p-4 border-b">
     <h3 class="text-xl font-bold text-gray-900">
      템플릿 미리보기
     </h3>
     <button class="text-gray-500 hover:text-gray-700 w-8 h-8 flex items-center justify-center" id="closeModal">
      <i class="ri-close-line ri-lg">
      </i>
     </button>
    </div>
    <div class="p-6">
     <div class="flex flex-col md:flex-row gap-6">
      <div class="md:w-1/2">
       <img alt="템플릿 미리보기" class="w-full h-auto rounded border" id="modalTemplateImage" src=""/>
      </div>
      <div class="md:w-1/2">
       <h4 class="text-xl font-bold text-gray-900 mb-2" id="modalTemplateName">
       </h4>
       <div class="flex items-center mb-4">
        <div class="star-rating mr-2">
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-fill">
         </i>
         <i class="ri-star-half-fill">
         </i>
        </div>
        <span class="text-gray-600 text-sm">
         (32개 리뷰)
        </span>
       </div>
       <p class="text-gray-700 mb-4" id="modalTemplateDesc">
       </p>
       <div class="mb-4">
        <h5 class="font-medium text-gray-900 mb-2">
         템플릿 특징:
        </h5>
        <ul class="list-disc pl-5 text-gray-700 space-y-1">
         <li>
          ATS 최적화 디자인
         </li>
         <li>
          편집 가능한 섹션
         </li>
         <li>
          MS Word, Google Docs 호환
         </li>
         <li>
          A4 사이즈 최적화
         </li>
         <li>
          전문 폰트 포함
         </li>
        </ul>
       </div>
       <div class="mb-6">
        <h5 class="font-medium text-gray-900 mb-2">
         적합한 직무:
        </h5>
        <div class="flex flex-wrap gap-2" id="modalTemplateTags">
        </div>
       </div>
       <div class="flex space-x-3">
        <button class="bg-primary text-white px-6 py-3 !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors flex-1">
         다운로드
        </button>
        <button class="border border-primary text-primary px-4 py-3 !rounded-button whitespace-nowrap font-medium hover:bg-primary hover:text-white transition-colors">
        </button>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  <script>
  </script>
  <!-- 미리보기 모달 -->
  <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden z-50" id="previewModal">
   <div class="bg-white p-4 rounded shadow-lg max-w-4xl w-full relative">
    <button class="absolute top-2 right-2 text-gray-500 hover:text-gray-700 text-xl" onclick="document.getElementById('previewModal').classList.add('hidden');">
     ×
    </button>
    <img alt="미리보기 이미지" class="w-full h-auto object-contain rounded" src="${pageContext.request.contextPath}/resources/images/sample_preview.png"/>
   </div>
  </div>
  
  <!-- 미리보기 모달 -->
<div id="previewModal" class="fixed inset-0 bg-black bg-opacity-60 z-50 flex items-center justify-center hidden">
  <!-- 모달 컨테이너 -->
  <div class="bg-white rounded-xl shadow-xl overflow-hidden w-full max-w-3xl relative">

    <!-- 닫기 버튼 -->
    <button onclick="closePreview()"
            class="absolute top-4 right-4 text-gray-600 hover:text-black text-3xl font-bold z-10">
      &times;
    </button>

    <!-- 이미지 본문 -->
    <img id="previewImage" src="" alt="템플릿 미리보기"
         class="w-full object-contain max-h-[80vh]" />

    <!-- 하단 다운로드 영역 -->
    <div class="flex justify-end p-4">
      <a id="downloadLink" href="#" download
         class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">
        다운로드
      </a>
    </div>

  </div>
</div>

<script>
  function openPreview(src) {
    document.getElementById("previewImage").src = src;
    document.getElementById("downloadLink").href = src; // 다운로드도 동일한 이미지 사용
    document.getElementById("previewModal").classList.remove("hidden");
  }

  function closePreview() {
    document.getElementById("previewModal").classList.add("hidden");
  }
</script>
  
  
  
  
  
  <%@ include file="../common/footer.jsp" %> 
 </body>
</html>
