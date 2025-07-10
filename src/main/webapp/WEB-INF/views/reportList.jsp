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
              href="BoardFree"
              class="sidebar-item flex items-center px-4 py-3 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-50"
            >
              <div class="w-5 h-5 mr-3 flex items-center justify-center">
                <i class="ri-message-2-line"></i>
              </div>
              게시판 관리
            </a>
            <a
              href="#"
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
  
<body>

<div class="bg-white p-6 rounded shadow overflow-x-auto">
  <h2 class="text-2xl font-semibold mb-4">신고 게시판 목록</h2>
  
  <!-- 게시판 종류별 필터 버튼 -->
<div class="mb-6 space-x-3">
  <button
    type="button"
    onclick="filterBoardType('all')"
    class="px-4 py-2 bg-primary text-white rounded-button hover:bg-indigo-700 transition"
  >전체</button>

  <button
    type="button"
    onclick="filterBoardType('자유게시판')"
    class="px-4 py-2 bg-primary text-white rounded-button hover:bg-green-700 transition"
  >자유게시판</button>

  <button
    type="button"
    onclick="filterBoardType('채용공고')"
    class="px-4 py-2 bg-primary text-white rounded-button hover:bg-gray-700 transition"
  >채용공고</button>
</div>

  <table class="min-w-full text-sm text-left border border-gray-200">
    <thead class="bg-gray-50">
      <tr class="text-gray-700">
        <th class="px-4 py-3 w-16 text-center">신고 번호</th>
        <th class="px-4 py-3">게시판 종류</th>
        <th class="px-4 py-3">신고 사유</th>
        <th class="px-4 py-3">글 번호</th>
        <th class="px-4 py-3">신고자</th>
        <th class="px-4 py-3">상태</th>
        <th class="px-4 py-3">신고 날짜</th>
        <th class="px-4 py-3">처리</th>
        <th class="px-4 py-3">삭제</th>
      </tr>
    </thead>
<tbody>
  <c:forEach var="report" items="${reportList}">
    <tr data-board-type="${report.boardType}" class="border-t hover:bg-gray-50">
      <td class="px-4 py-2">
        <c:choose>
          <c:when test="${report.boardType eq '자유게시판'}">
            <a href="${pageContext.request.contextPath}/freeboardDetail/${report.boardId}" class="text-blue-600 hover:underline">
              ${report.reportId}
            </a>
          </c:when>
          <c:when test="${report.boardType eq '채용공고'}">
            <a href="${pageContext.request.contextPath}/recruit/${report.boardId}" class="text-blue-600 hover:underline">
              ${report.reportId}
            </a>
          </c:when>
          <c:otherwise>
            ${report.reportId}
          </c:otherwise>
        </c:choose>
      </td>
      <td class="px-4 py-2">${report.boardType}</td>
      <td class="px-4 py-2">${report.reason}</td>
      <td class="px-4 py-2">${report.boardId}</td>
      <td class="px-4 py-2">${report.username}</td>
      <td class="px-4 py-2">
        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
          ${report.status == '처리대기' ? 'bg-red-100 text-red-800' : ''}
          ${report.status == '처리중' ? 'bg-yellow-100 text-yellow-800' : ''}
          ${report.status == '처리완료' ? 'bg-green-100 text-green-800' : ''}">
          ${report.status}
        </span>
      </td>
      <td class="px-4 py-2">${fn:substring(report.reportDate, 0, 10)}</td>
<td class="px-4 py-2">
  <c:choose>
    <c:when test="${report.status == '처리대기'}">
      <a href="${pageContext.request.contextPath}/report/updateStatus?reportId=${report.reportId}&status=처리중"
         onclick="return confirm('처리중으로 상태를 변경하시겠습니까?');"
         class="text-yellow-600 hover:underline">
         처리중 변경
      </a>
    </c:when>
    <c:when test="${report.status == '처리중'}">
      <a href="${pageContext.request.contextPath}/report/updateStatus?reportId=${report.reportId}&status=처리완료"
         onclick="return confirm('처리완료로 상태를 변경하시겠습니까?');"
         class="text-green-600 hover:underline">
         처리완료 변경
      </a>
    </c:when>
    <c:when test="${report.status == '처리완료'}">
      <span class="text-gray-500 font-semibold">완료됨</span>
    </c:when>
  </c:choose>
</td>
<td class="px-4 py-2">
<a href="${pageContext.request.contextPath}/report/delete/${report.reportId}" 
   onclick="return confirm('정말 삭제하시겠습니까?');" 
   class="text-red-600 hover:underline">
   삭제
</a>
</td>
    </tr>
  </c:forEach>
</tbody>
  </table>
</div>
<script>
function filterBoardType(type) {
    const rows = document.querySelectorAll("tbody tr");

    rows.forEach(row => {
      const boardType = row.getAttribute("data-board-type");
      if (type === 'all' || boardType === type) {
        row.style.display = "";
      } else {
        row.style.display = "none";
      }
    });
  }

  // 페이지 로드시 전체 표시
  window.addEventListener('DOMContentLoaded', () => {
    filterBoardType('all');
  });
</script>
</body>
</html>