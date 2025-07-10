<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 공통 CSS 및 Head 영역 -->
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Readdy 관리자 대시보드</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
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
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
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
             class="sidebar-item active flex items-center px-4 py-3 text-sm font-medium rounded-md"
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
        <!-- 페이지 헤더 -->
<main class="flex-1 overflow-y-auto p-6 bg-gray-50">
<body class="bg-gray-100 min-h-screen flex flex-col">

<div class="bg-white shadow-lg rounded-xl max-w-5xl w-full p-12 mx-auto">
  <h2 class="text-3xl font-extrabold text-gray-900 mb-6 border-b pb-3">자유게시판 글 상세</h2>

  <div class="space-y-6">
    <div>
      <h3 class="text-lg font-semibold text-gray-700 mb-1">제목</h3>
      <p class="text-xl text-gray-900">${freeboard.fbtitle}</p>
    </div>

    <div class="flex gap-6 text-sm text-gray-500">
      <span>작성자: <strong class="text-gray-700">${freeboard.id}</strong></span>
      <span>작성일: <strong class="text-gray-700">${freeboard.fbdate}</strong></span>
    </div>

    <div>
      <h3 class="text-lg font-semibold text-gray-700 mb-2">내용</h3>
      <p class="text-gray-800 whitespace-pre-wrap">${freeboard.fbcontent}</p>
    </div>
    <div class="mt-6 text-right">
  <a href="javascript:history.back()" 
     class="inline-block px-5 py-2 bg-indigo-700 text-white text-sm rounded hover:bg-indigo-800 transition">
    ← 돌아가기
  </a>
  
</div>
  </div>
</div>

</body>
</html>