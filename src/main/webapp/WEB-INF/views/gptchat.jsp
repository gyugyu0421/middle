<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page import="java.io.*, java.net.*, org.json.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>GPT 챗봇</title>

<!-- jQuery:  Ajax 전환 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 40px;
	max-width: 640px;
	margin-left: auto;
	margin-right: auto;
}

textarea, input[type="text"] {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

textarea {
	height: 120px;
	resize: none;
	margin-bottom: 15px;
}

button {
	margin-top: 10px;
	padding: 10px 20px;
	background-color: #4a90e2;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}
</style>
</head>
<body>

	<h2>UI 및 서비스 아키텍쳐</h2>

	<!-- 질문 입력 폼 -->
	<form method="get">
		<input type="text" name="question" id="question"
			placeholder="질의어를 입력하세요" required /> <input type="button" id="btn"
			value="보내기" />
	</form>

	<!-- 응답 출력창 -->
	<textarea id="response" readonly placeholder="GPT 응답이 여기에 표시됩니다."></textarea>


	<script type="text/javascript">
 
 const messages = [
	  { role: 'system', content: 'You are a helpful assistant.' }
	];
 
 $(function() {
// ajax 이용 질문 보내고 답변 받는 함수
 function requestAI(request){
	
	 // 1. 사용자의 질문을 messages 배열에 추가
	 messages.push({'role':'user','content':request});
	 
	// 2. OpenAI GPT API로 AJAX POST 요청
	  $.ajax({
	    type: 'post',  // HTTP POST 방식으로 전송
	    url: 'https://api.openai.com/v1/chat/completions',  // GPT API 주소

	    // 3. 전송할 데이터 (JSON 형식으로 변환)
	    data: JSON.stringify({
	      model: 'gpt-3.5-turbo',   // 사용할 GPT 모델
	      messages: messages        // 시스템/사용자 메시지 포함
	    }),

	    // 4. 요청 헤더 설정 (인증 키와 JSON 포맷)
	    headers: {
	      'Authorization': 'Bearer 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',
	      'Content-Type': 'application/json'  // 보내는 데이터는 JSON
	    }
		
	    //ajax 성공시
	    ,success:function(result){
	    	console.log(result);
	    	// 받아오는 값에서 content만 뽑아서 변수에 담기
	    	var res = result.choices[0].message.content;
	    	messages.push({'role':'assistant', 'content':res});
	    	
	    	// 응답 content값 출력
	    	$('#response').val(res);
	    	//입력 창 비우기
	    	$('#question').val('');
	    }
	    ,error:function(err){
	    	console.log(err)
	    	}
	  })
}
	//엔터키 눌렀을 때 보내기 클릭시로
 	$('#question').keypress(function(event){
 		 if(event.key === 'Enter'){
 			$('#btn').click(); 
 		 }
 	})
 	
 	//보내기 버튼 클릭 시 ajax
 	$('#btn').click(function(){
 		//입력창의 value를 변수로 지정(user 질문)
 		let question = $('#question').val();
 		let result = requestAI(question);
 	
 });
	
});
 
 
 </script>

</body>
</html>