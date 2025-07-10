<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Respot 관리자 | 개인정보 수정</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
  <div class="max-w-3xl mx-auto bg-white p-8 rounded shadow">
    <h2 class="text-2xl font-bold mb-6">개인정보 수정</h2>

    <!-- 프로필 이미지 -->
    <div class="flex items-center gap-4 mb-8">
      <div class="relative w-20 h-20 rounded-full bg-gray-200 overflow-hidden">
        <img src="https://via.placeholder.com/80" alt="프로필 사진">
      </div>
      <button class="bg-blue-500 text-white text-sm px-3 py-1 rounded">변경</button>
    </div>

    <!-- 기본정보 -->
    <div class="border p-6 rounded mb-6 space-y-4">
      <h3 class="font-semibold text-lg mb-2">기본정보</h3>

      <div class="flex items-center gap-4">
        <label class="w-24">이름</label>
        <input type="text" class="flex-1 border rounded px-3 py-2" value="${member.username}" />
        <button class="text-sm border px-3 py-2 rounded">수정</button>
      </div>

      <div class="flex items-center gap-4">
        <label class="w-24">생년월일</label>
        <select id="year" class="border rounded px-2 py-2">
          <option disabled selected>년도</option>
        </select>
        <select id="month" class="border rounded px-2 py-2">
          <option disabled selected>월</option>
          <!-- 01~12 -->
			<script>
			  for(let i=1; i<=12; i++){
			    let val = String(i).padStart(2,'0');
			    document.write('<option value="' + val + '">' + val + '</option>');
			  }
			</script>
        </select>
        <select id="day" class="border rounded px-2 py-2">
          <option disabled selected>일</option>
          <!-- 01~31 -->
				<script>
				  for(let i=1; i<=31; i++){
				    let val = String(i).padStart(2,'0');
				    document.write('<option value="' + val + '">' + val + '</option>');
				  }
				</script>
        </select>
        <button class="text-sm border px-3 py-2 rounded">수정</button>
      </div>


    <!-- 연락처 정보 -->
    <div class="border p-6 rounded space-y-4">
      <h3 class="font-semibold text-lg mb-2">연락처 정보</h3>

      <div class="flex items-center gap-4">
        <label class="w-24">휴대폰</label>
        <input type="text" class="flex-1 border rounded px-3 py-2" value="${member.phone}" />
        <button class="text-sm border px-3 py-2 rounded">수정</button>
      </div>

      <div class="flex items-center gap-4">
        <label class="w-24">이메일</label>
        <input type="email" class="flex-1 border rounded px-3 py-2" value="${member.email}" />
        <button class="text-sm border px-3 py-2 rounded">수정</button>
      </div>

      <div class="flex items-center gap-4">
        <label class="w-24">주소</label>
        <div class="flex-1 space-y-2">
          <input type="text" class="w-full border rounded px-3 py-2" value="${member.mAdd1}" />
          <input type="text" class="w-full border rounded px-3 py-2" value="${member.mAdd2}" />
        </div>
        <button class="text-sm border px-3 py-2 rounded self-start">수정</button>
      </div>
    </div>

    <!-- 하단 버튼 -->
    <div class="mt-6 flex justify-between">
      <button onclick="window.history.back()" class="text-gray-600 border border-gray-300 px-4 py-2 rounded hover:bg-gray-100">
        ← 뒤로 가기
      </button>
      <button class="text-red-500 text-sm hover:underline">회원 탈퇴</button>
    </div>
  </div>

  <!-- 년도 자동 생성 스크립트 -->
  <script>
    const yearSelect = document.getElementById('year');
    for (let y = 1900; y <= 2025; y++) {
      const option = document.createElement('option');
      option.value = y;
      option.textContent = y;
      yearSelect.appendChild(option);
    }
  </script>
</body>
</html>