<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>네이버 합격 이력서 - Respot</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: { primary: '#4F46E5' },
          borderRadius: { button: '8px' }
        }
      }
    }
  </script>
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" rel="stylesheet" />
  <style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #f9fafb; }
  </style>
</head>
<body>


<!-- <!-- 본문 -->
<main class="max-w-4xl mx-auto px-4 pt-28 pb-16">

<!--   <div class="text-sm text-gray-500 mb-4">
    <a href="#" class="hover:text-primary">커리어</a>
    <span class="mx-2">&gt;</span>
    <a href="#" class="hover:text-primary">합격 이력서</a>
    <span class="mx-2">&gt;</span>
    <span class="text-gray-700">네이버 - 프론트엔드 개발자</span>
  </div> -->

  <!-- 제목 및 요약 -->
  <h1 class="text-2xl font-bold text-gray-900 mb-1">${resumeView.rstitle}</h1>
  <p class="text-sm text-gray-500 mb-6">지원직무:${resumeView.rsapplied}</p>

  <!-- 이력서 정보 -->
  <h2 class="font-bold">기본 정보</h2><br>
  <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-8">
  <!-- <h2 class="text-2xl font-bold text-gray-700 ">기본 정보</h2> -->
  
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">이름</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsname}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">휴대폰</h2>
      <p class="text-gray-800 font-medium">${resumeView.rscontect}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">이메일</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsemail}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">주소</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsadd}</p>
    </div>
  </div>
  
  	<h2 class="font-bold">경력</h2><br>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-8">
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">회사명</h2>
      <p class="text-gray-800 font-medium">${resumeView.rshistory}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">직무</h2>
      <p class="text-gray-800 font-medium">${resumeView.rspart}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">입사일</h2>
      <p class="text-gray-800 font-medium">${resumeView.rshstart}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">퇴사일</h2>
      <p class="text-gray-800 font-medium">${resumeView.rshend}</p>
    </div>
  </div>
  
   <h2 class="font-bold">최종 학력</h2><br>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-8">
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">학교명</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsedu}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">전공</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsmajor}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">입학일</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsestart}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">졸업일</h2>
      <p class="text-gray-800 font-medium">${resumeView.rseend}</p>
    </div>
  </div>
  
     <h2 class="font-bold">최종 학력</h2><br>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-8">
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">스킬</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsskname}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">상세</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsskcontent}</p>
    </div>
    <div class="bg-white p-4 rounded-lg shadow-sm">
      <h2 class="text-sm text-gray-500 mb-1">수상이력</h2>
      <p class="text-gray-800 font-medium">${resumeView.rsawards}</p>
    </div>

  </div>

  <!-- 이력서 요약 -->
  <section class="bg-white p-6 rounded-lg shadow-sm">
    <h2 class="text-lg font-semibold mb-4 text-gray-900">자기소개서</h2>
    <p class="text-gray-700 leading-relaxed">
      ${resumeView.rscletter}
    </p>
  </section>

  <!-- 기술 스택 및 성과 -->
<!--   <section class="bg-white p-6 rounded-lg shadow-sm mt-8">
    <h2 class="text-lg font-semibold mb-4 text-gray-900">주요 기술 스택</h2>
    <ul class="list-disc list-inside text-gray-700 space-y-2">
      <li>React, TypeScript, Next.js, Tailwind CSS</li>
      <li>Redux Toolkit, Zustand, Recoil 등 상태 관리</li>
      <li>CI/CD, GitHub Actions, Vercel 배포 경험</li>
    </ul>

    <h2 class="text-lg font-semibold mt-6 mb-4 text-gray-900">주요 프로젝트 및 성과</h2>
    <ul class="list-disc list-inside text-gray-700 space-y-2">
      <li>실사용자 50만 명 규모의 뉴스 플랫폼 리뉴얼 프로젝트 참여</li>
      <li>초기 로딩 속도 40% 개선 (코드 스플리팅 및 Lazy Loading 도입)</li>
      <li>구글 Lighthouse 점수 20점 이상 향상</li>
    </ul>
  </section> -->

  <!-- 다운로드 버튼 -->
<!--   <div class="flex justify-end mt-6">
    <button onclick="alert('PDF 다운로드는 준비 중입니다.')" class="bg-primary text-white px-6 py-2 rounded-button hover:bg-opacity-90 flex items-center gap-2">
      <i class="ri-download-2-line"></i> 이력서 PDF 다운로드
    </button>
  </div> -->


  
</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
