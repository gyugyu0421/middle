<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../common/header.jsp"%>

	<!-- 메인 콘텐츠 -->
	<main class="container mx-auto px-4 pt-24 pb-12 min-h-screen flex">
		<!-- 왼쪽 컨텐츠 영역 -->
		<div class="flex-1">
			<!-- 페이지 제목 -->
			<div class="mb-8">
				<h1 class="text-3xl font-bold text-gray-900">내 이력서</h1>
				<p class="text-gray-600 mt-2">언제든 지원할 수 있는 준비된 이력서, 지금부터 시작하세요.</p>
			</div>
			<!-- 필터 및 정렬 -->
			<div
				class="bg-white p-4 rounded-lg shadow-sm mb-6 flex flex-wrap items-center justify-between gap-4">
				<div class="flex flex-wrap gap-3">
					<div class="relative">
						<!-- <button id="industryDropdown"
							class="flex items-center justify-between w-40 px-4 py-2 text-sm bg-white border border-gray-300 rounded-button text-gray-700">
							<span>산업군</span> <i class="ri-arrow-down-s-line"></i>
						</button>
						<div id="industryOptions"
							class="hidden absolute z-10 mt-1 w-40 bg-white shadow-lg rounded-md py-1">
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">전체</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">IT/소프트웨어</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">금융/보험</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">제조/생산</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">서비스업</a>
						</div>
					</div>
					<div class="relative">
						<button id="jobDropdown"
							class="flex items-center justify-between w-40 px-4 py-2 text-sm bg-white border border-gray-300 rounded-button text-gray-700">
							<span>직무</span> <i class="ri-arrow-down-s-line"></i>
						</button>
						<div id="jobOptions"
							class="hidden absolute z-10 mt-1 w-40 bg-white shadow-lg rounded-md py-1">
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">전체</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">개발</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">디자인</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">마케팅</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">영업</a>
						</div>
					</div>
					<div class="relative">
						<button id="careerDropdown"
							class="flex items-center justify-between w-40 px-4 py-2 text-sm bg-white border border-gray-300 rounded-button text-gray-700">
							<span>경력</span> <i class="ri-arrow-down-s-line"></i>
						</button> -->
						<div id="careerOptions"
							class="hidden absolute z-10 mt-1 w-40 bg-white shadow-lg rounded-md py-1">
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">전체</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">신입</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">1~3년</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">4~7년</a>
							<a href="#"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">8년
								이상</a>
						</div>
					</div>
				</div>


				<!-- 🔽 여기부터 검색창 + 글쓰기 버튼 -->
				<div class="flex items-center gap-2">
					<!-- 글쓰기 버튼 -->
					<a href="resume_Write"
						class="inline-flex items-center px-4 py-2 bg-primary text-white text-sm font-medium rounded-button hover:bg-primary/90 transition">
						<i class="ri-edit-line mr-2"></i> 글쓰기
					</a>

<!-- 					검색창
					<div class="relative w-64">
						<input type="text" placeholder="검색어를 입력하세요"
							class="w-full px-4 py-2 pr-10 text-sm border border-gray-300 rounded-button focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent">
						<button
							class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-primary">
							<i class="ri-search-line"></i>
						</button>
					</div> -->
				</div>
			</div>


			<!-- 이력서 리스트 -->
			<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
			
			<c:forEach items="${myresumeList}" var="resume">
				<!-- 이력서 항목 1 -->
				<div
					class="bg-white rounded-lg shadow-sm overflow-hidden hover:shadow-md transition-shadow">
					<div class="p-5">
						<div class="flex justify-between items-start mb-4">
							<div>
								<a href="resume_View?rskey=${resume.rskey }">
								<h3 class="text-lg font-bold text-gray-900">${resume.rstitle}</h3>
								</a>
<!-- 								<span class="w-24 text-gray-700">지원 직무</span>
								<p class="text-sm text-gray-600">
								
								프론트엔드 개발자</p> -->
							</div>
							<div class="flex space-x-2">
								<!-- <span
									class="px-2 py-1 bg-blue-50 text-blue-700 text-xs rounded-full">IT</span> -->
								<!-- <span
									class="px-2 py-1 bg-green-50 text-green-700 text-xs rounded-full">정규직</span> -->
							</div>
						</div>
						<div class="space-y-2 mb-4">
							<div class="flex items-center text-sm">
								<span class="w-24 text-gray-500">지원 직무</span> <span
									class="text-gray-700">${resume.rsapplied}</span>
							</div>
							<div class="flex items-center text-sm">
								<span class="w-24 text-gray-500">경력 직무</span> <span
									class="text-gray-700">${resume.rspart}</span>
							</div>
							<div class="flex items-center text-sm">
								<span class="w-24 text-gray-500">수상 이력</span> <span
									class="text-gray-700">${resume.rsawards}</span>
							</div>
							<div class="flex items-center text-sm">
								<span class="w-24 text-gray-500">스킬</span> <span
									class="text-gray-700">${resume.rsskname}</span>
							</div>
						</div>
						<p class="text-sm text-gray-700 border-t pt-4">
						<span class="w-24 text-gray-500">자기소개서</span><br>
						${resume.rscletter}</p>
					</div>
					<div class="bg-gray-50 px-5 py-3 flex justify-between items-center">
						<div class="flex items-center space-x-2 text-sm text-gray-500">
							<i class="ri-eye-line"></i> <span>3,256</span>
						</div>
						<!-- <div class="flex space-x-2">
							<button
								class="text-gray-500 hover:text-primary w-8 h-8 flex items-center justify-center">
								<i class="ri-translate-2"></i>
							</button>
							<button
								class="text-gray-500 hover:text-primary w-8 h-8 flex items-center justify-center">
								<i class="ri-bookmark-line"></i>
							</button>
							<button
								class="text-gray-500 hover:text-primary w-8 h-8 flex items-center justify-center">
								<i class="ri-share-line"></i>
							</button>
						</div> -->
					</div>
				</div>
				
				</c:forEach>
				
			<!-- 페이지네이션 -->
<!-- 			<div class="mt-10 flex justify-center">
				<nav class="flex items-center space-x-1">
					<a href="#"
						class="px-3 py-2 rounded-md text-sm text-gray-500 hover:bg-gray-100">
						<i class="ri-arrow-left-s-line"></i>
					</a> <a href="#"
						class="px-3 py-2 rounded-md text-sm text-white bg-primary">1</a> <a
						href="#"
						class="px-3 py-2 rounded-md text-sm text-gray-700 hover:bg-gray-100">2</a>
					<a href="#"
						class="px-3 py-2 rounded-md text-sm text-gray-700 hover:bg-gray-100">3</a>
					<a href="#"
						class="px-3 py-2 rounded-md text-sm text-gray-700 hover:bg-gray-100">4</a>
					<a href="#"
						class="px-3 py-2 rounded-md text-sm text-gray-700 hover:bg-gray-100">5</a>
					<a href="#"
						class="px-3 py-2 rounded-md text-sm text-gray-500 hover:bg-gray-100">
						<i class="ri-arrow-right-s-line"></i>
					</a>
				</nav>
			</div> -->
		</div>
		<!-- 오른쪽 사이드바 -->
		<!-- <div class="hidden lg:block w-72 ml-8">
			카테고리 메뉴
			<div class="bg-white rounded-lg shadow-sm p-5 mb-6">
				<h3 class="text-lg font-bold text-gray-900 mb-4">커리어 카테고리</h3>
				<ul class="space-y-2">
					<li><a
						href="https://readdy.ai/home/5ecc45c0-778b-4275-a0c1-0317498ec5c1/1a5ef309-a168-4f92-aaf3-8a39740f9f7d"
						data-readdy="true"
						class="flex items-center text-gray-700 hover:text-primary py-2 px-3 hover:bg-gray-50 rounded-md">
							<i class="ri-file-list-3-line mr-3"></i> <span>합격 이력서</span>
					</a></li>
					<li><a href="#"
						class="flex items-center text-primary font-medium py-2 px-3 bg-blue-50 rounded-md">
							<i class="ri-draft-line mr-3"></i> <span>합격 자소서</span>
					</a></li>
					<li><a
						href="https://readdy.ai/home/5ecc45c0-778b-4275-a0c1-0317498ec5c1/066d16ac-8ef1-4e0a-a5ee-561d9d7966d3"
						data-readdy="true"
						class="flex items-center text-gray-700 hover:text-primary py-2 px-3 hover:bg-gray-50 rounded-md">
							<i class="ri-chat-3-line mr-3"></i> <span>면접 후기</span>
					</a></li>
					<li><a href="#"
						class="flex items-center text-gray-700 hover:text-primary py-2 px-3 hover:bg-gray-50 rounded-md">
							<i class="ri-building-line mr-3"></i> <span>기업 리뷰</span>
					</a></li>
				</ul>
			</div>
			인기 이력서
			<div class="bg-white rounded-lg shadow-sm p-5 mb-6">
				<h3 class="text-lg font-bold text-gray-900 mb-4">인기 이력서</h3>
				<ul class="space-y-4">
					<li><a href="#" class="flex items-start"> <span
							class="flex-shrink-0 w-6 h-6 bg-primary text-white rounded-full flex items-center justify-center text-xs font-medium">1</span>
							<div class="ml-3">
								<p class="text-sm font-medium text-gray-900">네이버 - 프론트엔드 개발자</p>
								<p class="text-xs text-gray-500 mt-1">조회 5,124</p>
							</div>
					</a></li>
					<li><a href="#" class="flex items-start"> <span
							class="flex-shrink-0 w-6 h-6 bg-primary text-white rounded-full flex items-center justify-center text-xs font-medium">2</span>
							<div class="ml-3">
								<p class="text-sm font-medium text-gray-900">토스 - 프로덕트 디자이너</p>
								<p class="text-xs text-gray-500 mt-1">조회 4,532</p>
							</div>
					</a></li>
					<li><a href="#" class="flex items-start"> <span
							class="flex-shrink-0 w-6 h-6 bg-primary text-white rounded-full flex items-center justify-center text-xs font-medium">3</span>
							<div class="ml-3">
								<p class="text-sm font-medium text-gray-900">카카오 - 백엔드 개발자</p>
								<p class="text-xs text-gray-500 mt-1">조회 4,123</p>
							</div>
					</a></li>
					<li><a href="#" class="flex items-start"> <span
							class="flex-shrink-0 w-6 h-6 bg-gray-200 text-gray-700 rounded-full flex items-center justify-center text-xs font-medium">4</span>
							<div class="ml-3">
								<p class="text-sm font-medium text-gray-900">현대자동차 - 자율주행
									연구원</p>
								<p class="text-xs text-gray-500 mt-1">조회 3,845</p>
							</div>
					</a></li>
					<li><a href="#" class="flex items-start"> <span
							class="flex-shrink-0 w-6 h-6 bg-gray-200 text-gray-700 rounded-full flex items-center justify-center text-xs font-medium">5</span>
							<div class="ml-3">
								<p class="text-sm font-medium text-gray-900">삼성전자 - 하드웨어
									엔지니어</p>
								<p class="text-xs text-gray-500 mt-1">조회 3,521</p>
							</div>
					</a></li>
				</ul>
			</div> -->
			<!-- 번역 API 정보 -->
			<!-- <div class="bg-white rounded-lg shadow-sm p-5">
				<h3 class="text-lg font-bold text-gray-900 mb-4">번역 기능 안내</h3>
				<div class="text-sm text-gray-700 space-y-3">
					<p>
						<i class="ri-translate-2 text-primary mr-2"></i> DeepL API를 활용한 번역
						기능을 제공합니다.
					</p>
					<p>각 이력서 하단의 번역 아이콘을 클릭하면 원하는 언어로 번역하여 볼 수 있습니다.</p>
					<div class="mt-4">
						<button
							class="w-full bg-primary text-white py-2 px-4 rounded-button text-sm font-medium hover:bg-primary/90 transition-colors whitespace-nowrap">
							번역 기능 더 알아보기</button>
					</div>
				</div>
			</div> -->
		</div>
	</main>
	<script>
document.addEventListener('DOMContentLoaded', function() {
// 드롭다운 토글 함수
function toggleDropdown(dropdownId, optionsId) {
const dropdown = document.getElementById(dropdownId);
const options = document.getElementById(optionsId);
dropdown.addEventListener('click', function() {
options.classList.toggle('hidden');
});
// 외부 클릭 시 드롭다운 닫기
document.addEventListener('click', function(event) {
if (!dropdown.contains(event.target)) {
options.classList.add('hidden');
}
});
// 옵션 선택 시 텍스트 변경
const optionLinks = options.querySelectorAll('a');
optionLinks.forEach(link => {
link.addEventListener('click', function(e) {
e.preventDefault();
dropdown.querySelector('span').textContent = this.textContent;
options.classList.add('hidden');
});
});
}
// 각 드롭다운 초기화
toggleDropdown('industryDropdown', 'industryOptions');
toggleDropdown('jobDropdown', 'jobOptions');
toggleDropdown('careerDropdown', 'careerOptions');
});
</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>