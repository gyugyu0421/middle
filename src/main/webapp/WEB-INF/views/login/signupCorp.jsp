<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 <%-- <%@ include file="/WEB-INF/views/common/header.jsp" %>  --%>
<jsp:include page='/WEB-INF/views/common/header.jsp'/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원가입</title>
  <script src="https://cdn.tailwindcss.com"></script>
  
  <!-- 다음 주소 API -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="flex justify-center items-center min-h-screen bg-gray-100">
  <div class="w-full max-w-2xl bg-white p-10 rounded-lg shadow-lg space-y-6">
  <form action="${pageContext.request.contextPath}/signup.do" method="post">
    
      <h2 class="text-2xl font-bold text-center text-blue-600 mb-6">기업 회원가입</h2>

      <input type="hidden" name="type" value="기업" />

	<c:if test="${not empty msg}">
	  <p class="text-sm text-red-600 text-center mb-4">${msg}</p>
	</c:if>
      <!-- 아이디 -->
      <div class="mb-4">
        <label class="block mb-1 font-medium text-gray-700">아이디</label>
        <div class="flex gap-2">
          <input type="text" id="userId" name="id" placeholder="아이디 입력"
                 class="flex-1 px-4 py-2 border rounded-md focus:ring-blue-400 focus:outline-none" />
          <button type="button" onclick="checkDuplicateId()"
                  class="px-3 py-2 bg-gray-200 rounded-md">중복 검사</button>
        </div>
        <p id="idCheckMessage" class="text-sm mt-1"></p>
      </div>

      <!-- 비밀번호 -->
	<div class="mb-4">
	  <label for="pwChk" class="block text-sm font-medium text-gray-700">비밀번호</label>
	  <input type="password" id="pwChk" name="pw"
	         class="mt-1 block w-full border rounded px-3 py-2 shadow-sm"
	         placeholder="비밀번호 입력" required>
	</div>
	
	<!-- 비밀번호 확인 -->
	<div class="mb-2">
	  <label for="pwCheck" class="block text-sm font-medium text-gray-700">비밀번호 확인</label>
	  <input type="password" id="pwCheck" name="pwCheck"
	         class="mt-1 block w-full border rounded px-3 py-2 shadow-sm"
	         placeholder="비밀번호 입력 확인" required>
	         
	</div>

      <!-- 비밀번호 메시지 -->
      <p id="pwMatchMsg" class="text-sm mt-1"></p>


	  <!-- 회사명 -->
      <div class="mb-4">
        <label class="block mb-1 font-medium text-gray-700">회사명</label>
        <input type="text" name="username" placeholder="회사명"
               class="w-full px-4 py-2 border rounded-md focus:ring-blue-400 focus:outline-none" />
      </div>
      
      <!-- 사업자등록번호 -->
      <div class="mb-4">
        <label class="block mb-1 font-medium text-gray-700">사업자등록번호</label>
        <input type="text" name="cnum" placeholder="000-00-00000"
               class="w-full px-4 py-2 border rounded-md focus:ring-blue-400 focus:outline-none" />
      </div>
      
       <!-- 기업규모 -->
      <div class="mb-4">
        <label class="block mb-1 font-medium text-gray-700">기업규모</label>
        <select name="cscale" class="w-full px-4 py-2 border rounded-md focus:ring-blue-400 focus:outline-none">
          <option value="">선택하세요</option>
          <option value="대기업">대기업</option>
          <option value="중견기업">중견기업</option>
          <option value="중소기업">중소기업</option>
          <option value="스타트업">스타트업</option>
        </select>
      </div>
      
      <!-- 이메일 -->
      <div class="mb-4">
        <label class="block mb-1 font-medium text-gray-700">이메일</label>
        <div class="flex gap-2">
          <input type="text" name="emailFront" placeholder="이메일"
                 class="w-1/2 px-4 py-2 border rounded-md focus:ring-blue-400 focus:outline-none" />
          <span class="text-gray-700">@</span>
          <select name="emailBack" class="w-1/2 px-3 py-2 border rounded-md focus:ring-blue-400 focus:outline-none">
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="daum.net">daum.net</option>
            <option value="nate.com">nate.com</option>
            <option value="custom">직접 입력</option>
          </select>
        </div>
      </div>

      <!-- 전화번호 -->
      <div class="mb-4">
        <label class="block mb-1 font-medium text-gray-700">전화번호</label>
        <input type="text" id="phone" name="phone" placeholder="전화번호"
               class="w-full px-4 py-2 border rounded-md focus:ring-blue-400 focus:outline-none" />
      </div>

       <!-- 주소 -->
    <div class="mb-4">
      <label for="madd1" class="block text-sm font-medium text-gray-700">주소</label>
      <div class="flex space-x-2">
        <input type="text" id="madd1" name="madd1" readonly
         	   placeholder="주소 검색"
        	   class="flex-1 px-4 py-2 border rounded-md focus:ring-blue-400 focus:outline-none" />
                 
        <button type="button" id="searchBtn"
                class="px-3 py-2 bg-gray-200 rounded-md">주소 검색</button>
      </div>
      <input type="text" id="madd2" name="madd2"
             placeholder="상세 주소"
             class="mt-2 w-full px-3 py-2 border rounded bg-white">
    </div>

      <!-- 생년월일 -->
      <div class="mb-6">
        <label class="block mb-1 font-medium text-gray-700">생년월일</label>
        <div class="flex gap-2">
          <select name="year" class="w-1/3 px-3 py-2 border rounded-md focus:ring-blue-400 focus:outline-none">
            <option value="">년</option>
            <% for (int y = 2024; y >= 1950; y--) { %>
              <option value="<%= y %>"><%= y %></option>
            <% } %>
          </select>
          <select name="month" class="w-1/3 px-3 py-2 border rounded-md focus:ring-blue-400 focus:outline-none">
            <option value="">월</option>
            <% for (int m = 1; m <= 12; m++) { %>
              <option value="<%= m %>"><%= m %></option>
            <% } %>
          </select>
          <select name="day" class="w-1/3 px-3 py-2 border rounded-md focus:ring-blue-400 focus:outline-none">
            <option value="">일</option>
            <% for (int d = 1; d <= 31; d++) { %>
              <option value="<%= d %>"><%= d %></option>
            <% } %>
          </select>
        </div>
      </div>

      <!-- 가입 버튼 -->
      <button type="submit"
              class="w-full bg-blue-600 text-white font-semibold py-2 rounded-md hover:bg-blue-700">
        가입하기
      </button>
      </form>
    </div>
  

  <!-- 중복 검사 스크립트 -->
  <script>
    const contextPath = '<%= request.getContextPath() %>';

    function checkDuplicateId() {
      const userId = document.getElementById("userId").value.trim();
      const message = document.getElementById("idCheckMessage");

      if (!userId) {
        message.textContent = "아이디를 입력해주세요.";
        message.className = "text-sm text-red-600 mt-1";
        return;
      }

      fetch(contextPath + '/checkId?id=' + encodeURIComponent(userId))
        .then(res => res.text())
        .then(result => {
          if (result === "duplicate") {
            message.textContent = "이미 사용 중인 아이디입니다.";
            message.className = "text-sm text-red-600 mt-1";
          } else if (result === "available") {
            message.textContent = "사용 가능한 아이디입니다.";
            message.className = "text-sm text-green-600 mt-1";
          } else {
            message.textContent = "알 수 없는 응답입니다.";
            message.className = "text-sm text-gray-600 mt-1";
          }
        })
        .catch(() => {
          message.textContent = "서버 오류가 발생했습니다.";
          message.className = "text-sm text-red-600 mt-1";
        });
    }
    
    <!--  비밀번호 확인 -->
      const pw = document.getElementById("pwChk");
      const pwCheck = document.getElementById("pwCheck");
      const msg = document.getElementById("pwMatchMsg");

      pwCheck.addEventListener("blur", () => {
        const pwVal = pw.value.trim();
        const checkVal = pwCheck.value.trim();

        if (pwVal === "" || checkVal === "") {
          msg.textContent = "";
          msg.className = "text-sm mt-1";
          return;
        }

        if (pwVal === checkVal) {
          msg.textContent = "비밀번호가 일치합니다.";
          msg.className = "text-green-600 text-sm mt-1";
        } else {
          msg.textContent = "비밀번호가 일치하지 않습니다.";
          msg.className = "text-red-600 text-sm mt-1";
        }
      });
      </script>  
      
        
       <!-- 사업자등록번호 자동 하이픈 -->
      <script>
    document.addEventListener('DOMContentLoaded', () => {
      const cnumInput = document.querySelector('input[name="cnum"]');
      if (cnumInput) {
        cnumInput.addEventListener('input', function(e) {
          let val = e.target.value.replace(/[^0-9]/g, '');
          if (val.length > 3 && val.length <= 5) {
            val = val.slice(0, 3) + '-' + val.slice(3);
          } else if (val.length > 5) {
            val = val.slice(0, 3) + '-' + val.slice(3, 5) + '-' + val.slice(5, 10);
          }
          e.target.value = val;
        });
      }
    });
  </script>
      
      <!-- 다음 주소 API  -->
      <script>
      document.getElementById('searchBtn').addEventListener('click', function () {
    	    new daum.Postcode({
    	      oncomplete: function (data) {
    	        let addr = '';
    	        if (data.userSelectedType === 'R') {
    	          addr = data.roadAddress;
    	        } else {
    	          addr = data.jibunAddress;
    	        }
    	        document.getElementById('madd1').value = addr;
    	        document.getElementById('madd2').focus();
    	      }
    	    }).open();
    	  });
      
    	</script>
    	

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const pwInput = document.getElementById('pw');
    const pwCheckInput = document.getElementById('pwCheck');
    const pwMsg = document.getElementById('pwMatchMsg');

    pwCheckInput.addEventListener('input', function () {
      const pw = pwInput.value;
      const pwCheck = pwCheckInput.value;

      if (pwCheck === '') {
        pwMsg.textContent = '';
      } else if (pw === pwCheck) {
        pwMsg.textContent = '비밀번호가 일치합니다';
        pwMsg.classList.remove('text-red-500');
        pwMsg.classList.add('text-green-500');
      } else {
        pwMsg.textContent = '비밀번호가 일치하지 않습니다';
        pwMsg.classList.remove('text-green-500');
        pwMsg.classList.add('text-red-500');
      }
    });
  });
</script>

<script>
document.addEventListener('DOMContentLoaded', function () {
  const phoneInput = document.getElementById('phone');

  phoneInput.addEventListener('input', function (e) {
    let num = e.target.value.replace(/[^0-9]/g, ''); // 숫자만

    if (num.length > 11) {
      num = num.slice(0, 11);
    }

    if (num.length < 4) {
      e.target.value = num;
    } else if (num.length < 8) {
      e.target.value = num.replace(/(\d{3})(\d+)/, '$1-$2');
    } else {
      e.target.value = num.replace(/(\d{3})(\d{4})(\d+)/, '$1-$2-$3');
    }
  });
});
</script>

</body>
</html>