<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
 <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"></td>
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
              href="index"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-dashboard-line"></i>
              </div>
              대시보드
            </a>
            <a
              href="index1"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-user-line"></i>
              </div>
              회원 관리
            </a>
            <a
              href="recruit"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-briefcase-line"></i>
              </div>
              채용공고 관리
            </a>
            <a
              href="oneonone"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-file-list-line"></i>
              </div>
              1:1 문의 관리
            </a>
            <a
              href="#"
              class="sidebar-item active flex items-center px-4 py-3 text-sm font-medium rounded-md"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-message-2-line"></i>
              </div>
              게시판 관리
            </a>
            <a
              href="reportList"
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

<!-- 페이지 헤더 -->
 <main class="flex-1 overflow-y-auto p-6 bg-gray-50">


<!-- 공지사항 및 인기 게시글 섹션 -->
<section class="py-6 bg-white border-b">
  <div class="container mx-auto px-4">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <!-- 공지사항 -->
      <div>
        <div class="flex items-center mb-3">
          <div class="w-6 h-6 flex items-center justify-center text-primary">
            <i class="ri-megaphone-line"></i>
          </div>
          <h2 class="text-lg font-bold text-gray-900 ml-2">공지사항</h2>
        </div>
<ul class="space-y-2">
  <c:forEach var="n" items="${notices}">
    <li class="flex items-start">
      <span class="flex-shrink-0 px-2 py-1 bg-red-100 text-red-600 text-xs font-medium rounded mr-2 mt-0.5">공지</span>
      <a href="/freeboard/detail?fbkey=${n.fbkey}" 
         class="text-gray-800 hover:text-primary hover:underline flex-grow truncate">${n.fbtitle}</a>
      <span class="text-gray-500 text-sm ml-2 flex-shrink-0">
        ${fn:substring(n.fbdate, 5, 10)}
      </span>
    </li>
  </c:forEach>
</ul>
      </div>
      
      <!-- 인기 게시글 -->
      <div>
        <div class="flex items-center mb-3">
          <div class="w-6 h-6 flex items-center justify-center text-primary">
            <i class="ri-fire-line"></i>
          </div>
          <h2 class="text-lg font-bold text-gray-900 ml-2">인기 게시글</h2>
        </div>
<ul class="space-y-2">
  <c:forEach var="p" items="${populars}">
    <li class="flex items-start">
      <span class="flex-shrink-0 px-2 py-1 bg-amber-100 text-amber-600 text-xs font-medium rounded mr-2 mt-0.5">인기</span>
      <a href="/freeboard/detail?fbkey=${p.fbkey}" 
         class="text-gray-800 hover:text-primary hover:underline flex-grow truncate">${p.fbtitle}</a>
      <span class="text-gray-500 text-sm ml-2 flex-shrink-0">
        ${fn:substring(p.fbdate, 5, 10)}
      </span>
    </li>
  </c:forEach>
</ul>
      </div>
    </div>
  </div>
</section>

<!-- 검색 및 필터 섹션 -->
<section class="py-6 bg-white border-b">
  <div class="container mx-auto px-4">
    <div class="flex flex-col md:flex-row gap-4 items-start md:items-center justify-between">
      <!-- 카테고리 탭 -->
<div class="category-tabs flex overflow-x-auto pb-2 space-x-2 w-full md:w-auto">
  <button class="category-tab bg-primary text-white px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="전체">전체</button>
  <button class="category-tab bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="공지">공지</button>
  <button class="category-tab bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="취업/이직">취업/이직</button>
  <button class="category-tab bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="커리어">커리어</button>
  <button class="category-tab bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="회사생활">회사생활</button>
  <button class="category-tab bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="면접">면접</button>
  <button class="category-tab bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="자기개발">자기개발</button>
  <button class="category-tab bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full whitespace-nowrap text-sm font-medium" data-category="일상">일상</button>
</div>
      
    </div>
    
    <div class="flex flex-col md:flex-row gap-4 mt-4">
      <!-- 검색바 -->
<form action="/BoardFree" method="get" class="flex-1">
  <div class="relative">
    <input
      type="text"
      name="keyword"
      value="${keyword != null ? keyword : ''}"
      placeholder=""
      class="w-full pl-10 pr-4 py-2.5 rounded border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary focus:ring-opacity-50 text-sm"
     readonly />
    <div class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5 flex items-center justify-center">
    </div>
  </div>
</form>

      <div class="flex flex-wrap gap-3">
        
        <!-- 글쓰기 버튼 (데스크톱) -->
        <div class="hidden md:block">
          <a href="writeadmin" class="bg-primary text-white px-4 py-2.5 !rounded-button whitespace-nowrap font-medium hover:bg-opacity-90 transition-colors inline-flex items-center">
            <i class="ri-pencil-line mr-1"></i> 글쓰기
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 게시글 목록 섹션 -->
<section class="py-8 bg-gray-50">
  <div class="container mx-auto px-4">
    <!-- 게시글 테이블 (데스크톱) -->
    <div class="hidden md:block overflow-hidden bg-white rounded-lg shadow-sm mb-6">
      <table class="w-full">
        <thead>
          <tr class="bg-gray-50 border-b">
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-16">번호</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">제목</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-32">작성자</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-28">작성일</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-20">조회</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-20">추천</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider w-20">삭제</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
          <!-- 공지사항 -->
<c:forEach var="post" items="${freeboardList}">
  <c:if test="${post.fbcategory eq '공지'}">
    <tr class="bg-red-50" data-category="공지">
       <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-red-600">공지</td>
      <td class="px-6 py-4">
        <div class="flex items-center">
<a href="#" class="text-gray-900 hover:text-primary hover:underline font-medium modal-open"
   data-title="${post.fbtitle}"
   data-content="${post.fbcontent}"
   data-author="${post.username}"
   data-date="${fn:substring(post.fbdate, 0, 10)}"
   data-views="${post.fbview}"
   data-like="${post.fblike}" 
   data-fbkey="${post.fbkey}">
  ${post.fbtitle}
</a>
        </div>
      </td>
      <td class="px-6 py-4 text-sm text-gray-700">${post.username}</td>
      <td class="px-6 py-4 text-sm text-gray-500">${fn:substring(post.fbdate, 0, 10)}</td>
      <td class="px-6 py-4 text-sm text-gray-500">${post.fbview}</td>
      <td class="px-6 py-4 text-sm text-gray-500">${post.fblike}</td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 flex items-center gap-2">
<a href="${pageContext.request.contextPath}/BoardFree/delete?fbkey=${post.fbkey}"
   onclick="return confirm('정말 삭제하시겠습니까?');"
   title="삭제">
   <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-600 cursor-pointer hover:text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
     <path stroke-linecap="round" stroke-linejoin="round" d="M19 7L5 7M10 11v6M14 11v6M5 7l1-3h12l1 3M9 7V5a1 1 0 011-1h4a1 1 0 011 1v2" />
   </svg>
</a>
</td>
    </tr>
  </c:if>
  
</c:forEach>
          
          <!-- 일반 게시글 -->
<c:forEach var="item" items="${freeboardList}">
<c:if test="${item.fbcategory ne '공지'}">
  <tr class="hover:bg-gray-50" data-category="${item.fbcategory}">
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.fbkey}</td>
    <td class="px-6 py-4">
      <div class="flex items-center">
        <c:choose>
          <c:when test="${item.fbcategory == '취업/이직'}">
            <span class="bg-blue-100 text-blue-800 text-xs px-2 py-0.5 rounded mr-2">${item.fbcategory}</span>
          </c:when>
          <c:when test="${item.fbcategory == '커리어'}">
            <span class="bg-green-100 text-green-800 text-xs px-2 py-0.5 rounded mr-2">${item.fbcategory}</span>
          </c:when>
          <c:when test="${item.fbcategory == '회사생활'}">
            <span class="bg-purple-100 text-purple-800 text-xs px-2 py-0.5 rounded mr-2">${item.fbcategory}</span>
          </c:when>
          <c:when test="${item.fbcategory == '면접'}">
            <span class="bg-yellow-100 text-yellow-800 text-xs px-2 py-0.5 rounded mr-2">${item.fbcategory}</span>
          </c:when>
          <c:when test="${item.fbcategory == '자기개발'}">
            <span class="bg-indigo-100 text-indigo-800 text-xs px-2 py-0.5 rounded mr-2">${item.fbcategory}</span>
          </c:when>
          <c:when test="${item.fbcategory == '일상'}">
            <span class="bg-pink-100 text-pink-800 text-xs px-2 py-0.5 rounded mr-2">${item.fbcategory}</span>
          </c:when>
          <c:otherwise>
            <span class="bg-gray-100 text-gray-800 text-xs px-2 py-0.5 rounded mr-2">${item.fbcategory}</span>
          </c:otherwise>
        </c:choose>
        <a href="#" class="text-gray-900 hover:text-primary hover:underline modal-open"
   data-title="${item.fbtitle}"
   data-content="${item.fbcontent}"
   data-author="${item.username}"
   data-date="${fn:substring(item.fbdate, 0, 10)}"
   data-views="${item.fbview}"
   data-like="${item.fblike}" 
   data-fbkey="${item.fbkey}">
  ${item.fbtitle}
</a>

      </div>
    </td>
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${item.username}</td>
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${fn:substring(item.fbdate, 0, 10)}</td>
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.fbview}</td>
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${item.fblike}</td>
<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 flex items-center gap-2">
<a href="${pageContext.request.contextPath}/BoardFree/delete?fbkey=${item.fbkey}"
   onclick="return confirm('정말 삭제하시겠습니까?');"
   title="삭제">
   <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-600 cursor-pointer hover:text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
     <path stroke-linecap="round" stroke-linejoin="round" d="M19 7L5 7M10 11v6M14 11v6M5 7l1-3h12l1 3M9 7V5a1 1 0 011-1h4a1 1 0 011 1v2" />
   </svg>
</a>
</td>
  </tr>
  </c:if>

</c:forEach>

        </tbody>
      </table>
    </div>
    


  </div>
</section>




<script>
document.addEventListener('DOMContentLoaded', function() {
  // 정렬 드롭다운 토글
  const sortBtn = document.getElementById('sortBtn');
  const sortDropdown = document.getElementById('sortDropdown');
  
  sortBtn.addEventListener('click', function() {
    sortDropdown.classList.toggle('hidden');
  });
  
  // 드롭다운 외부 클릭 시 닫기
  document.addEventListener('click', function(e) {
    if (!sortBtn.contains(e.target) && !sortDropdown.contains(e.target)) {
      sortDropdown.classList.add('hidden');
    }
  });
  
  // 카테고리 탭 전환
  const categoryTabs = document.querySelectorAll('.category-tab');
  categoryTabs.forEach(tab => {
    tab.addEventListener('click', function() {
      // 모든 탭 비활성화
      categoryTabs.forEach(t => {
        t.classList.remove('bg-primary', 'text-white');
        t.classList.add('bg-gray-100', 'text-gray-700');
      });
      
      // 클릭한 탭 활성화
      this.classList.add('bg-primary', 'text-white');
      this.classList.remove('bg-gray-100', 'text-gray-700');
    });
  });
});

document.addEventListener('DOMContentLoaded', () => {
    const tabs = document.querySelectorAll('.category-tab');
    const rows = document.querySelectorAll('tbody tr[data-category]');

    tabs.forEach(tab => {
      tab.addEventListener('click', () => {
        // 탭 active 상태 변경
        tabs.forEach(t => t.classList.remove('bg-primary', 'text-white'));
        tabs.forEach(t => t.classList.add('bg-gray-100', 'text-gray-700'));
        tab.classList.remove('bg-gray-100', 'text-gray-700');
        tab.classList.add('bg-primary', 'text-white');

        const selected = tab.dataset.category;

        rows.forEach(row => {
          const category = row.dataset.category;
          if (selected === '전체' || selected === category) {
            row.style.display = '';
          } else {
            row.style.display = 'none';
          }
        });
      });
    });
  });
document.addEventListener("DOMContentLoaded", () => {
	  const postModal = document.getElementById('postModal');
	  const closeModalBtn = document.getElementById('closeModalBtn');
	  const deletePostBtn = document.getElementById('deletePostBtn'); // 삭제 버튼
	  let currentFbkey = null; // 현재 열린 게시글 fbkey 저장용

	  // 모달 열기
function openModal(postData) {
  document.getElementById('modalTitle').textContent = postData.title;
  document.getElementById('modalContent').textContent = postData.content;
  document.getElementById('modalAuthor').textContent = postData.author;
  document.getElementById('modalDate').textContent = postData.date;
  document.getElementById('modalViews').textContent = postData.views;
  document.getElementById('modalLikes').textContent = postData.like; // 추가

  
  
  
  
  postModal.classList.remove('hidden');
  postModal.classList.add('flex');

}

	  // 모달 닫기
	  function closeModal() {
	    postModal.classList.remove('flex');
	    postModal.classList.add('hidden');
	  }

	  // 게시글 클릭 → 모달 열기
	  document.querySelectorAll('.modal-open').forEach(link => {
	    link.addEventListener('click', e => {
	      e.preventDefault();
	      const postData = {
	        title: e.currentTarget.dataset.title,
	        content: e.currentTarget.dataset.content,
	        author: e.currentTarget.dataset.author,
	        date: e.currentTarget.dataset.date,
	        views: e.currentTarget.dataset.views,
	        like: e.currentTarget.dataset.like,
	        fbkey: e.currentTarget.dataset.fbkey
	      };
	      openModal(postData);
	    });
	  });

	  // 닫기 버튼
	  closeModalBtn.addEventListener('click', closeModal);

	  // 백드롭 클릭 시 닫기
	  postModal.addEventListener('click', e => {
	    if (e.target === postModal) {
	      closeModal();
	    }
	  });
	});
</script>

<!-- 모달 백드롭 -->
<div id="postModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
  <!-- 모달 내부 콘텐츠 -->
  <div class="bg-white rounded-lg shadow-lg max-w-3xl w-full mx-4 p-6 relative">
    
    <!-- 닫기 버튼 -->
    <button id="closeModalBtn" class="absolute top-3 right-3 text-gray-600 hover:text-gray-900 text-xl font-bold">
      &times;
    </button>
<!-- 게시글 본문 -->
<h2 id="modalTitle" class="text-2xl font-bold mb-4">게시글 제목</h2>
<div id="modalContent" class="text-gray-700 mb-6">게시글 내용이 여기에 표시됩니다.</div>
<div class="text-sm text-gray-500 mb-4">
  작성자: <span id="modalAuthor">익명</span> |
  날짜: <span id="modalDate">2025-05-27</span> |
  조회수: <span id="modalViews">0</span> |
  추천수: <span id="modalLikes">0</span> <!-- 추가 -->
</div>



</body>
</html>

