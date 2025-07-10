<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Readdy 관리자 대시보드</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB79rVj--SmRgODMNQA8mrkhVRlYDg2Pz0"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: { primary: "#4F46E5", secondary: "#A78BFA" },
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
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>
    <style>
      :where([class^="ri-"])::before { content: "\f3c2"; }
      body {
          font-family: 'Noto Sans KR', sans-serif;
          background-color: #f9fafb;
      }
      .sidebar-item.active {
          background-color: rgba(79, 70, 229, 0.1);
          color: #4F46E5;
          border-left: 3px solid #4F46E5;
      }
      .custom-switch {
          position: relative;
          display: inline-block;
          width: 36px;
          height: 20px;
      }
      .custom-switch input {
          opacity: 0;
          width: 0;
          height: 0;
      }
      .slider {
          position: absolute;
          cursor: pointer;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background-color: #ccc;
          transition: .4s;
          border-radius: 20px;
      }
      .slider:before {
          position: absolute;
          content: "";
          height: 16px;
          width: 16px;
          left: 2px;
          bottom: 2px;
          background-color: white;
          transition: .4s;
          border-radius: 50%;
      }
      input:checked + .slider {
          background-color: #4F46E5;
      }
      input:checked + .slider:before {
          transform: translateX(16px);
      }
      
          /* 지도 크기 지정 */
    #map {
      width: 100%;
      height: 200px;
    }
    </style>
  </head>
  <body>
    <div class="flex h-screen overflow-hidden">
      <!-- 사이드바 -->
      <div
        class="hidden md:flex flex-col w-64 bg-white border-r border-gray-200"
      >
        <div
          class="flex items-center justify-center h-16 border-b border-gray-200"
        >
          <h1 class="text-2xl font-['Pacifico'] text-primary">Respot</h1>
        </div>
        <div class="flex flex-col flex-grow overflow-y-auto">
          <nav class="flex-1 px-2 py-4 space-y-1">
            <a
              href="/middle/index"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-dashboard-line"></i>
              </div>
              대시보드
            </a>
            <a
              href="/middle/index1"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-user-line"></i>
              </div>
              회원 관리
            </a>
            <a
              href="/middle/recruit"
              class="sidebar-item active flex items-center px-4 py-3 text-sm font-medium rounded-md"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-briefcase-line"></i>
              </div>
              채용공고 관리
            </a>
            <a
              href="/middle/oneonone"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-file-list-line"></i>
              </div>
              1:1 문의 관리
            </a>
            <a
              href="/middle/BoardFree"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-message-2-line"></i>
              </div>
              게시판 관리
            </a>
            <a
              href="/middle/reportList"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-layout-2-line"></i>
              </div>
              신고 게시판 관리
            </a>

          </nav>
        </div>
        <div class="p-4 border-t border-gray-200">
          <div class="flex items-center">
            <img
              class="w-8 h-8 rounded-full"
              src="https://readdy.ai/api/search-image?query=professional%2520portrait%2520of%2520a%2520Korean%2520male%2520administrator%2C%2520business%2520attire%2C%2520neutral%2520background%2C%2520professional%2520headshot%2C%2520high%2520quality%2C%2520realistic&width=200&height=200&seq=admin1&orientation=squarish"
              alt="관리자 프로필"
            />
            <div class="ml-3">
              <p class="text-sm font-medium text-gray-700">김준호 관리자</p>
              <p class="text-xs text-gray-500">슈퍼 관리자</p>
            </div>
          </div>
   <a
  href="adminlogin"
  class="mt-4 w-full flex items-center justify-center px-4 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-button text-gray-700 bg-white hover:bg-gray-50 whitespace-nowrap"
>
  <div class="w-4 h-4 mr-2 flex items-center justify-center">
    <i class="ri-logout-box-line"></i>
  </div>
  로그아웃
</a>
        </div>
      </div>
  </aside>
  
        <!-- 메인 콘텐츠 -->
      <div class="flex flex-col flex-1 overflow-hidden">
        <!-- 상단 헤더 -->
        <header class="bg-white border-b border-gray-200">
          <div class="px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
              <div class="flex items-center md:hidden">
                <button
                  type="button"
                  class="p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none"
                >
                  <div class="w-6 h-6 flex items-center justify-center">
                    <i class="ri-menu-line"></i>
                  </div>
                </button>
                <h1 class="ml-2 text-xl font-['Pacifico'] text-primary">
                  logo
                </h1>
              </div>
              <div
                class="flex-1 flex justify-center px-2 lg:ml-6 lg:justify-end"
              >
                <div class="max-w-lg w-full lg:max-w-xs">
                  <label for="search" class="sr-only">검색</label>
                  <div class="relative">
                    <div
                      class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                    >
                      <div
                        class="w-5 h-5 text-gray-400 flex items-center justify-center"
                      >
                        <i class="ri-search-line"></i>
                      </div>
                    </div>
                    <input
                      id="search"
                      name="search"
                      class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-md leading-5 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 focus:ring-1 focus:ring-primary focus:border-primary sm:text-sm"
                      placeholder="회원, 공고, 게시글 검색"
                      type="search"
                    />
                  </div>
                </div>
              </div>
              <div class="flex items-center">
                <button
                  type="button"
                  class="p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none"
                >
                  <div class="w-6 h-6 flex items-center justify-center">
                    <i class="ri-notification-3-line"></i>
                  </div>
                </button>
                <div class="ml-3 relative">
                  <div>
                    <button
                      type="button"
                      class="flex items-center max-w-xs rounded-full focus:outline-none"
                    >
                      <img
                        class="h-8 w-8 rounded-full"
                        src="https://readdy.ai/api/search-image?query=professional%2520portrait%2520of%2520a%2520Korean%2520male%2520administrator%2C%2520business%2520attire%2C%2520neutral%2520background%2C%2520professional%2520headshot%2C%2520high%2520quality%2C%2520realistic&width=200&height=200&seq=admin1&orientation=squarish"
                        alt="관리자 프로필"
                      />
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>
 <!-- 메인 콘텐츠 -->
<main class="flex-1 p-6 overflow-x-auto">
  <div class="min-w-full max-w-screen-2xl mx-auto flex flex-col lg:flex-row gap-10">

    <!-- 채용 정보 (왼쪽) -->
    <section class="bg-white rounded-lg shadow-md p-8 flex-1">
      <h2 class="text-3xl font-extrabold text-gray-900 mb-2">${kRecru.rctitle}</h2>
      <p class="text-gray-600 text-sm mb-6">
        ${kRecru.username} · ${kRecru.rcwtype} · 마감일: <c:out value="${fn:substringBefore(kRecru.rcdeadline, ' ')}" />
      </p>

      <!-- 정보 그리드 -->
      <dl class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4 mb-8 text-gray-700 text-sm">
        <div>
          <dt class="font-semibold">경력</dt>
          <dd>${kRecru.rchist}</dd>
        </div>
        <div>
          <dt class="font-semibold">학력</dt>
          <dd>${kRecru.rcedu}</dd>
        </div>
        <div>
          <dt class="font-semibold">근무형태</dt>
          <dd>${kRecru.rcwtype}</dd>
        </div>
        <div>
          <dt class="font-semibold">급여</dt>
          <dd>${kRecru.rcsal}</dd>
        </div>
        <div>
          <dt class="font-semibold">우대사항</dt>
          <dd>${kRecru.rcpreffer}</dd>
        </div>
        <div>
          <dt class="font-semibold">직급/직책</dt>
          <dd>${kRecru.rcrank}</dd>
        </div>
        <div>
          <dt class="font-semibold">근무지역</dt>
          <dd>${kRecru.rregion}</dd>
        </div>
      </dl>

      <!-- 채용 상세 내용 -->
      <article class="prose max-w-none text-gray-800">
        <h3 class="text-xl font-semibold mb-4 border-b border-indigo-300 pb-2">채용 상세 내용</h3>
        <p>${kRecru.rccontent}</p>
      </article>
      <!-- 뒤로가기 버튼 (오른쪽 하단) -->
      
<div class="mt-6 text-right">
  <a href="javascript:history.back()" 
     class="inline-block px-5 py-2 bg-indigo-700 text-white text-sm rounded hover:bg-indigo-800 transition">
    ← 돌아가기
  </a>
  

  
  
</div>

    </section>




    <!-- 기업 정보 (오른쪽) -->
    <aside class="w-full lg:w-1/3 bg-white rounded-lg shadow-md p-6 space-y-6">
      <div class="flex items-center space-x-4">
        <!-- 기업 로고 -->
        <!-- <img src="..." alt="기업 로고" class="w-16 h-16 rounded-full object-cover" /> -->
        <div>
          <h4 class="text-2xl font-bold text-gray-800">${kRecru.username}</h4>
          <!-- <p class="text-gray-500 text-sm">콜센터 · 아웃소싱 · 기타</p> -->
        </div>
      </div>

      <ul class="text-gray-700 text-sm space-y-3">
        <li><strong>사원수:</strong> ${kRecru.rccount}</li>
        <li><strong>설립일:</strong> <c:out value="${fn:substringBefore(kRecru.rccestab, ' ')}" /></li>
        <li><strong>기업형태:</strong> ${kRecru.rccform}</li>
        <li><strong>홈페이지:</strong>
          <a href="${kRecru.rccweb}" class="text-indigo-600 hover:text-indigo-800 underline" target="_blank" rel="noopener noreferrer">${kRecru.rccweb}</a>
        </li>
      </ul>

  <div id="map"></div>

  <script>
    // 서버에서 받은 위도, 경도 값을 숫자로 받음 (null 체크 포함)
    const myLat = ${kRecru.latitude != null ? kRecru.latitude : 37.5665};
    const myLng = ${kRecru.longitude != null ? kRecru.longitude : 126.9780};

    function initMap() {
      // 지도 생성
      const map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: myLat, lng: myLng },
        zoom: 16
      });

      // 마커 생성
      new google.maps.Marker({
        position: { lat: myLat, lng: myLng },
        map: map,
        title: "위치"
      });
    }

    window.onload = initMap;
  </script>


    </aside>
  </div>
</main>

</body>


</html>