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
  <title>이력서 작성</title>
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  $(document).ready(function(){
/* 	    $("#translatButton").click(function(event){ */
	    $("#translatButton").click(function(){
/* 	      event.preventDefault(); // 기본 폼 제출 막기*/
	      var formData = $('.translateResult').serialize(); 

	      $.ajax({
	        url: "${pageContext.request.contextPath}/resume/translatForm",
	        type: "POST",
	        data: formData,
	        dataType: "text",
/* 	        success: function(response){
	          $("#resultTextArea").val(response);
	        }, */
	        success: function(result){
	        	//alert("성공");
	        	//alert(result);
	        	$("#resultText").text(result);
	        },
	        error: function(xhr, status, error){
	          alert("오류 발생: " + error);
	        }
	      });
	    });
	  });
  </script>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: "#006aff",
            secondary: "#4a90e2"
          },
          borderRadius: {
            button: "8px"
          }
        }
      }
    };
  </script>
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" rel="stylesheet" />
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f5f5f5;
      color: #333;
    }
    .input-field {
      width: 100%;
      padding: 10px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
    }
    .input-field:focus {
      outline: none;
      border-color: #006aff;
      box-shadow: 0 0 0 2px rgba(0, 106, 255, 0.1);
    }
    .input-field::placeholder {
      color: #999;
    }
    .card {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      padding: 24px;
    }
    .save-button {
      display: block;
      width: 100%;
      max-width: 200px;
      margin: 0 auto;
      padding: 12px 24px;
      background-color: #006aff;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      text-align: center;
    }
    
    /* 번역박스부분 */
		@media screen and (max-width: 1024px) {
		  .translator-box {
		    display: none;
		  }
		}
		
		.translator-box {
		  position: fixed;
		  top: 120px;
		  right: max(calc((100vw - 1280px)/2 - 200px), 30px); /* 330px은 박스 너비 + 여유거리 */
		  width: 300px;
		  padding: 15px;
		  background-color: #f4f4f4;
		  border: 1px solid #ccc;
		  border-radius: 10px;
		  box-shadow: 0 0 10px rgba(0,0,0,0.1);
		  font-family: Arial, sans-serif;
		  z-index: 1000;
		}
		
		.translator-box textarea {
		  width: 100%;
		  height: 80px;
		  resize: none;
		  margin-bottom: 10px;
		  font-size: 14px;
		}
		
		.translator-box select,
		.translator-box input[type="submit"] {
		  width: 100%;
		  padding: 8px;
		  margin-bottom: 10px;
		  font-size: 14px;
		}
		
		.translator-box h3 {
		  margin-top: 10px;
		  font-size: 16px;
		}
    
  </style>
</head>
<body>
<header class="sticky top-0 bg-white shadow-sm z-50">
  <!-- <div class="container mx-auto px-4">
    <div class="flex items-center justify-between h-16">
      <div class="flex items-center">
        <a href="#" class="font-['Pacifico'] text-2xl text-primary">Respot</a>
      </div>
      <nav class="hidden md:flex space-x-8">
        <a href="#" class="text-gray-700 hover:text-primary font-medium">채용공고</a>
        <a href="#" class="text-primary font-medium border-b-2 border-primary">이력서</a>
        <a href="#" class="text-gray-700 hover:text-primary font-medium">템플릿</a>
        <a href="#" class="text-gray-700 hover:text-primary font-medium">커리어</a>
        <a href="#" class="text-gray-700 hover:text-primary font-medium">게시판</a>
      </nav>
      <div class="flex items-center space-x-4">
        <button class="w-10 h-10 flex items-center justify-center text-gray-600 hover:text-primary"><i class="ri-search-line ri-lg"></i></button>
        <button class="w-10 h-10 flex items-center justify-center text-gray-600 hover:text-primary"><i class="ri-notification-3-line ri-lg"></i></button>
        <button class="w-10 h-10 flex items-center justify-center text-gray-600 hover:text-primary"><i class="ri-user-line ri-lg"></i></button>
        <button class="hidden md:block bg-primary text-white px-4 py-2 rounded-button whitespace-nowrap">로그인</button>
      </div>
    </div>
  </div> -->
</header>
<main class="container mx-auto px-4 py-8 max-w-5xl">
  <h1 class="text-2xl font-bold mb-6">이력서 작성</h1>
  
  <form action="${pageContext.request.contextPath}/resume/insertResume" method="post">
<!-- 이력서 제목 -->
  <section class="card">
  <h2 class="text-xl font-semibold mb-4">지원 사항</h2>
  <!-- <div class="grid grid-cols-1 md:grid-cols-2 gap-5"> -->
  <div><label class="block mb-1 text-sm">이력서 제목</label><input type="text" class="input-field" name="rstitle" placeholder="문제를 해결하는 개발자, 결과로 말합니다." /></div><br>
  <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
  <div><label class="block mb-1 text-sm">지원 직무</label><input type="text" class="input-field" name="rsapplied" placeholder="기술 개발팀" /></div>
  
  </section>
  
  <!-- 기본 정보 -->
  <section class="card">
    <h2 class="text-xl font-semibold mb-4">기본 정보</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
      <div><label class="block mb-1 text-sm">이름</label><input type="text" class="input-field" name="rsname" placeholder="홍길동" /></div>
      <div><label class="block mb-1 text-sm">휴대폰</label><input type="tel" class="input-field" name="rscontect" placeholder="010-1234-5678" /></div>
      <div><label class="block mb-1 text-sm">이메일</label><input type="email" class="input-field" name="rsemail" placeholder="example@email.com" /></div>
      <div><label class="block mb-1 text-sm">주소</label><input type="text" class="input-field" name="rsadd" placeholder="서울특별시 강남구" /></div>
    </div>
  </section>

  <!-- 경력 -->
  <section class="card">
    <h2 class="text-xl font-semibold mb-4">경력</h2>
    <div class="grid md:grid-cols-2 gap-4 mb-4">
      <div><label class="text-sm font-medium mb-1 block">회사명</label><input type="text" class="input-field" name="rshistory" placeholder="삼성전자" /></div>
      <div><label class="text-sm font-medium mb-1 block">직무</label><input type="text" class="input-field" name="rspart" placeholder="소프트웨어 엔지니어" /></div>
<!--       <div><label class="text-sm font-medium mb-1 block">입사일</label><input type="date" class="input-field" name="rshstart" name="careerStart" /></div> -->
      <div><label class="text-sm font-medium mb-1 block">입사일</label><input type="date" class="input-field" name="rshstart" /></div>
      <div><label class="text-sm font-medium mb-1 block">퇴사일</label><input type="date" class="input-field" name="rshend" /></div>
      <div class="md:col-span-2 flex items-center gap-2">
        <input type="checkbox" id="stillWorking" class="mr-2" onclick="document.querySelector('[name=careerEnd]').disabled = this.checked" name="rshend" />
        <label for="stillWorking" class="text-sm text-gray-600">현재 재직 중</label>
      </div>
    </div>
  </section>

  <!-- 학력 -->
  <section class="card">
    <h2 class="text-xl font-semibold mb-4">학력</h2>
    <div class="grid md:grid-cols-2 gap-4 mb-4">
      <div><label class="text-sm font-medium mb-1 block">학교명</label><input type="text" class="input-field" name="rsedu" placeholder="서울대학교" /></div>
      <div><label class="text-sm font-medium mb-1 block">전공</label><input type="text" class="input-field" name="rsmajor" placeholder="컴퓨터공학과" /></div>
      <!-- <div><label class="text-sm font-medium mb-1 block">입학일</label><input type="date" class="input-field" name="" name="eduStart" /></div> -->
      <div><label class="text-sm font-medium mb-1 block">입학일</label><input type="date" class="input-field" name="rsestart" /></div>
      <div><label class="text-sm font-medium mb-1 block">졸업일</label><input type="date" class="input-field" name="rseend" /></div>
      <div class="md:col-span-2 flex items-center gap-2">
        <input type="checkbox" id="stillStudying" class="mr-2" onclick="document.querySelector('[name=eduEnd]').disabled = this.checked"  />
        <label for="stillStudying" class="text-sm text-gray-600">현재 재학 중</label>
      </div>
    </div>
  </section>

  <!-- 스킬 -->
  <section class="card">
    <h2 class="text-xl font-semibold mb-4">스킬</h2>
    <div class="grid grid-cols-2 gap-3">
      <input type="text" class="input-field" name="rsskname" placeholder="예: Java" />
      <input type="text" class="input-field" name="rsskcontent" placeholder="예: 중급이상" />
    </div>
  </section>
  
  <!-- 수상이력 -->
  <section class="card">
    <h2 class="text-xl font-semibold mb-4">수상이력</h2>
    <div class="grid grid-cols-2 gap-3">
      <input type="text" class="input-field" name="rsawards" placeholder="예: 코딩경진대회 금상" />
      <!-- <input type="text" class="input-field" name="rsskcontent" placeholder="예: 중급이상" /> -->
    </div>
  </section>
`
  <!-- 자기소개서 -->
  <section class="card">
    <h2 class="text-xl font-semibold mb-4">자기소개서</h2>
    <textarea class="input-field" rows="6" name="rscletter" placeholder="자기소개서를 입력하세요..."></textarea>
  </section>

  <div class="mt-8">
    <button class="save-button">저장하기</button>
  </div>
  
  </form>
  
  
<div class="translator-box">
    <form action="translatForm" class="translateResult" method="post">
        <textarea name="sourceText" placeholder="번역할 텍스트 입력">${param.sourceText}</textarea>

        <label for="sourceLang">입력 언어:</label>
        <select name="sourceLang" id="sourceLang">
            <option value="KO" ${param.sourceLang == 'KO' ? 'selected' : ''}>한국어</option>
            <option value="EN" ${param.sourceLang == 'EN' ? 'selected' : ''}>영어</option>
            <option value="JA" ${param.sourceLang == 'JA' ? 'selected' : ''}>일본어</option>
            <option value="DE" ${param.sourceLang == 'DE' ? 'selected' : ''}>독일어</option>
            <option value="FR" ${param.sourceLang == 'FR' ? 'selected' : ''}>프랑스어</option>
            <!-- 필요한 언어 추가 가능 -->
        </select>

        <label for="targetLang">출력 언어:</label>
        <select name="targetLang" id="targetLang">
            <option value="EN" ${param.targetLang == 'EN' ? 'selected' : ''}>영어</option>
            <option value="KO" ${param.targetLang == 'KO' ? 'selected' : ''}>한국어</option>
            <option value="JA" ${param.targetLang == 'JA' ? 'selected' : ''}>일본어</option>
            <option value="DE" ${param.targetLang == 'DE' ? 'selected' : ''}>독일어</option>
            <option value="FR" ${param.targetLang == 'FR' ? 'selected' : ''}>프랑스어</option>
        </select>

<!--         <input type="submit" value="번역하기"/> -->
        <button id="translatButton" type="button" value="번역하기">번역하기</button>
    </form>

        <h3>번역 결과:</h3>
        <%-- <textarea readonly>${translatedText}</textarea> --%>
        <textarea id="resultText" readonly>결과는${translatedText.result}</textarea>
</div>


  
</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>
