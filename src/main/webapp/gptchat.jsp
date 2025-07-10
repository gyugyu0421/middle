<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.io.*, java.net.*, org.json.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>GPT 챗봇</title>

  <!-- jQuery: 추후 Ajax 전환용 (현재는 사용 안 함) -->
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
  <input type="text" name="q" placeholder="질의어를 입력하세요" required />
  <button type="submit">질문</button>
</form>

<!-- 응답 영역 -->
<%
  // 사용자가 입력한 질문 가져오기
  String q = request.getParameter("q");

  // 질문이 null이 아니고 공백이 아니면 처리 시작
  if (q != null && !q.trim().isEmpty()) {

    // OpenAI API 키 설정 (주의: 운영 시 외부 환경변수 사용 권장)
    String apiKey = "Bearer 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";

    try {
        // GPT API 연결 설정
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", apiKey);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        // JSON 요청 구성: 메시지 생성
        JSONObject msg = new JSONObject();
        msg.put("role", "user");
        msg.put("content", q);

        JSONArray msgArr = new JSONArray();
        msgArr.put(msg);

        JSONObject req = new JSONObject();
        req.put("model", "gpt-3.5-turbo");
        req.put("messages", msgArr);

        String body = req.toString();  // JSON 문자열 완성

        // 전송
        OutputStream os = conn.getOutputStream();
        os.write(body.getBytes("utf-8"));
        os.close();

        // ＨＴＴＰ 응답 받기
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        StringBuilder buffer = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line.trim());
        }
        reader.close();

        // 응답 파싱
        JSONObject res = new JSONObject(buffer.toString());
        String answer = res.getJSONArray("choices")
                           .getJSONObject(0)
                           .getJSONObject("message")
                           .getString("content");

%>

<!-- 출력 -->
<h3>GPT 응답:</h3>
<textarea readonly><%= answer %></textarea>

<%
    } catch (Exception e) {
%>
  <p style="color:red;">❌ 오류 발생: <%= e.getMessage() %></p>
<%
    }
  }
%>

</body>
</html>