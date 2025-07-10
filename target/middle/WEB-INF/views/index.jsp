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
              href="#"
              class="sidebar-item active flex items-center px-4 py-3 text-sm font-medium rounded-md"
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
                      readonly
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

        <!-- 메인 콘텐츠 영역 -->
        <main class="flex-1 overflow-y-auto bg-gray-50 p-4 sm:p-6 lg:p-8">
          <div
            class="pb-5 border-b border-gray-200 sm:flex sm:items-center sm:justify-between"
          >
            <h3 class="text-lg leading-6 font-medium text-gray-900">
              대시보드
            </h3>
            <div class="mt-3 sm:mt-0 sm:ml-4">
              <div class="flex items-center space-x-2">
                <!-- 최종 업데이트 시간 -->
				<span class="text-sm text-gray-500">
				  최종 업데이트: ${lastUpdated}
				</span>
               <form method="get" action="index">
			  <button
			    type="submit"
			    class="inline-flex items-center px-3 py-1.5 border border-gray-300 shadow-sm text-sm font-medium rounded-button text-gray-700 bg-white hover:bg-gray-50 whitespace-nowrap"
			  >
			    <div class="w-4 h-4 mr-1.5 flex items-center justify-center">
			      <i class="ri-refresh-line"></i>
			    </div>
			    새로고침
			  </button>
			  
			</form>
              </div>
            </div>
          </div>

          <!-- 통계 카드 -->
          <div
            class="mt-6 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4"
          >
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:p-6">
                <div class="flex items-center">
                  <div
                    class="flex-shrink-0 bg-primary bg-opacity-10 rounded-md p-3"
                  >
                    <div
                      class="w-6 h-6 text-primary flex items-center justify-center"
                    >
                      <i class="ri-user-line"></i>
                    </div>
                  </div>
                  <div class="ml-5 w-0 flex-1">
                    <dl>
                      <dt class="text-sm font-medium text-gray-500 truncate">
                        총 사용자 수
                      </dt>
                      <dd class="flex items-baseline">
                        <div class="text-2xl font-semibold text-gray-900">
                          ${totalCount}
                        </div>
                        <div
                          class="ml-2 flex items-baseline text-sm font-semibold text-green-600"
                        >
                          <div class="w-4 h-4 flex items-center justify-center">
                            <i class="ri-arrow-up-s-line"></i>
                          </div>
                          <span class="sr-only">증가</span>
                          ${userGrowthRate}%
                        </div>
                      </dd>
                    </dl>
                  </div>
                </div>
              </div>
            </div>
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:p-6">
                <div class="flex items-center">
                  <div
                    class="flex-shrink-0 bg-secondary bg-opacity-10 rounded-md p-3"
                  >
                    <div
                      class="w-6 h-6 text-secondary flex items-center justify-center"
                    >
                      <i class="ri-building-line"></i>
                    </div>
                  </div>
                  <div class="ml-5 w-0 flex-1">
                    <dl>
                      <dt class="text-sm font-medium text-gray-500 truncate">
                        등록 기업 수
                      </dt>
                      <dd class="flex items-baseline">
                        <div class="text-2xl font-semibold text-gray-900">
                          ${companyCount}
                        </div>
                        <div
                          class="ml-2 flex items-baseline text-sm font-semibold text-green-600"
                        >
                          <div class="w-4 h-4 flex items-center justify-center">
                            <i class="ri-arrow-up-s-line"></i>
                          </div>
                          <span class="sr-only">증가</span>
							${companyGrowthRate}%
                        </div>
                      </dd>
                    </dl>
                  </div>
                </div>
              </div>
            </div>
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:p-6">
                <div class="flex items-center">
                  <div class="flex-shrink-0 bg-blue-100 rounded-md p-3">
                    <div
                      class="w-6 h-6 text-blue-600 flex items-center justify-center"
                    >
                      <i class="ri-briefcase-line"></i>
                    </div>
                  </div>
                  <div class="ml-5 w-0 flex-1">
                    <dl>
                      <dt class="text-sm font-medium text-gray-500 truncate">
                        채용공고 수
                      </dt>
                      <dd class="flex items-baseline">
                        <div class="text-2xl font-semibold text-gray-900">
                          ${totalRecruitmentCount}
                        </div>
                        <div
                          class="ml-2 flex items-baseline text-sm font-semibold text-green-600"
                        >
                          <div class="w-4 h-4 flex items-center justify-center">
                            <i class="ri-arrow-up-s-line"></i>
                          </div>
                          <span class="sr-only">증가</span>

                        </div>
                      </dd>
                    </dl>
                  </div>
                </div>
              </div>
            </div>
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:p-6">
                <div class="flex items-center">
                  <div class="flex-shrink-0 bg-green-100 rounded-md p-3">
                    <div
                      class="w-6 h-6 text-green-600 flex items-center justify-center"
                    >
                      <i class="ri-file-list-line"></i>
                    </div>
                  </div>
                  <div class="ml-5 w-0 flex-1">
                    <dl>
                      <dt class="text-sm font-medium text-gray-500 truncate">
                        등록된 이력서 수
                      </dt>
                      <dd class="flex items-baseline">
                        <div class="text-2xl font-semibold text-gray-900">
                          ${resumeCount}
                        </div>
                        <div
                          class="ml-2 flex items-baseline text-sm font-semibold text-green-600"
                        >
                          <div class="w-4 h-4 flex items-center justify-center">
                            <i class="ri-arrow-up-s-line"></i>
                          </div>
                          <span class="sr-only">증가</span>

                        </div>
                      </dd>
                    </dl>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 차트 섹션 -->
          <div class="mt-8 grid grid-cols-1 gap-5 lg:grid-cols-2">
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:p-6">
                <h4 class="text-base font-medium text-gray-900 mb-4">
                  회원가입 추이
                </h4>
                <div id="userChart" class="h-80"></div>
              </div>
            </div>
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:p-6">
                <h4 class="text-base font-medium text-gray-900 mb-4">
                  채용공고 현황
                </h4>
                <div id="jobChart" class="h-80"></div>
              </div>
            </div>
          </div>
          <!-- 테이블 섹션 -->
          <div class="mt-8 grid grid-cols-1 gap-5 lg:grid-cols-2">
            <!-- 최근 가입 회원 -->
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:px-6 flex justify-between items-center">
                <h4 class="text-base font-medium text-gray-900">
                  최근 가입 회원
                </h4>
                <a href="index1" class="text-sm text-primary hover:text-primary-dark"
                  >전체보기</a
                >
              </div>
              <div class="border-t border-gray-200">
                <div class="overflow-x-auto">
                  <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                      <tr>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          이름
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          이메일
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          유형
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          가입일
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          상태
                        </th>
                      </tr>
                    </thead>
                    
<tbody class="bg-white divide-y divide-gray-200">
  <c:forEach var="member" items="${recentMembers}">
    <tr>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="flex items-center">
          <div class="flex-shrink-0 h-10 w-10">
            <img
		class="h-10 w-10 rounded-full"
		 src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MDhfMTQw%2FMDAxNjI4MzY0MDM0MDUw.YoD--WKO7npygiuKI8Cvlh3PfKHB4AOmMoi7d9I560Mg.K3HqvPIhg3mEaveR9DOq_0NRUirQWjUcN3benmW4WT4g.JPEG.moonskinz%2F%25C7%25CF%25B4%25C3%25B1%25D7%25B6%25F3.jpg&type=a340"
		 alt="사용자 프로필"
            />
          </div>
          <div class="ml-4">
            <div class="text-sm font-medium text-gray-900">
              ${member.username}
            </div>
          </div>
        </div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">${member.email}</div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">${member.type}</div>
      </td>	
      
		<td class="px-6 py-4 whitespace-nowrap">
		  <div class="text-sm text-gray-900">
		    ${fn:substring(member.regdate, 0, 10)}
		  </div>
		</td>

      <td class="px-6 py-4 whitespace-nowrap">
        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
          ${member.status eq '정상' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}">
          ${member.status}
        </span>
      </td>
    </tr>
  </c:forEach>
</tbody>
                  </table>
                </div>
              </div>
            </div>
            <!-- 최근 등록된 채용공고 -->
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:px-6 flex justify-between items-center">
                <h4 class="text-base font-medium text-gray-900">
                  최근 등록된 채용공고
                </h4>
                <a href="recruit" class="text-sm text-primary hover:text-primary-dark"
                  >전체보기</a
                >
              </div>
              <div class="border-t border-gray-200">
                <div class="overflow-x-auto">
                  <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                      <tr>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          공고명
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          기업명
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          지역
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          등록일
                        </th>
                        <th
                          scope="col"
                          class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          상태
                        </th>
                      </tr>
                    </thead>
                    
<tbody class="bg-white divide-y divide-gray-200">
  <c:forEach var="recruit" items="${recruitments}">
    <tr>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm font-medium text-gray-900">
          ${recruit.rctitle}
        </div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">
          ${recruit.username}
        </div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">
          ${recruit.rcloca}
        </div>
      </td>
      <td class="px-6 py-4 whitespace-nowrap">
        <div class="text-sm text-gray-900">
          ${fn:substring(recruit.regdate, 0, 10)}
        </div>
      </td>
	<td class="px-4 py-2 whitespace-nowrap">
            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
              ${recruit.rcstatus eq '게시중' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}">
              ${recruit.rcstatus}
            </span>
          </td>
    </tr>
  </c:forEach>
</tbody>

                  </table>
                </div>
              </div>
            </div>
          </div>

          <!-- 신고 및 문의 현황 -->
          <div class="mt-8 grid grid-cols-1 gap-5 lg:grid-cols-2">
          
           <!-- 신고 처리 현황 -->
<div class="bg-white overflow-hidden shadow rounded-lg">
  <div class="px-4 py-5 sm:px-6 flex justify-between items-center">
    <h4 class="text-base font-medium text-gray-900">
      신고 처리 현황
    </h4>
    <a href="reportList" class="text-sm text-primary hover:text-primary-dark">전체보기</a>
  </div>
  <div class="border-t border-gray-200 px-4 py-5 sm:p-6">
    <div class="grid grid-cols-3 gap-4 text-center">
      <div class="bg-red-50 rounded-lg p-4">
        <div class="text-2xl font-semibold text-red-600">${pendingCount}</div>
        <div class="text-sm text-gray-500 mt-1">처리 대기</div>
      </div>
      <div class="bg-yellow-50 rounded-lg p-4">
        <div class="text-2xl font-semibold text-yellow-600">${processingCount}</div>
        <div class="text-sm text-gray-500 mt-1">처리 중</div>
      </div>
      <div class="bg-green-50 rounded-lg p-4">
        <div class="text-2xl font-semibold text-green-600">${completedCount}</div>
        <div class="text-sm text-gray-500 mt-1">처리 완료</div>
      </div>
    </div>
    <div class="mt-6">
      <h5 class="text-sm font-medium text-gray-700 mb-3">
        최근 신고 내역
      </h5>
<ul class="divide-y divide-gray-200">
  <c:forEach var="report" items="${reportList}">
    <li class="py-3">
      <div class="flex justify-between">
        <div>
          <p class="text-sm font-medium text-gray-900">
            ${report.reason}
          </p>
          <p class="text-xs text-gray-500">
            신고자: ${report.username} | 대상: ${report.boardType} 
                | 게시글 ID #${report.boardId}
          </p>
        </div>
        <c:choose>
          <c:when test="${report.status == '처리대기'}">
            <span
              class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800"
              >대기</span
            >
          </c:when>
          <c:when test="${report.status == '처리중'}">
            <span
              class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800"
              >처리중</span
            >
          </c:when>
          <c:when test="${report.status == '처리완료'}">
            <span
              class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800"
              >완료</span
            >
          </c:when>
          <c:otherwise>
            <span
              class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-gray-100 text-gray-800"
              >알수없음</span
            >
          </c:otherwise>
        </c:choose>
      </div>
    </li>
  </c:forEach>
</ul>
    </div>
  </div>
</div>

            <!-- 문의글 응답 현황 -->
            <div class="bg-white overflow-hidden shadow rounded-lg">
              <div class="px-4 py-5 sm:px-6 flex justify-between items-center">
                <h4 class="text-base font-medium text-gray-900">
                  문의글 응답 현황
                </h4>
                <a href="oneonone" class="text-sm text-primary hover:text-primary-dark"
                  >전체보기</a
                >
              </div>
              <div class="border-t border-gray-200 px-4 py-5 sm:p-6">
                <div class="grid grid-cols-2 gap-4 text-center">
                  <div class="bg-red-50 rounded-lg p-4">
                    <div class="text-2xl font-semibold text-red-600">${unansweredCount}</div>
                    <div class="text-sm text-gray-500 mt-1">미응답</div>
                  </div>

                  <div class="bg-green-50 rounded-lg p-4">
                    <div class="text-2xl font-semibold text-green-600">${answeredCount}</div>
                    <div class="text-sm text-gray-500 mt-1">답변 완료</div>
                  </div>
                </div>
                <div class="mt-6">
                  <h5 class="text-sm font-medium text-gray-700 mb-3">
                    최근 문의 내역
                  </h5>
<ul class="divide-y divide-gray-200">
  <c:forEach var="qna" items="${recentQnaList}">
    <li class="py-3">
      <div class="flex justify-between">
        <div>
          <p class="text-sm font-medium text-gray-900">
            ${qna.qnatitle}
          </p>
          <p class="text-xs text-gray-500">
            문의자: ${qna.username} | ${qna.qnadate}
          </p>
        </div>
        <c:choose>
          <c:when test="${qna.qna_status == 'N'}">
            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
              미응답
            </span>
          </c:when>
          <c:when test="${qna.qna_status == 'Y'}">
            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
              완료
            </span>
          </c:when>
        </c:choose>
      </div>
    </li>
  </c:forEach>
</ul>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // 회원가입 추이 차트
        const userChartDom = document.getElementById("userChart");
        const userChart = echarts.init(userChartDom);
        const userOption = {
          animation: false,
          tooltip: {
            trigger: "axis",
            backgroundColor: "rgba(255, 255, 255, 0.8)",
            borderColor: "#E5E7EB",
            textStyle: {
              color: "#1F2937",
            },
          },
          legend: {
            data: ["일반 사용자", "기업 사용자"],
            bottom: 0,
          },
          grid: {
            left: "3%",
            right: "4%",
            bottom: "15%",
            top: "3%",
            containLabel: true,
          },
          xAxis: {
            type: "category",
            boundaryGap: false,
            data: ["1월", "2월", "3월", "4월", "5월","6월"],
          },
          yAxis: {
            type: "value",
            axisLine: {
              show: false,
            },
            splitLine: {
              lineStyle: {
                color: "#E5E7EB",
              },
            },
          },
          series: [
            {
              name: "일반 사용자",
              type: "line",
              smooth: true,
              lineStyle: {
                width: 3,
                color: "rgba(87, 181, 231, 1)",
              },
              areaStyle: {
                color: {
                  type: "linear",
                  x: 0,
                  y: 0,
                  x2: 0,
                  y2: 1,
                  colorStops: [
                    {
                      offset: 0,
                      color: "rgba(87, 181, 231, 0.2)",
                    },
                    {
                      offset: 1,
                      color: "rgba(87, 181, 231, 0.05)",
                    },
                  ],
                },
              },
              symbol: "none",
              data: [${januaryCount}, ${februaryCount}, ${marchCount}, ${aprilCount}, ${mayCount}, ${junCount}],
            },
            {
              name: "기업 사용자",
              type: "line",
              smooth: true,
              lineStyle: {
                width: 3,
                color: "rgba(141, 211, 199, 1)",
              },
              areaStyle: {
                color: {
                  type: "linear",
                  x: 0,
                  y: 0,
                  x2: 0,
                  y2: 1,
                  colorStops: [
                    {
                      offset: 0,
                      color: "rgba(141, 211, 199, 0.2)",
                    },
                    {
                      offset: 1,
                      color: "rgba(141, 211, 199, 0.05)",
                    },
                  ],
                },
              },
              symbol: "none",
              data: [${companyjanuaryCount}, ${companyfebruaryCount}, ${companymarchCount}, ${companyaprilCount}, ${companymayCount},${companyjunCount}],
            },
          ],
        };
        userChart.setOption(userOption);

        // 채용공고 현황 차트
        const jobChartDom = document.getElementById("jobChart");
        const jobChart = echarts.init(jobChartDom);
        const jobOption = {
          animation: false,
          tooltip: {
            trigger: "item",
            backgroundColor: "rgba(255, 255, 255, 0.8)",
            borderColor: "#E5E7EB",
            textStyle: {
              color: "#1F2937",
            },
          },
          legend: {
            bottom: 0,
            left: "center",
          },
          series: [
            {
              name: "채용공고 현황",
              type: "pie",
              radius: ["40%", "70%"],
              center: ["50%", "45%"],
              avoidLabelOverlap: false,
              itemStyle: {
                borderRadius: 8,
                borderColor: "#fff",
                borderWidth: 2,
              },
              label: {
                show: false,
                position: "center",
              },
              emphasis: {
                label: {
                  show: true,
                  fontSize: "14",
                  fontWeight: "bold",
                },
              },
              labelLine: {
                show: false,
              },
              data: [
                {
                  value: ${domesticCount},
                  name: "국내 채용",
                  itemStyle: { color: "rgba(87, 181, 231, 1)" },
                },
                {
                  value: ${overseasCount},
                  name: "해외 채용",
                  itemStyle: { color: "rgba(141, 211, 199, 1)" },
                },
                {
                  value: ${regularCount},
                  name: "정규직",
                  itemStyle: { color: "rgba(251, 191, 114, 1)" },
                },
                {
                  value: ${contractFreelanceCount},
                  name: "계약직",
                  itemStyle: { color: "rgba(252, 141, 98, 1)" },
                },
              ],
            },
          ],
        };
        jobChart.setOption(jobOption);

        // 반응형 처리
        window.addEventListener("resize", function () {
          userChart.resize();
          jobChart.resize();
        });
      });

      // 사이드바 토글 기능
      document.addEventListener("DOMContentLoaded", function () {
        const menuButton = document.querySelector('button[type="button"]');
        if (menuButton) {
          menuButton.addEventListener("click", function () {
            const sidebar = document.querySelector(".md\\:flex.flex-col.w-64");
            if (sidebar) {
              sidebar.classList.toggle("hidden");
              sidebar.classList.toggle("md:flex");
            }
          });
        }
      });
    </script>
  </body>
</html>


