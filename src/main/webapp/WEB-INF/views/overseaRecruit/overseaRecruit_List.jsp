<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>


<%-- <!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Respot - 해외 채용공고</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: { primary: "#3b82f6", secondary: "#64748b" },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"
    />
    <style>
      :where([class^="ri-"])::before { content: "\f3c2"; }
      body {
          font-family: 'Noto Sans KR', sans-serif;
      }
      .dropdown {
          display: none;
      }
      .dropdown-trigger:hover .dropdown {
          display: block;
      }
      .salary-slider {
          -webkit-appearance: none;
          appearance: none;
          width: 100%;
          height: 4px;
          background: #e5e7eb;
          border-radius: 4px;
          outline: none;
      }
      .salary-slider::-webkit-slider-thumb {
          -webkit-appearance: none;
          appearance: none;
          width: 16px;
          height: 16px;
          background: #3b82f6;
          border-radius: 50%;
          cursor: pointer;
      }
      .salary-slider::-moz-range-thumb {
          width: 16px;
          height: 16px;
          background: #3b82f6;
          border-radius: 50%;
          cursor: pointer;
          border: none;
      }
      .custom-checkbox {
          position: relative;
          display: inline-block;
          width: 20px;
          height: 20px;
          background-color: #fff;
          border: 2px solid #d1d5db;
          border-radius: 4px;
          cursor: pointer;
          transition: all 0.2s;
      }
      .custom-checkbox.checked {
          background-color: #3b82f6;
          border-color: #3b82f6;
      }
      .custom-checkbox.checked::after {
          content: '';
          position: absolute;
          top: 4px;
          left: 7px;
          width: 5px;
          height: 10px;
          border: solid white;
          border-width: 0 2px 2px 0;
          transform: rotate(45deg);
      }
      .custom-radio {
          position: relative;
          display: inline-block;
          width: 20px;
          height: 20px;
          background-color: #fff;
          border: 2px solid #d1d5db;
          border-radius: 50%;
          cursor: pointer;
          transition: all 0.2s;
      }
      .custom-radio.checked {
          border-color: #3b82f6;
      }
      .custom-radio.checked::after {
          content: '';
          position: absolute;
          top: 4px;
          left: 4px;
          width: 8px;
          height: 8px;
          background-color: #3b82f6;
          border-radius: 50%;
      }
    </style>
  </head>
  <body class="bg-gray-50 min-h-screen">
  
    <!-- 구글 번역 api -->
  <div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
	function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'ko',autoDisplay: false}, 'google_translate_element');}
</script>
  
<!-- 네비게이션 바 -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
      <div class="container mx-auto px-4 py-3">
        <div class="flex items-center justify-between">
          <!-- 로고 -->
          <a href="#" class="font-['Pacifico'] text-2xl">
            <span class="text-primary">Re</span
            ><span class="text-gray-800">spot</span>
          </a>
          <!-- 메인 메뉴 -->
          <nav class="hidden md:flex space-x-8">
            <!-- 채용공고 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                채용공고
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >국내공고</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >해외공고</a
                >
              </div>
            </div>
            <!-- 이력서 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                이력서
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="https://readdy.ai/home/6dd34a74-a32d-44e9-b27d-db7ebada69a5/3916e0ea-3168-4bc4-a57f-bd0682b929ed"
                  data-readdy="true"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >이력서 서식</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >이력서 작성</a
                >
              </div>
            </div>
            <!-- 템플릿 -->
            <a
              href="#"
              class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >템플릿</a
            >
            <!-- 커리어 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                커리어
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >합격 이력서</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >합격 자기소개서</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >면접 후기</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >기업 리뷰</a
                >
              </div>
            </div>
            <!-- 게시판 -->
            <div class="dropdown-trigger relative group">
              <button
                class="text-gray-700 font-medium hover:text-primary transition-colors py-2"
              >
                게시판
              </button>
              <div
                class="dropdown absolute left-0 mt-1 bg-white shadow-lg rounded-md w-48 py-2 z-10"
              >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >1:1 문의</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >자유게시판</a
                >
                <a
                  href="#"
                  class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                  >자주 묻는 질문 (FAQ)</a
                >
              </div>
            </div>
          </nav>
          <!-- 로그인/회원가입 버튼 -->

    <div class="flex items-center space-x-4">
      <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
          <span class="text-gray-700 font-medium">${sessionScope.loginUser.username} 님</span>
          <a href="${pageContext.request.contextPath}/logout" class="text-gray-600 hover:underline">로그아웃</a>
        </c:when>
        <c:otherwise>
          <a href="#" onclick="document.getElementById('loginModal').classList.remove('hidden')"
             class="flex items-center space-x-4">로그인</a>
          <a href="/signup.jsp" class="bg-primary text-white px-4 py-2 rounded-button text-sm font-medium hover:bg-blue-600 transition-colors whitespace-nowrap">회원가입</a>
        </c:otherwise>
      </c:choose>
    </div>
    
		    <div class="flex items-center space-x-4">
		  <c:choose>
		    <c:when test="${not empty sessionScope.loginUser}">
		      <span class="text-gray-700 font-medium">${sessionScope.loginUser.username} 님</span>
		      <a href="${pageContext.request.contextPath}/logout" class="text-gray-600 hover:underline">로그아웃</a>
		    </c:when>
		    <c:otherwise>
		      <a href="#" onclick="document.getElementById('loginModal').classList.remove('hidden')"
		         class="flex items-center space-x-4">로그인</a>
		      <a href="/signup.jsp"
		         class="bg-primary text-white px-4 py-2 rounded-button text-sm font-medium hover:bg-blue-600 transition-colors whitespace-nowrap">회원가입</a>
		    </c:otherwise>
		  </c:choose>
		</div>


<!-- 로그인 모달 나오게하기 -->
<div id="loginModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50 hidden">
  <div class="bg-white p-8 rounded-xl w-full max-w-md relative shadow-lg">
    <!-- 닫기 버튼 -->
    <button onclick="document.getElementById('loginModal').classList.add('hidden')"
            class="absolute top-2 right-2 text-gray-500 hover:text-black text-xl">
      &times;
    </button>

    <h2 class="text-2xl font-bold text-center text-blue-600 mb-6">로그인</h2>

    <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-5">
      <div>
        <label for="id" class="block text-gray-700 mb-1">ID:</label>
        <input type="text" id="id" name="id" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <div>
        <label for="pw" class="block text-gray-700 mb-1">PASSWORD:</label>
        <input type="password" id="pw" name="pw" required
               class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>
      <button type="submit"
              class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 font-semibold">
        로그인
      </button>
    </form>

    <div class="text-center mt-4 text-sm text-gray-600">
      계정이 없으신가요?
      <a href="/signup.jsp" class="text-blue-600 hover:underline ml-1">회원가입</a>
      <a href="/signup.jsp" class="text-blue-600 hover:underline ml-1">기업가입</a>
    </div>
  </div>


        </div>
      </div>
    </header> --%>
    
    
    <!-- 메인 콘텐츠 -->
    <main class="container mx-auto px-4 py-8">
      <!-- 페이지 제목 -->
      <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900">해외 채용공고</h1>
        <p class="text-gray-600 mt-2">
          해외의 다양한 기업들의 채용 정보를 확인하세요.
        </p>
      </div>
      
      <!-- 검색필터 부분 --><form method="GET" action="/middle/overseaRecruit/overseaRecruit_List">
  <section class="bg-white rounded-lg shadow-sm p-6 mb-8">
<!--     <div class="mb-6">
      <div class="relative">
        <input
          type="text"
          name="query"
          placeholder="직무, 기업명, 지역으로 검색"
          class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded text-sm"
        />
        <div class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5 flex items-center justify-center">
          <i class="ri-search-line"></i>
        </div>
      </div>
    </div> -->

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
      <!-- ✅ 학력: rcedu -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">학력</label>
        <div class="relative">
          <select name="rcedu" class="w-full pl-3 pr-10 py-2.5 border rounded text-sm">
            <option value="">학력</option>
            <option value="고교 졸업 이상">고교 졸업 이상</option>
            <option value="대학 졸업 이상">대학 졸업 이상</option>
            <option value="대학원 졸업 이상">대학원 졸업 이상</option>
            <option value="석사 졸업 이상">석사 졸업 이상</option>
            <option value="박사 졸업 이상">박사 졸업 이상</option>
            <option value="무관">무관</option>
          </select>
        </div>
      </div>

      <!-- ✅ 경력: rchist -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">경력</label>
        <div class="relative">
          <select name="rchist" class="w-full pl-3 pr-10 py-2.5 border rounded text-sm">
            <option value="">전체 경력</option>
            <option value="신입">신입</option>
            <option value="1년 미만">1년 미만</option>
            <option value="1~3년">1~3년</option>
            <option value="3~5년">3~5년</option>
            <option value="5~10년">5~10년</option>
            <option value="10년 이상">10년 이상</option>
            <option value="경력무관">경력무관</option>
          </select>
        </div>
      </div>

      <!-- ✅ 정렬: sort (매퍼 그대로 사용 가능) -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-1">정렬</label>
        <div class="relative">
          <select name="sort" class="w-full pl-3 pr-10 py-2.5 border rounded text-sm">
            <option value="최신순">최신순</option>
            <option value="마감임박순">마감임박순</option>
            <option value="연봉순">연봉순</option>
          </select>
        </div>
      </div>
    </div>

    <!-- ✅ 연봉 필터 (추가 가능) -->
    <div class="mb-6">
<!--       <label class="block text-sm font-medium text-gray-700">연봉 범위</label>
      <span class="text-sm text-primary font-medium" id="salary-value">3,000만원 이상</span>
      <input type="range" name="salary" min="0" max="10000" step="100" value="3000" class="salary-slider" />
      <div class="flex justify-between mt-1">
        <span class="text-xs text-gray-500">0원</span>
        <span class="text-xs text-gray-500">1억원 이상</span>
      </div> -->
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-6">
      <!-- ✅ 고용형태: employmentTypes -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">고용형태</label>
        <div class="flex flex-wrap gap-3">
          <label class="flex items-center">
            <input type="checkbox" name="employmentTypes" value="정규직" class="mr-2" /> 정규직
          </label>
          <label class="flex items-center">
            <input type="checkbox" name="employmentTypes" value="계약직" class="mr-2" /> 계약직
          </label>
          <label class="flex items-center">
            <input type="checkbox" name="employmentTypes" value="인턴" class="mr-2" /> 인턴
          </label>
          <label class="flex items-center">
            <input type="checkbox" name="employmentTypes" value="프리랜서" class="mr-2" /> 프리랜서
          </label>
        </div>
      </div>

      <!-- ✅ 기업형태: companyTypes -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">기업 형태</label>
        <div class="flex flex-wrap gap-3">
          <label class="flex items-center">
            <input type="checkbox" name="companyTypes" value="대기업" class="mr-2" /> 대기업
          </label>
          <label class="flex items-center">
            <input type="checkbox" name="companyTypes" value="중견기업" class="mr-2" /> 중견기업
          </label>
          <label class="flex items-center">
            <input type="checkbox" name="companyTypes" value="중소기업" class="mr-2" /> 중소기업
          </label>
          <label class="flex items-center">
            <input type="checkbox" name="companyTypes" value="스타트업" class="mr-2" /> 스타트업
          </label>
        </div>
      </div>
    </div>

    <div class="flex justify-end gap-3">
      <!-- <button type="reset" class="px-4 py-2 border rounded text-sm text-gray-700">초기화</button> -->
      <button type="submit" class="px-4 py-2 bg-primary text-white rounded text-sm">필터 적용</button>
    </div>
  </section>
</form>

      <!-- 채용공고 목록 -->
      <section class="mb-10">
        <div class="flex justify-between items-center mb-6">
          <div class="text-gray-700">
            총 <span class="text-primary font-medium">${recruCount}</span>개의 채용공고
          </div>
          
          <form method="GET" action="/middle/overseaRecruit/overseaRecruit_Write">
          
          <div class="flex items-center space-x-2">
          
        <!-- session에 저장된 사용자 타입이 "기업"일 경우 -->
		<!-- 글쓰기 버튼: 기업회원만 표시, 별도 영역에 배치 -->
		<c:if test="${not empty sessionScope.loginUser and sessionScope.loginUser.type eq '기업'}">
		      <button type="submit" class="px-4 py-2 bg-primary text-white rounded text-sm">글쓰기</button>
		  </c:if>
		               
            </form>
<!--             <button
              class="w-8 h-8 bg-primary text-white rounded flex items-center justify-center"
            >
              <i class="ri-layout-grid-line"></i>
            </button>
            <button
              class="w-8 h-8 bg-white text-gray-500 rounded border border-gray-200 flex items-center justify-center"
            >
              <i class="ri-list-check"></i>
            </button> -->
          </div>
        </div>
          
<!--             <button
              class="w-8 h-8 bg-primary text-white rounded flex items-center justify-center"
            >
              <i class="ri-layout-grid-line"></i>
            </button>
            <button
              class="w-8 h-8 bg-white text-gray-500 rounded border border-gray-200 flex items-center justify-center"
            >
              <i class="ri-list-check"></i>
            </button>
          </div>
        </div> -->

        <!-- 채용공고 그리드 -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        
        <c:forEach items="${recruitList}" var="recruitment" begin="0" end="5">
        
          <!-- 채용 공고 카드 1 -->
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="p-6">
              <div class="flex justify-between items-start mb-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-1">
                  <a href="overseaRecruit_View?rckey=${recruitment.rckey }">
                    ${recruitment.rctitle}
                    </a>
                  </h3>
                  <p class="text-primary font-medium">${recruitment.username}</p>
                </div>
                <span
                  class="bg-blue-100 text-primary text-xs px-2 py-1 rounded-full"
                  >${recruitment.rcwtype}</span>
              </div>
              <div class="space-y-2 mb-4">
                <p class="text-gray-600 text-sm flex items-center">
                  <i
                    class="ri-user-line mr-2 w-4 h-4 flex items-center justify-center"
                  ></i>
                  ${recruitment.rcrank}
                  </p>
                  <p class="text-gray-600 text-sm flex items-center">
                   <i
                    class="ri-map-pin-line mr-2 w-4 h-4 flex items-center justify-center"
                  ></i>
                  ${recruitment.rregion}
                </p>
                <p class="text-gray-600 text-sm flex items-center">
                  <i
                    class="ri-time-line mr-2 w-4 h-4 flex items-center justify-center"
                  ></i>
 					<c:out value="${fn:substringBefore(recruitment.rcdeadline, ' ')}" />
                </p>
              </div>
              <div class="flex flex-wrap gap-2">
                <span
                  class="bg-gray-100 text-gray-600 text-xs px-2 py-1 rounded-full"
                  >${recruitment.rcpreffer}</span>
              </div>
            </div>
            <div
              class="border-t border-gray-100 px-6 py-3 flex justify-between items-center"
            >
              <span class="text-gray-500 text-sm">연봉:${recruitment.rcsal}만 달러(&dollar;) 이상</span>
              <button
                class="text-gray-400 hover:text-primary w-8 h-8 flex items-center justify-center rounded-full hover:bg-blue-50 transition-colors"
              >
                <!-- <i class="ri-bookmark-line"></i> -->
              </button>
            </div>
          </div>
          
          </c:forEach>
          
                    
        </div>

        <!-- 페이지네이션 -->
        <!-- <div class="flex justify-center mt-10">
          <nav class="flex items-center space-x-1">
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full border border-gray-300 text-gray-600 hover:bg-gray-50"
            >
              <i class="ri-arrow-left-s-line"></i>
            </a>
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full bg-primary text-white"
              >1</a
            >
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full text-gray-700 hover:bg-gray-100"
              >2</a
            >
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full text-gray-700 hover:bg-gray-100"
              >3</a
            >
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full text-gray-700 hover:bg-gray-100"
              >4</a
            >
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full text-gray-700 hover:bg-gray-100"
              >5</a
            >
            <span
              class="w-10 h-10 flex items-center justify-center text-gray-500"
              >...</span
            >
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full text-gray-700 hover:bg-gray-100"
              >42</a
            >
            <a
              href="#"
              class="w-10 h-10 flex items-center justify-center rounded-full border border-gray-300 text-gray-600 hover:bg-gray-50"
            >
              <i class="ri-arrow-right-s-line"></i>
            </a>
          </nav>
        </div> -->
      </section>

      <!-- 추천 채용 정보 -->
      <!-- <section class="bg-white rounded-lg shadow-sm p-6 mb-10">
        <h2 class="text-xl font-bold text-gray-900 mb-6">맞춤 추천 채용정보</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          추천 채용 1
          <div
            class="flex border border-gray-200 rounded-lg p-4 hover:border-primary transition-colors"
          >
            <div
              class="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-md flex items-center justify-center mr-4"
            >
              <span class="text-primary font-bold">S</span>
            </div>
            <div class="flex-grow min-w-0">
              <h3 class="text-base font-medium text-gray-900 mb-1 truncate">
                시스템 엔지니어 (AWS/Azure)
              </h3>
              <p class="text-sm text-primary mb-1">SK텔레콤</p>
              <div class="flex items-center text-sm text-gray-500">
                <span class="truncate">서울 중구</span>
                <span class="mx-2">•</span>
                <span>경력 3년↑</span>
              </div>
            </div>
            <button
              class="flex-shrink-0 text-gray-400 hover:text-primary w-8 h-8 flex items-center justify-center rounded-full hover:bg-blue-50 transition-colors"
            >
              <i class="ri-bookmark-line"></i>
            </button>
          </div>

          추천 채용 2
          <div
            class="flex border border-gray-200 rounded-lg p-4 hover:border-primary transition-colors"
          >
            <div
              class="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-md flex items-center justify-center mr-4"
            >
              <span class="text-primary font-bold">L</span>
            </div>
            <div class="flex-grow min-w-0">
              <h3 class="text-base font-medium text-gray-900 mb-1 truncate">
                물류 운영 매니저
              </h3>
              <p class="text-sm text-primary mb-1">롯데그룹</p>
              <div class="flex items-center text-sm text-gray-500">
                <span class="truncate">경기 이천시</span>
                <span class="mx-2">•</span>
                <span>경력 5년↑</span>
              </div>
            </div>
            <button
              class="flex-shrink-0 text-gray-400 hover:text-primary w-8 h-8 flex items-center justify-center rounded-full hover:bg-blue-50 transition-colors"
            >
              <i class="ri-bookmark-line"></i>
            </button>
          </div>

          추천 채용 3
          <div
            class="flex border border-gray-200 rounded-lg p-4 hover:border-primary transition-colors"
          >
            <div
              class="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-md flex items-center justify-center mr-4"
            >
              <span class="text-primary font-bold">H</span>
            </div>
            <div class="flex-grow min-w-0">
              <h3 class="text-base font-medium text-gray-900 mb-1 truncate">
                게임 클라이언트 개발자 (Unity)
              </h3>
              <p class="text-sm text-primary mb-1">넥슨코리아</p>
              <div class="flex items-center text-sm text-gray-500">
                <span class="truncate">경기 성남시</span>
                <span class="mx-2">•</span>
                <span>경력 2년↑</span>
              </div>
            </div>
            <button
              class="flex-shrink-0 text-gray-400 hover:text-primary w-8 h-8 flex items-center justify-center rounded-full hover:bg-blue-50 transition-colors"
            >
              <i class="ri-bookmark-line"></i>
            </button>
          </div>

          추천 채용 4
          <div
            class="flex border border-gray-200 rounded-lg p-4 hover:border-primary transition-colors"
          >
            <div
              class="flex-shrink-0 w-12 h-12 bg-gray-100 rounded-md flex items-center justify-center mr-4"
            >
              <span class="text-primary font-bold">K</span>
            </div>
            <div class="flex-grow min-w-0">
              <h3 class="text-base font-medium text-gray-900 mb-1 truncate">
                영업 관리자
              </h3>
              <p class="text-sm text-primary mb-1">기아자동차</p>
              <div class="flex items-center text-sm text-gray-500">
                <span class="truncate">서울 서초구</span>
                <span class="mx-2">•</span>
                <span>신입/경력</span>
              </div>
            </div>
            <button
              class="flex-shrink-0 text-gray-400 hover:text-primary w-8 h-8 flex items-center justify-center rounded-full hover:bg-blue-50 transition-colors"
            >
              <i class="ri-bookmark-line"></i>
            </button>
          </div>
        </div>
      </section> -->

      <!-- 채용 트렌드 -->
      <!-- <section class="bg-white rounded-lg shadow-sm p-6 mb-10">
        <h2 class="text-xl font-bold text-gray-900 mb-6">국내 채용 트렌드</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          인기 직무
          <div>
            <h3 class="text-lg font-semibold text-gray-800 mb-4">
              인기 직무 TOP 5
            </h3>
            <ul class="space-y-3">
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-primary text-white rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >1</span
                  >
                  <span class="text-gray-700">프론트엔드 개발자</span>
                </div>
                <span class="text-sm text-primary">+24%</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >2</span
                  >
                  <span class="text-gray-700">데이터 분석가</span>
                </div>
                <span class="text-sm text-primary">+18%</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >3</span
                  >
                  <span class="text-gray-700">인공지능 엔지니어</span>
                </div>
                <span class="text-sm text-primary">+15%</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >4</span
                  >
                  <span class="text-gray-700">디지털 마케터</span>
                </div>
                <span class="text-sm text-primary">+12%</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >5</span
                  >
                  <span class="text-gray-700">UX/UI 디자이너</span>
                </div>
                <span class="text-sm text-primary">+10%</span>
              </li>
            </ul>
          </div>

          인기 지역
          <div>
            <h3 class="text-lg font-semibold text-gray-800 mb-4">
              인기 지역 TOP 5
            </h3>
            <ul class="space-y-3">
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-primary text-white rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >1</span
                  >
                  <span class="text-gray-700">서울 강남구</span>
                </div>
                <span class="text-sm text-gray-500">2,145개</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >2</span
                  >
                  <span class="text-gray-700">경기 성남시</span>
                </div>
                <span class="text-sm text-gray-500">1,432개</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >3</span
                  >
                  <span class="text-gray-700">서울 영등포구</span>
                </div>
                <span class="text-sm text-gray-500">987개</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >4</span
                  >
                  <span class="text-gray-700">서울 송파구</span>
                </div>
                <span class="text-sm text-gray-500">876개</span>
              </li>
              <li class="flex items-center justify-between">
                <div class="flex items-center">
                  <span
                    class="w-6 h-6 bg-blue-100 text-primary rounded-full flex items-center justify-center text-xs font-medium mr-3"
                    >5</span
                  >
                  <span class="text-gray-700">경기 판교</span>
                </div>
                <span class="text-sm text-gray-500">765개</span>
              </li>
            </ul>
          </div>

          평균 연봉
          <div>
            <h3 class="text-lg font-semibold text-gray-800 mb-4">
              직무별 평균 연봉
            </h3>
            <ul class="space-y-3">
              <li class="flex items-center justify-between">
                <span class="text-gray-700">개발자</span>
                <span class="text-sm font-medium text-gray-900">6,500만원</span>
              </li>
              <li class="flex items-center justify-between">
                <span class="text-gray-700">디자이너</span>
                <span class="text-sm font-medium text-gray-900">5,200만원</span>
              </li>
              <li class="flex items-center justify-between">
                <span class="text-gray-700">마케팅</span>
                <span class="text-sm font-medium text-gray-900">5,800만원</span>
              </li>
              <li class="flex items-center justify-between">
                <span class="text-gray-700">기획자</span>
                <span class="text-sm font-medium text-gray-900">6,200만원</span>
              </li>
              <li class="flex items-center justify-between">
                <span class="text-gray-700">영업</span>
                <span class="text-sm font-medium text-gray-900">5,500만원</span>
              </li>
            </ul>
          </div>
        </div>
      </section> -->
    </main>

   <%--  <!-- <!-- 푸터 -->
    <footer class="bg-gray-800 text-white pt-12 pb-6">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
          <div>
            <a href="#" class="font-['Pacifico'] text-2xl mb-4 inline-block">
              <span class="text-primary">Re</span
              ><span class="text-white">spot</span>
            </a>
            <p class="text-gray-300 text-sm mb-4">
              Respot은 전 세계 구직자들이 더 나은 커리어를 찾을 수 있도록 돕는
              글로벌 채용 플랫폼입니다.
            </p>
            <div class="flex space-x-4">
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-facebook-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-twitter-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-linkedin-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-instagram-fill"></i>
              </a>
            </div>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">서비스</h3>
            <ul class="space-y-2 text-gray-300 text-sm">
              <li><a href="#" class="hover:text-primary">채용공고</a></li>
              <li><a href="#" class="hover:text-primary">이력서 작성</a></li>
              <li><a href="#" class="hover:text-primary">이력서 템플릿</a></li>
              <li>
                <a href="#" class="hover:text-primary">합격 자기소개서</a>
              </li>
              <li><a href="#" class="hover:text-primary">면접 후기</a></li>
            </ul>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">회사 정보</h3>
            <ul class="space-y-2 text-gray-300 text-sm">
              <li><a href="#" class="hover:text-primary">회사 소개</a></li>
              <li><a href="#" class="hover:text-primary">이용약관</a></li>
              <li>
                <a href="#" class="hover:text-primary">개인정보처리방침</a>
              </li>
              <li><a href="#" class="hover:text-primary">채용 정보</a></li>
              <li><a href="#" class="hover:text-primary">제휴 문의</a></li>
            </ul>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">고객센터</h3>
            <p class="text-gray-300 text-sm mb-2">
              평일 09:00 - 18:00 (주말, 공휴일 휴무)
            </p>
            <p class="text-white font-medium mb-4">1588-1234</p>
            <a
              href="#"
              class="bg-primary text-white px-4 py-2 rounded-button text-sm font-medium hover:bg-blue-600 transition-colors inline-block whitespace-nowrap"
              >1:1 문의하기</a
            >
          </div>
        </div>
        <div
          class="border-t border-gray-700 pt-6 flex flex-col md:flex-row justify-between items-center"
        >
          <p class="text-gray-400 text-sm mb-4 md:mb-0">
            © 2025 Respot. All rights reserved.
          </p>
          <div class="flex items-center space-x-4">
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-visa-fill mr-1 text-lg"></i> Visa
            </span>
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-mastercard-fill mr-1 text-lg"></i> Mastercard
            </span>
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-paypal-fill mr-1 text-lg"></i> PayPal
            </span>
          </div>
        </div>
      </div>
    </footer> -->
  <jsp:include page="../common/footer.jsp" />
  
  
  
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // 연봉 슬라이더 기능
/*         const salarySlider = document.getElementById("salary-slider");
        const salaryValue = document.getElementById("salary-value");

        if (salarySlider && salaryValue) {
          salarySlider.addEventListener("input", function () {
            const value = parseInt(this.value);
            salaryValue.textContent = value.toLocaleString() + "만원 이상";
          });
        } */

        // 체크박스 기능
        const checkboxes = document.querySelectorAll(".custom-checkbox");
        checkboxes.forEach((checkbox) => {
          checkbox.addEventListener("click", function () {
            const isChecked = this.getAttribute("data-checked") === "true";
            this.setAttribute("data-checked", !isChecked);
            if (!isChecked) {
              this.classList.add("checked");
            } else {
              this.classList.remove("checked");
            }
          });
        });

        // 라디오 버튼 기능
        const radioButtons = document.querySelectorAll(".custom-radio");
        radioButtons.forEach((radio) => {
          radio.addEventListener("click", function () {
            // 같은 그룹의 모든 라디오 버튼 선택 해제
            const allRadios = document.querySelectorAll(".custom-radio");
            allRadios.forEach((r) => {
              r.setAttribute("data-checked", "false");
              r.classList.remove("checked");
            });

            // 현재 클릭한 라디오 버튼 선택
            this.setAttribute("data-checked", "true");
            this.classList.add("checked");
          });
        });

        // 북마크 기능
        const bookmarkButtons = document.querySelectorAll(
          "button i.ri-bookmark-line",
        );
        bookmarkButtons.forEach((button) => {
          button.parentElement.addEventListener("click", function () {
            if (button.classList.contains("ri-bookmark-line")) {
              button.classList.remove("ri-bookmark-line");
              button.classList.add("ri-bookmark-fill");
              button.parentElement.classList.add("text-primary");
            } else {
              button.classList.remove("ri-bookmark-fill");
              button.classList.add("ri-bookmark-line");
              button.parentElement.classList.remove("text-primary");
            }
          });
        });
      }); --%>
    </script>
    
<%@ include file="../common/footer.jsp" %>
  </body>
</html>