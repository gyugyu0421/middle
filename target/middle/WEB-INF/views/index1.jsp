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
              href="#"
              class="sidebar-item active flex items-center px-4 py-3 text-sm font-medium rounded-md"
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
    <h2 class="text-2xl font-bold text-gray-800 mb-6">회원 관리</h2>

<!-- 필터 버튼 추가 -->
<div class="mb-6 space-x-3">
  <button
    type="button"
    onclick="filter('all')"
    class="px-4 py-2 bg-primary text-white rounded-button hover:bg-indigo-700 transition"
  >전체회원</button>
  <button
    type="button"
    onclick="filter('기업')"
    class="px-4 py-2 bg-primary text-white rounded-button hover:bg-green-700 transition"
  >기업회원</button>
  <button
    type="button"
    onclick="filter('일반')"
    class="px-4 py-2 bg-primary text-white rounded-button hover:bg-gray-700 transition"
  >일반회원</button>
</div>

<div class="bg-white p-6 rounded shadow overflow-x-auto">
  <table id="memberTable" class="min-w-full text-sm text-left border">
    <thead class="bg-gray-50">
      <tr class="text-gray-700">
        <th class="px-4 py-3 w-10 text-center"></th>
        <th class="px-4 py-3">이름</th>
        <th class="px-4 py-3">이메일</th>
        <th class="px-4 py-3">회원 유형</th>
        <th class="px-4 py-3">가입일</th>
        <th class="px-4 py-3">상태</th>
        <th class="px-4 py-3 text-center">관리</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="member" items="${memberList}">
        <!-- data-type 속성 추가 -->
        <tr data-type="${member.type}" class="border-t hover:bg-gray-50">
          <td class="px-4 py-2 text-center"><input type="checkbox"></td>
          <td class="px-4 py-2">${member.username}</td>
          <td class="px-4 py-2">${member.email}</td>
          <td class="px-4 py-2">${member.type}</td>
          <td class="px-4 py-2">${fn:substring(member.regdate, 0, 10)}</td>
          <td class="px-4 py-2 text-green-600 font-semibold">
            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
              ${member.status eq '정상' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}">
              ${member.status}
            </span>
          </td>
          <td class="px-4 py-2 text-center space-x-2">
<c:choose>
  <c:when test="${member.type == '기업'}">
    <a href="javascript:void(0);"
       class="text-blue-600 hover:underline"
       onclick="openCompanyModal(
         '${fn:replace(member.username, '\'', '\\\'')}',
         '${fn:replace(member.cnum, '\'', '\\\'')}',
         '${fn:replace(member.cscale, '\'', '\\\'')}',
         '${fn:replace(member.add1, '\'', '\\\'')} ${fn:replace(member.add2, '\'', '\\\'')}',
         '${fn:replace(member.id, '\'', '\\\'')}',
         '${fn:replace(member.email, '\'', '\\\'')}',
       )">
      상세
    </a>
  </c:when>
  <c:otherwise>
    <a href="javascript:void(0);"
       class="text-blue-600 hover:underline"
       onclick="openModal(
         '${fn:replace(member.username, '\'', '\\\'')}',
         '${fn:substring(member.birth, 0, 10)}',
         '${fn:replace(member.phone, '\'', '\\\'')}',
         '${fn:replace(member.email, '\'', '\\\'')}',
         '${fn:replace(member.add1, '\'', '\\\'')}',
         '${fn:replace(member.add2, '\'', '\\\'')}'
       )">
      상세
    </a>
  </c:otherwise>
</c:choose>

  <!-- 상태에 따라 활성/비활성 버튼 출력 -->
  <c:choose>
    <c:when test="${member.status == '정지'}">
      <a href="${pageContext.request.contextPath}/admin/activateMember?mkey=${member.mkey}"
         onclick="return confirm('정말 회원을 정상 활성 처리하시겠습니까?');"
         class="text-green-600 hover:underline">
         활성
      </a>
    </c:when>
    <c:otherwise>
      <a href="${pageContext.request.contextPath}/admin/deactivateMember?mkey=${member.mkey}"
         onclick="return confirm('정말 회원을 정지 처리하시겠습니까?');"
         class="text-gray-600 hover:underline">
         비활성
      </a>
    </c:otherwise>
  </c:choose>

<!-- 삭제 버튼 (링크 클릭 방식) -->
<a href="${pageContext.request.contextPath}/admin/deleteMember?mkey=${member.mkey}"
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
  function filter(type) {
    const rows = document.querySelectorAll('#memberTable tbody tr');
    rows.forEach(row => {
      if(type === 'all' || row.getAttribute('data-type') === type) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    });
  }
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}" />
  function openModal(username, birth, phone, email, add1, add2) {
	    document.getElementById('modalUsername').value = username;
	    document.getElementById('modalBirth').value = birth;
	    document.getElementById('modalPhone').value = phone;
	    document.getElementById('modalEmail').value = email;
	    document.getElementById('modalAdd1').value = add1;
	    document.getElementById('modalAdd2').value = add2;
	    document.getElementById('memberModal').classList.remove('hidden');
	  }

	  function closeModal() {
	    document.getElementById('memberModal').classList.add('hidden');
	  }
  
  
	  function openCompanyModal(username, cnum, cscale, address, userid, email) {
		    document.getElementById('modalCompany').value = username;
		    document.getElementById('modalBiznum').value = cnum;
		    document.getElementById('modalScale').value = cscale;
		    document.getElementById('modalAddress').value = address;
		    document.getElementById('modalUserid').value = userid;
		    document.getElementById('modalCompanyEmail').value = email;
		    document.getElementById('companyModal').classList.remove('hidden');
		  }

		  function closeModal() {
		    document.getElementById('memberModal')?.classList.add('hidden');
		    document.getElementById('companyModal')?.classList.add('hidden');
		  }
		  function deleteMember(mkey) {
			  if (confirm("정말 이 회원을 삭제하시겠습니까?")) {
			    location.href = `${contextPath}/admin/deleteMember?mkey=${mkey}`;
			  }
			}
	  
  
  
</script>
  </main>
  <!-- 회원 상세 모달 -->
<div id="memberModal" class="fixed inset-0 bg-black bg-opacity-30 flex items-center justify-center hidden z-50">
  <div class="bg-white rounded shadow-lg w-full max-w-2xl p-6 relative">
    <button onclick="closeModal()" class="absolute top-4 right-4 text-gray-500 hover:text-black text-xl">×</button>

    <h2 class="text-2xl font-bold mb-6">회원정보 상세</h2>

    <div class="flex items-center gap-4 mb-8">
      <div class="relative w-20 h-20 rounded-full bg-gray-200 overflow-hidden">
        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MDhfMTQw%2FMDAxNjI4MzY0MDM0MDUw.YoD--WKO7npygiuKI8Cvlh3PfKHB4AOmMoi7d9I560Mg.K3HqvPIhg3mEaveR9DOq_0NRUirQWjUcN3benmW4WT4g.JPEG.moonskinz%2F%25C7%25CF%25B4%25C3%25B1%25D7%25B6%25F3.jpg&type=a340" alt="프로필 사진">
      </div>
    </div>

    <div class="border p-6 rounded mb-6 space-y-4">
      <h3 class="font-semibold text-lg mb-2">기본정보</h3>

      <div class="flex items-center gap-4">
        <label class="w-24">이름</label>
        <input type="text" id="modalUsername" class="flex-1 border rounded px-3 py-2" readonly/>
      </div>

      <div class="flex items-center gap-4">
        <label class="w-24">생년월일</label>
        <input type="text" id="modalBirth" class="flex-1 border rounded px-3 py-2" readonly />
      </div>
    </div>

    <div class="border p-6 rounded space-y-4">
      <h3 class="font-semibold text-lg mb-2">연락처 정보</h3>

      <div class="flex items-center gap-4">
        <label class="w-24">휴대폰</label>
        <input type="text" id="modalPhone" class="flex-1 border rounded px-3 py-2" readonly/>
      </div>

      <div class="flex items-center gap-4">
        <label class="w-24">이메일</label>
        <input type="email" id="modalEmail" class="flex-1 border rounded px-3 py-2" readonly/>
      </div>

      <div class="flex items-center gap-4">
        <label class="w-24">주소</label>
        <div class="flex-1 space-y-2">
          <input type="text" id="modalAdd1" class="w-full border rounded px-3 py-2" readonly/>
          <input type="text" id="modalAdd2" class="w-full border rounded px-3 py-2" readonly/>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 기업 모달창 -->
<div id="companyModal" class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center hidden z-50">
  <div class="bg-white rounded shadow-lg max-w-3xl w-full p-8 overflow-y-auto max-h-[90vh] relative">
    <button onclick="closeModal()" class="absolute top-2 right-2 text-gray-500 hover:text-black text-2xl font-bold">&times;</button>

    <!-- 👇 네가 준 기업 상세 HTML (값은 JavaScript로 채워짐) -->
    <div class="max-w-3xl mx-auto bg-white p-8 rounded shadow">
      <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">기업정보 상세</h1>
      </div>

      <!-- 프로필 사진 -->
      <div class="flex items-center gap-6 mb-8">
      <div class="relative w-24 h-24">
          <!-- <img id="companyPreview" src="" alt="미리보기" class="rounded-full w-full h-full object-cover border"> -->
          <img id="companyDefaultImg" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MDhfMTQw%2FMDAxNjI4MzY0MDM0MDUw.YoD--WKO7npygiuKI8Cvlh3PfKHB4AOmMoi7d9I560Mg.K3HqvPIhg3mEaveR9DOq_0NRUirQWjUcN3benmW4WT4g.JPEG.moonskinz%2F%25C7%25CF%25B4%25C3%25B1%25D7%25B6%25F3.jpg&type=a340" alt="기본 프로필" class="rounded-full w-full h-full object-cover border bg-gray-100"> 
        </div> 
      </div>

      <!-- 기업정보 폼 -->
      <form class="space-y-8">
        <div>
          <h2 class="text-lg font-semibold mb-4">기본정보</h2>
          <div class="space-y-4 border rounded p-4">
            <div class="flex flex-col sm:flex-row sm:items-center gap-2">
              <label class="sm:w-32 font-medium">회사명</label>
              <input type="text" id="modalCompany" class="flex-1 border px-3 py-2 rounded" readonly>
            </div>
            <div class="flex flex-col sm:flex-row sm:items-center gap-2">
              <label class="sm:w-32 font-medium">사업자등록번호</label>
              <input type="text" id="modalBiznum" class="flex-1 border px-3 py-2 rounded" readonly>
            </div>
            <div class="flex flex-col sm:flex-row sm:items-center gap-2">
              <label class="sm:w-32 font-medium">기업규모</label>
              <input type="text" id="modalScale" class="flex-1 border px-3 py-2 rounded" readonly>
            </div>
            <div class="flex flex-col sm:flex-row sm:items-center gap-2">
              <label class="sm:w-32 font-medium">주소</label>
              <input type="text" id="modalAddress" class="flex-1 border px-3 py-2 rounded" readonly>
            </div>
            <div class="flex flex-col sm:flex-row sm:items-center gap-2">
              <label class="sm:w-32 font-medium">아이디</label>
              <input type="text" id="modalUserid" class="flex-1 border px-3 py-2 rounded" readonly>
            </div>
            <div class="flex flex-col sm:flex-row sm:items-center gap-2">
              <label class="sm:w-32 font-medium">이메일</label>
              <input type="text" id="modalCompanyEmail" class="flex-1 border px-3 py-2 rounded" readonly>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>


</body>
</html>


