<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="common/header.jsp" %>



<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Respot - 채용 및 커리어 플랫폼</title>
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
      .hero-section {
      background-image: url('https://readdy.ai/api/search-image?query=professional%20modern%20office%20environment%20with%20diverse%20people%20working%20on%20computers%2C%20bright%20and%20airy%20workspace%20with%20large%20windows%2C%20natural%20light%2C%20minimal%20design%2C%20soft%20colors%2C%20career%20and%20job%20search%20concept%2C%20high-quality%20professional%20photography&width=1920&height=600&seq=1&orientation=landscape');
      background-size: cover;
      background-position: center;
      }
      .hero-overlay {
      background: linear-gradient(90deg, rgba(255,255,255,0.95) 0%, rgba(255,255,255,0.9) 50%, rgba(255,255,255,0.5) 100%);
      }
      .continent-tab.active {
      color: #3b82f6;
      border-bottom: 2px solid #3b82f6;
      }
      .continent-content {
      display: none;
      }
      .continent-content.active {
      display: grid;
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
  
    
    

        </div>
      </div>
    </header>
    
    <!-- 히어로 섹션 -->
    <section class="hero-section relative">
      <div class="hero-overlay w-full h-full absolute inset-0"></div>
      <div class="container mx-auto px-4 py-16 relative z-10">
        <div class="max-w-2xl">
          <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
            당신의 꿈을 향한 <br />첫걸음을 함께합니다
          </h1>
          <p class="text-lg text-gray-700 mb-8">
            Respot에서 국내외 다양한 채용 정보와 커리어 성장을 위한 모든 것을
            찾아보세요.
          </p>
          <div class="flex flex-col sm:flex-row gap-4">
            <a
              href="koreaRecruit/koreaRecruit_List"
              class="bg-primary text-white px-6 py-3 rounded-button font-medium hover:bg-blue-600 transition-colors text-center whitespace-nowrap"
              >채용공고 둘러보기</a
            >
            <a
              href="resume/resume_Write"
              class="bg-white text-primary border border-primary px-6 py-3 rounded-button font-medium hover:bg-gray-50 transition-colors text-center whitespace-nowrap"
              >이력서 작성하기</a
            >
          </div>
        </div>
      </div>
    </section>
    <!-- 메인 콘텐츠 -->
    <main class="container mx-auto px-4 py-12">
      <!-- 최신 국내 채용 공고 -->
      <section class="mb-16">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold text-gray-900">최신 국내 채용 공고</h2>
          <a
            href="koreaRecruit/koreaRecruit_List"
            class="text-primary hover:text-blue-700 font-medium flex items-center"
          >
            더보기 <i class="ri-arrow-right-line ml-1"></i>
          </a>
        </div>
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
                  <a href="koreaRecruit_View?rckey=${recruitment.rckey }">
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
              <span class="text-gray-500 text-sm">연봉: ${recruitment.rcsal}만 원(&#8361;) 이상</span>
              <button
                class="text-gray-400 hover:text-primary w-8 h-8 flex items-center justify-center rounded-full hover:bg-blue-50 transition-colors"
              >
                <!-- <i class="ri-bookmark-line"></i> -->
              </button>
            </div>
          </div>
          
          </c:forEach>
         </div>
      </section>
      
      <!-- 최신 해외 채용 공고 -->
      <section class="mb-16">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold text-gray-900">최신 해외 채용 공고</h2>
          <a
            href="overseaRecruit/overseaRecruit_List"
            class="text-primary hover:text-blue-700 font-medium flex items-center"
          >
            더보기 <i class="ri-arrow-right-line ml-1"></i>
          </a>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <c:forEach items="${recruitList2}" var="recruitment2" begin="0" end="5">
        
          <!-- 채용 공고 카드 1 -->
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="p-6">
              <div class="flex justify-between items-start mb-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-1">
                  <a href="koreaRecruit_View?rckey=${recruitment2.rckey }">
                    ${recruitment2.rctitle}
                    </a>
                  </h3>
                  <p class="text-primary font-medium">${recruitment2.username}</p>
                </div>
                <span
                  class="bg-blue-100 text-primary text-xs px-2 py-1 rounded-full"
                  >${recruitment2.rcwtype}</span>
              </div>
              <div class="space-y-2 mb-4">
                <p class="text-gray-600 text-sm flex items-center">
                  <i
                    class="ri-user-line mr-2 w-4 h-4 flex items-center justify-center"
                  ></i>
                  ${recruitment2.rcrank}
                  </p>
                  <p class="text-gray-600 text-sm flex items-center">
                   <i
                    class="ri-map-pin-line mr-2 w-4 h-4 flex items-center justify-center"
                  ></i>
                  ${recruitment2.rregion}
                </p>
                <p class="text-gray-600 text-sm flex items-center">
                  <i
                    class="ri-time-line mr-2 w-4 h-4 flex items-center justify-center"
                  ></i>
 					<c:out value="${fn:substringBefore(recruitment2.rcdeadline, ' ')}" />
                </p>
              </div>
              <div class="flex flex-wrap gap-2">
                <span
                  class="bg-gray-100 text-gray-600 text-xs px-2 py-1 rounded-full"
                  >${recruitment2.rcpreffer}</span>
              </div>
            </div>
            <div
              class="border-t border-gray-100 px-6 py-3 flex justify-between items-center"
            >
              <span class="text-gray-500 text-sm">연봉:${recruitment2.rcsal}만 달러(&dollar;) 이상</span>
              <button
                class="text-gray-400 hover:text-primary w-8 h-8 flex items-center justify-center rounded-full hover:bg-blue-50 transition-colors"
              >
                <!-- <i class="ri-bookmark-line"></i> -->
              </button>
            </div>
          </div>
          
          </c:forEach>
         </div>
      </section>
      
      <!-- 인기 합격 이력서 -->
      <!-- <section class="mb-16">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold text-gray-900">인기 합격 이력서</h2>
          <a
            href="#"
            class="text-primary hover:text-blue-700 font-medium flex items-center"
          >
            더보기 <i class="ri-arrow-right-line ml-1"></i>
          </a>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          이력서 카드 1
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="h-40 bg-gray-100 relative">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20resume%20template%20with%20clean%20layout%2C%20minimalist%20design%2C%20organized%20sections%2C%20modern%20typography%2C%20subtle%20color%20accents%2C%20high-quality%20professional%20document&width=400&height=160&seq=1&orientation=landscape"
                alt="이력서 미리보기"
                class="w-full h-full object-cover object-top"
              />
              <div
                class="absolute top-3 right-3 bg-primary text-white text-xs px-2 py-1 rounded-full"
              >
                IT/개발
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-lg font-semibold text-gray-900 mb-2">
                네이버 프론트엔드 개발자 합격 이력서
              </h3>
              <p class="text-gray-600 text-sm mb-4">
                경력 3년 | 서울대학교 컴퓨터공학과
              </p>
              <div class="flex items-center justify-between">
                <div class="flex items-center">
                  <div
                    class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center mr-2"
                  >
                    <i class="ri-user-line text-gray-500"></i>
                  </div>
                  <span class="text-gray-700 text-sm">김민준</span>
                </div>
                <div class="flex items-center text-gray-500 text-sm">
                  <i
                    class="ri-eye-line mr-1 w-4 h-4 flex items-center justify-center"
                  ></i>
                  <span>2,345</span>
                </div>
              </div>
            </div>
          </div>
          이력서 카드 2
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="h-40 bg-gray-100 relative">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20resume%20template%20with%20clean%20layout%2C%20minimalist%20design%2C%20organized%20sections%2C%20modern%20typography%2C%20subtle%20blue%20color%20accents%2C%20high-quality%20professional%20document&width=400&height=160&seq=2&orientation=landscape"
                alt="이력서 미리보기"
                class="w-full h-full object-cover object-top"
              />
              <div
                class="absolute top-3 right-3 bg-primary text-white text-xs px-2 py-1 rounded-full"
              >
                디자인
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-lg font-semibold text-gray-900 mb-2">
                삼성전자 UX 디자이너 합격 이력서
              </h3>
              <p class="text-gray-600 text-sm mb-4">
                경력 5년 | 홍익대학교 디자인학과
              </p>
              <div class="flex items-center justify-between">
                <div class="flex items-center">
                  <div
                    class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center mr-2"
                  >
                    <i class="ri-user-line text-gray-500"></i>
                  </div>
                  <span class="text-gray-700 text-sm">이서연</span>
                </div>
                <div class="flex items-center text-gray-500 text-sm">
                  <i
                    class="ri-eye-line mr-1 w-4 h-4 flex items-center justify-center"
                  ></i>
                  <span>1,987</span>
                </div>
              </div>
            </div>
          </div>
          이력서 카드 3
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="h-40 bg-gray-100 relative">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20resume%20template%20with%20clean%20layout%2C%20minimalist%20design%2C%20organized%20sections%2C%20modern%20typography%2C%20subtle%20green%20color%20accents%2C%20high-quality%20professional%20document&width=400&height=160&seq=3&orientation=landscape"
                alt="이력서 미리보기"
                class="w-full h-full object-cover object-top"
              />
              <div
                class="absolute top-3 right-3 bg-primary text-white text-xs px-2 py-1 rounded-full"
              >
                마케팅
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-lg font-semibold text-gray-900 mb-2">
                현대자동차 마케팅 매니저 합격 이력서
              </h3>
              <p class="text-gray-600 text-sm mb-4">
                경력 7년 | 고려대학교 경영학과
              </p>
              <div class="flex items-center justify-between">
                <div class="flex items-center">
                  <div
                    class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center mr-2"
                  >
                    <i class="ri-user-line text-gray-500"></i>
                  </div>
                  <span class="text-gray-700 text-sm">박지훈</span>
                </div>
                <div class="flex items-center text-gray-500 text-sm">
                  <i
                    class="ri-eye-line mr-1 w-4 h-4 flex items-center justify-center"
                  ></i>
                  <span>1,756</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section> -->
      
      
      <!-- 이력서 템플릿 -->
      <section class="mb-16">
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold text-gray-900">인기 이력서 템플릿</h2>
          <a
            href="${pageContext.request.contextPath}/template/list"
            class="text-primary hover:text-blue-700 font-medium flex items-center"
          >
            더보기 <i class="ri-arrow-right-line ml-1"></i>
          </a>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          <!-- 템플릿 1 -->
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="h-48 bg-gray-100">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20resume%20template%20with%20clean%20layout%2C%20minimalist%20design%2C%20organized%20sections%2C%20modern%20typography%2C%20subtle%20color%20accents%2C%20high-quality%20professional%20document&width=300&height=192&seq=4&orientation=portrait"
                alt="템플릿 미리보기"
                class="w-full h-full object-cover object-top"
              />
            </div>
            <div class="p-4">
              <h3 class="text-base font-semibold text-gray-900 mb-1">
                미니멀 프로
              </h3>
              <p class="text-gray-600 text-sm mb-3">
                깔끔한 디자인의 전문가용 템플릿
              </p>
              <div class="flex justify-between items-center">
                <!-- <span class="text-primary font-medium">무료</span> -->
                <button
                  class="bg-primary text-white px-3 py-1.5 rounded-button text-sm hover:bg-blue-600 transition-colors whitespace-nowrap"
                  onclick = "location.href = '${pageContext.request.contextPath}/template/templatelist'"
                >
                  사용하기
                </button>
              </div>
            </div>
          </div>
          <!-- 템플릿 2 -->
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="h-48 bg-gray-100">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20resume%20template%20with%20modern%20layout%2C%20clean%20design%2C%20organized%20sections%2C%20contemporary%20typography%2C%20blue%20color%20accents%2C%20high-quality%20professional%20document&width=300&height=192&seq=5&orientation=portrait"
                alt="템플릿 미리보기"
                class="w-full h-full object-cover object-top"
              />
            </div>
            <div class="p-4">
              <h3 class="text-base font-semibold text-gray-900 mb-1">
                모던 블루
              </h3>
              <p class="text-gray-600 text-sm mb-3">
                현대적인 디자인의 비즈니스 템플릿
              </p>
              <div class="flex justify-between items-center">
                <!-- <span class="text-primary font-medium">무료</span> -->
                <button
                  class="bg-primary text-white px-3 py-1.5 rounded-button text-sm hover:bg-blue-600 transition-colors whitespace-nowrap"
                  onclick = "location.href = '${pageContext.request.contextPath}/template/templatelist'"
                >
                  사용하기
                </button>
              </div>
            </div>
          </div>
          <!-- 템플릿 3 -->
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="h-48 bg-gray-100">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20resume%20template%20with%20creative%20layout%2C%20modern%20design%2C%20organized%20sections%2C%20stylish%20typography%2C%20green%20color%20accents%2C%20high-quality%20professional%20document&width=300&height=192&seq=6&orientation=portrait"
                alt="템플릿 미리보기"
                class="w-full h-full object-cover object-top"
              />
            </div>
            <div class="p-4">
              <h3 class="text-base font-semibold text-gray-900 mb-1">
                크리에이티브
              </h3>
              <p class="text-gray-600 text-sm mb-3">
                창의적인 직무를 위한 특별한 템플릿
              </p>
              <div class="flex justify-between items-center">
                <!-- <span class="text-gray-600 font-medium">프리미엄</span> -->
                <button
                  class="bg-primary text-white px-3 py-1.5 rounded-button text-sm hover:bg-blue-600 transition-colors whitespace-nowrap"
                  onclick = "location.href = '${pageContext.request.contextPath}/template/templatelist'"
                >
                  사용하기
                </button>
              </div>
            </div>
          </div>
          <!-- 템플릿 4 -->
          <div
            class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow overflow-hidden"
          >
            <div class="h-48 bg-gray-100">
              <img
                src="https://readdy.ai/api/search-image?query=professional%20resume%20template%20with%20executive%20layout%2C%20elegant%20design%2C%20organized%20sections%2C%20sophisticated%20typography%2C%20dark%20color%20accents%2C%20high-quality%20professional%20document&width=300&height=192&seq=7&orientation=portrait"
                alt="템플릿 미리보기"
                class="w-full h-full object-cover object-top"
              />
            </div>
            <div class="p-4">
              <h3 class="text-base font-semibold text-gray-900 mb-1">
                엘리트 프로
              </h3>
              <p class="text-gray-600 text-sm mb-3">
                고위직 지원자를 위한 고급 템플릿
              </p>
              <div class="flex justify-between items-center">
                <!-- <span class="text-gray-600 font-medium">프리미엄</span> -->
                <button
                  class="bg-primary text-white px-3 py-1.5 rounded-button text-sm hover:bg-blue-600 transition-colors whitespace-nowrap"
                  onclick = "location.href = '${pageContext.request.contextPath}/template/templatelist'"
                >
                  사용하기
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- 글로벌 채용정보 섹션 -->
      <!-- <section>
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-2xl font-bold text-gray-900">글로벌 채용정보</h2>
          <a
            href="#"
            class="text-primary hover:text-blue-700 font-medium flex items-center"
          >
            전체보기 <i class="ri-arrow-right-line ml-1"></i>
          </a>
        </div>
        대륙별 탭
        <div class="flex overflow-x-auto mb-6 pb-2 -mx-1">
          <button
            class="continent-tab active whitespace-nowrap px-4 py-2 mx-1 text-gray-700 font-medium hover:text-primary transition-colors"
            data-continent="asia"
          >
            아시아
          </button>
          <button
            class="continent-tab whitespace-nowrap px-4 py-2 mx-1 text-gray-700 font-medium hover:text-primary transition-colors"
            data-continent="europe"
          >
            유럽
          </button>
          <button
            class="continent-tab whitespace-nowrap px-4 py-2 mx-1 text-gray-700 font-medium hover:text-primary transition-colors"
            data-continent="north-america"
          >
            북아메리카
          </button>
          <button
            class="continent-tab whitespace-nowrap px-4 py-2 mx-1 text-gray-700 font-medium hover:text-primary transition-colors"
            data-continent="south-america"
          >
            남아메리카
          </button>
          <button
            class="continent-tab whitespace-nowrap px-4 py-2 mx-1 text-gray-700 font-medium hover:text-primary transition-colors"
            data-continent="oceania"
          >
            오세아니아
          </button>
          <button
            class="continent-tab whitespace-nowrap px-4 py-2 mx-1 text-gray-700 font-medium hover:text-primary transition-colors"
            data-continent="africa"
          >
            아프리카
          </button>
          <button
            class="continent-tab whitespace-nowrap px-4 py-2 mx-1 text-gray-700 font-medium hover:text-primary transition-colors"
            data-continent="middle-east"
          >
            중동
          </button>
        </div>
        아시아 국가
        <div
          id="asia"
          class="continent-content active grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4"
        >
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/kr.svg"
                alt="대한민국"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">대한민국</span>
            <span class="text-gray-500 text-xs mt-1">1,245개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/jp.svg"
                alt="일본"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">일본</span>
            <span class="text-gray-500 text-xs mt-1">987개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/sg.svg"
                alt="싱가포르"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">싱가포르</span>
            <span class="text-gray-500 text-xs mt-1">756개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/vn.svg"
                alt="베트남"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">베트남</span>
            <span class="text-gray-500 text-xs mt-1">543개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/cn.svg"
                alt="중국"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">중국</span>
            <span class="text-gray-500 text-xs mt-1">678개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/hk.svg"
                alt="홍콩"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">홍콩</span>
            <span class="text-gray-500 text-xs mt-1">432개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/tw.svg"
                alt="대만"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">대만</span>
            <span class="text-gray-500 text-xs mt-1">321개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/th.svg"
                alt="태국"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">태국</span>
            <span class="text-gray-500 text-xs mt-1">289개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/my.svg"
                alt="말레이시아"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">말레이시아</span>
            <span class="text-gray-500 text-xs mt-1">245개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/id.svg"
                alt="인도네시아"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">인도네시아</span>
            <span class="text-gray-500 text-xs mt-1">198개 공고</span>
          </a>
        </div>
        유럽 국가
        <div
          id="europe"
          class="continent-content grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4"
        >
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/gb.svg"
                alt="영국"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">영국</span>
            <span class="text-gray-500 text-xs mt-1">876개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/de.svg"
                alt="독일"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">독일</span>
            <span class="text-gray-500 text-xs mt-1">765개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/fr.svg"
                alt="프랑스"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">프랑스</span>
            <span class="text-gray-500 text-xs mt-1">654개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/nl.svg"
                alt="네덜란드"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">네덜란드</span>
            <span class="text-gray-500 text-xs mt-1">543개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/es.svg"
                alt="스페인"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">스페인</span>
            <span class="text-gray-500 text-xs mt-1">432개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/it.svg"
                alt="이탈리아"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">이탈리아</span>
            <span class="text-gray-500 text-xs mt-1">387개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/se.svg"
                alt="스웨덴"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">스웨덴</span>
            <span class="text-gray-500 text-xs mt-1">321개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/ch.svg"
                alt="스위스"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">스위스</span>
            <span class="text-gray-500 text-xs mt-1">276개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/pl.svg"
                alt="폴란드"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">폴란드</span>
            <span class="text-gray-500 text-xs mt-1">198개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/pt.svg"
                alt="포르투갈"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">포르투갈</span>
            <span class="text-gray-500 text-xs mt-1">176개 공고</span>
          </a>
        </div>
        북아메리카 국가
        <div
          id="north-america"
          class="continent-content grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4"
        >
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/us.svg"
                alt="미국"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">미국</span>
            <span class="text-gray-500 text-xs mt-1">1,432개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/ca.svg"
                alt="캐나다"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">캐나다</span>
            <span class="text-gray-500 text-xs mt-1">876개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/mx.svg"
                alt="멕시코"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">멕시코</span>
            <span class="text-gray-500 text-xs mt-1">432개 공고</span>
          </a>
        </div>
        남아메리카 국가
        <div
          id="south-america"
          class="continent-content grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4"
        >
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/br.svg"
                alt="브라질"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">브라질</span>
            <span class="text-gray-500 text-xs mt-1">543개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/ar.svg"
                alt="아르헨티나"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">아르헨티나</span>
            <span class="text-gray-500 text-xs mt-1">321개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/cl.svg"
                alt="칠레"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">칠레</span>
            <span class="text-gray-500 text-xs mt-1">198개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/co.svg"
                alt="콜롬비아"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">콜롬비아</span>
            <span class="text-gray-500 text-xs mt-1">176개 공고</span>
          </a>
        </div>
        오세아니아 국가
        <div
          id="oceania"
          class="continent-content grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4"
        >
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/au.svg"
                alt="호주"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">호주</span>
            <span class="text-gray-500 text-xs mt-1">654개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/nz.svg"
                alt="뉴질랜드"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">뉴질랜드</span>
            <span class="text-gray-500 text-xs mt-1">321개 공고</span>
          </a>
        </div>
        아프리카 국가
        <div
          id="africa"
          class="continent-content grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4"
        >
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/za.svg"
                alt="남아프리카공화국"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">남아공</span>
            <span class="text-gray-500 text-xs mt-1">243개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/eg.svg"
                alt="이집트"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">이집트</span>
            <span class="text-gray-500 text-xs mt-1">176개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/ng.svg"
                alt="나이지리아"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">나이지리아</span>
            <span class="text-gray-500 text-xs mt-1">132개 공고</span>
          </a>
        </div>
        중동 국가
        <div
          id="middle-east"
          class="continent-content grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4"
        >
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/ae.svg"
                alt="아랍에미리트"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">UAE</span>
            <span class="text-gray-500 text-xs mt-1">432개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/sa.svg"
                alt="사우디아라비아"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">사우디</span>
            <span class="text-gray-500 text-xs mt-1">321개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/qa.svg"
                alt="카타르"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">카타르</span>
            <span class="text-gray-500 text-xs mt-1">198개 공고</span>
          </a>
          <a
            href="#"
            class="bg-white rounded-lg p-4 shadow-sm hover:shadow-md transition-shadow flex flex-col items-center"
          >
            <div class="w-12 h-12 mb-3 flex items-center justify-center">
              <img
                src="https://flagcdn.com/il.svg"
                alt="이스라엘"
                class="w-10 h-10 object-cover rounded-full border border-gray-100"
              />
            </div>
            <span class="text-gray-800 font-medium text-sm">이스라엘</span>
            <span class="text-gray-500 text-xs mt-1">176개 공고</span>
          </a>
        </div>
      </section> -->
    </main>
 <!-- 푸터 -->
    <!-- <footer class="bg-gray-800 text-white pt-12 pb-6">
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
              <li><a href="koreaRecruit/koreaRecruit_List" class="hover:text-primary">국내채용공고</a></li>
              <li><a href="overseaRecruit/overseaRecruit_List" class="hover:text-primary">해외채용공고</a></li>
              <li><a href="resume/resume_Write" class="hover:text-primary">이력서 작성</a></li>
              <li><a href="#" class="hover:text-primary">이력서 템플릿</a></li>
              <li>
                <a href="#" class="hover:text-primary">합격 자기소개서</a>
              </li>
              <li><a href="#" class="hover:text-primary">면접 후기</a></li>
              <li><a href="#" class="hover:text-primary">자주 묻는 질문(FAQ)</a></li>

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
    </footer>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // 대륙 탭 전환 기능
        const continentTabs = document.querySelectorAll(".continent-tab");
        const continentContents = document.querySelectorAll(".continent-content");
        continentTabs.forEach((tab) => {
          tab.addEventListener("click", () => {
            // 활성 탭 스타일 변경
            continentTabs.forEach((t) => t.classList.remove("active"));
            tab.classList.add("active");
            // 해당 콘텐츠 표시
            const targetContinent = tab.getAttribute("data-continent");
            continentContents.forEach((content) => {
              content.classList.remove("active");
              if (content.id === targetContinent) {
                content.classList.add("active");
              }
            });
          });
        });
      });
    </script> -->
<jsp:include page="common/footer.jsp" />
  </body>
</html>