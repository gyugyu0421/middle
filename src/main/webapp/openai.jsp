<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.io.*, java.net.*, org.json.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>텍스트 챗봇</title>
  
  <!-- jQuery 라이브러리 불러오기 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      margin: 40px;
    }

    textarea, input[type="text"] {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      margin-top: 10px;
      padding: 8px 15px;
      background-color: #4a90e2;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
  </style>
</head>
<body>


<h2>UI 및 서비스 아키텍쳐</h2>


  <textarea rows="10" placeholder="챗봇 상담원입니다." id="response" readonly></textarea>

	<input type="text" name="question" id = "question" placeholder="질의어를 입력하세요" required />
	  
  <input type="button" value="보내기" id='btn' />



<script type="text/javascript">

$(function(){
	
	$('#btn').click(function(){
		
		// request에 question 넣기
		var request = $('#question').val();
		
		$.ajax({
			type : "get"
			,url : "http://127.0.0.1:5000"	// Flask 서버 주소
			,data :{question:request }	//key는 question,  values는 입력값
			,dataType: "text"
			,contentType: "application/x-www-form-urlencoded; charset=UTF-8"//전송 데이터 형식
			,success:function(result){		 // 요청 성공 시 실행
				$('#response').val(result)	// 답변 출력
				$('#question').val('')	// 질문 입력창 초기화
				
			}
			,error: function(error){
				console.log(error)
			}
		})
	})
})

</script>
</body>
</html>