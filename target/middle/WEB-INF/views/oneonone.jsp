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
              href="#"
              class="sidebar-item active flex items-center px-4 py-3 text-sm font-medium rounded-md"
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
<main class="flex-1 p-6">
  <h2 class="text-2xl font-bold text-gray-800 mb-6">최근 등록된 문의 내역</h2>

  <div class="bg-white overflow-hidden shadow rounded-lg">
    <div class="px-4 py-5 sm:px-6 flex justify-between items-center">
      <h4 class="text-base font-medium text-gray-900">목록</h4>
      <a href="#" class="text-sm text-primary hover:text-primary-dark">전체보기</a>
    </div>

    <div class="border-t border-gray-200">
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">문의명</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">작성자</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">회원 유형</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">등록일</th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"> 응답 현황</th>
              <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">관리</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <c:forEach var="qna" items="${qnaList}">
              <tr class="hover:bg-gray-50">
<td class="px-6 py-4 whitespace-nowrap">
 <div  class="text-sm font-medium text-gray-900">${qna.qnatitle}</div>
</td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <div class="text-sm text-gray-900">${qna.username}</div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                  <div class="text-sm text-gray-900">${qna.type}</div>
                </td>
                <td class="px-4 py-2 whitespace-nowrap">
                  <div class="text-sm text-gray-900">${fn:substring(qna.qnadate, 0, 10)}</div>
                </td>

                
	<td class="px-4 py-2 whitespace-nowrap">
            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
              ${qna.qna_status eq 'Y' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}">
              ${qna.qna_status eq 'Y' ? '완료' : '미응답'}
            </span>
          </td>
                

			<td class="px-4 py-2 text-center whitespace-nowrap space-x-2 text-sm"> 
<!-- 상세 버튼 (편집 모달 호출) -->
<button 
  type="button"
  class="text-blue-600 hover:underline"
  onclick='openEditQnaModal({
    qnakey: "${qna.qnakey}",
    qnaStatus: "${qna.qna_status}",
    qnatitle: "${qna.qnatitle}",
    qnadate: "${fn:substring(qna.qnadate, 0, 10)}",
    qnacontents: `${qna.qnacontents}`,
    admin_title: "${qna.admin_title}",
    answer_date: "${qna.answer_date}",
    admin_contents: `${qna.admin_contents}`,
    contextPath: "${pageContext.request.contextPath}"
  })'
>
  상세
</button>

<a href="${pageContext.request.contextPath}/qna/delete/${qna.qnakey}"
   onclick="return confirm('정말 삭제하시겠습니까?');"
   class="text-red-600 hover:underline">
   삭제
</a>
			</td>
                
                
                
   <%--              <td class="px-6 py-4 text-center whitespace-nowrap space-x-2">
            <c:choose>
                    <c:when test="${member.type == '기업'}">
                      <a href="minfo_company?mkey=${member.mkey}" class="text-blue-600 hover:underline">상세</a>
                    </c:when>
                    <c:otherwise>
                      <a href="minfo?mkey=${member.mkey}" class="text-blue-600 hover:underline">상세</a>
                    </c:otherwise>
                  </c:choose> 
                  <button class="text-gray-600 hover:underline">비활성</button>
                  <button class="text-red-600 hover:underline">삭제</button>
                </td> --%>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  
 <script> 
	function openEditQnaModal(qna) {
	  document.getElementById('editModalQnaNo').textContent = 'No. ' + (qna.qnakey || '-');
	  document.getElementById('editModalQnaStatus').textContent = (qna.qnaStatus === 'Y') ? '답변완료' : '답변대기';
	  document.getElementById('editModalQnaStatus').className = qna.qnaStatus === 'Y'
	    ? 'ml-4 text-sm px-3 py-1 rounded-full bg-green-100 text-green-700'
	    : 'ml-4 text-sm px-3 py-1 rounded-full bg-gray-200 text-gray-700';

	  document.getElementById('editModalQnaTitle').textContent = qna.qnatitle || '-';
	  document.getElementById('editModalQnaDate').textContent = qna.qnadate || '-';
	  document.getElementById('editModalQnaContents').textContent = qna.qnacontents || '-';

	  document.getElementById('editModalQnaNoInput').value = qna.qnakey || '';
	  document.getElementById('editModalAdminTitleInput').value = qna.admin_title || '';
	  document.getElementById('editModalAdminContentsInput').value = qna.admin_contents || '';

	  // 삭제 링크
	  document.getElementById('editModalQnaDeleteLink').href = `${qna.contextPath}/qna/delete/${qna.qnakey}`;

	  document.getElementById('editQnaModal').classList.remove('hidden');
	}

	function closeEditQnaModal() {
	  document.getElementById('editQnaModal').classList.add('hidden');
	}

</script>
  
</main>



<!-- 답변 작성 모달 -->
<div id="editQnaModal" class="hidden fixed inset-0 bg-black bg-opacity-30 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-lg max-w-4xl w-full relative overflow-y-auto max-h-[90vh]">
    <button onclick="closeEditQnaModal()" class="absolute top-2 right-3 text-2xl">×</button>
    <h2 class="text-2xl font-bold mb-6">1:1 문의 상세 및 답변 작성</h2>

    <div class="mb-4 flex items-center">
      <span class="text-gray-500 text-sm" id="editModalQnaNo"></span>
      <span class="ml-4 text-sm px-3 py-1 rounded-full" id="editModalQnaStatus"></span>
    </div>

    <div class="mb-6">
      <h3 class="text-xl font-semibold" id="editModalQnaTitle"></h3>
      <p class="text-gray-500 text-sm mt-1" id="editModalQnaDate"></p>
    </div>

    <div class="border-t border-gray-200 pt-4 text-gray-800 leading-relaxed whitespace-pre-line text-base max-h-[400px] overflow-y-auto" id="editModalQnaContents"></div>
    
    <form id="adminAnswerForm" action="${pageContext.request.contextPath}/qna/admin/reply" method="post" onsubmit="setTimeout(() => location.reload(), 100);">
      <input type="hidden" name="qnakey" id="editModalQnaNoInput" value="">
      
      <label class="block mb-2 text-sm font-medium text-gray-700">답변 제목</label>
      <input type="text" id="editModalAdminTitleInput" name="admin_title" class="w-full mb-4 p-2 border border-gray-300 rounded" placeholder="답변 제목 입력" required>
      
      <label class="block mb-2 text-sm font-medium text-gray-700">답변 내용</label>
      <textarea id="editModalAdminContentsInput" name="admin_contents" rows="6" class="w-full p-2 border border-gray-300 rounded resize-none" placeholder="답변 내용을 입력하세요" required></textarea>
      
      <div class="mt-4 flex items-center gap-3">
        <button type="submit" class="px-6 py-2 bg-primary text-white rounded hover:bg-opacity-90">답변 저장</button>
      <a href="#" id="editModalQnaDeleteLink" class="px-6 py-2 bg-red-500 text-white rounded hover:bg-red-600 hidden" onclick="return confirm('정말 삭제하시겠습니까?');"></a>
      </div>
    </form>
  </div>
</div>

</body>
</html>