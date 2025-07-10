<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/header.jsp" %>

<!-- <!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Respot - 채용 및 커리어 플랫폼</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: { primary: "#3b82f6", secondary: "#64748b" },
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
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"
    />
    <style>
      :where([class^="ri-"])::before { content: "\f3c2"; }
      body {
      font-family: 'Noto Sans KR', sans-serif;
      }
      .dropdown {
      display: none;
      }
      .dropdown-trigger:hover .dropdown {
      display: block;
      }
      .hero-section {
      background-image: url('https://readdy.ai/api/search-image?query=professional%20modern%20office%20environment%20with%20diverse%20people%20working%20on%20computers%2C%20bright%20and%20airy%20workspace%20with%20large%20windows%2C%20natural%20light%2C%20minimal%20design%2C%20soft%20colors%2C%20career%20and%20job%20search%20concept%2C%20high-quality%20professional%20photography&width=1920&height=600&seq=1&orientation=landscape');
      background-size: cover;
      background-position: center;
      }
      .hero-overlay {
      background: linear-gradient(90deg, rgba(255,255,255,0.95) 0%, rgba(255,255,255,0.9) 50%, rgba(255,255,255,0.5) 100%);
      }
      .continent-tab.active {
      color: #3b82f6;
      border-bottom: 2px solid #3b82f6;
      }
      .continent-content {
      display: none;
      }
      .continent-content.active {
      display: grid;
      }
    </style>
  </head> -->
  <body class="bg-gray-100 min-h-screen">

    <div class="max-w-2xl mx-auto mt-10 bg-white p-8 rounded shadow">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">1:1 문의 작성</h2>

        <form action="${pageContext.request.contextPath}/user/qna/write" method="post">
            <div class="mb-4">
                <label for="qnatitle" class="block text-sm font-medium text-gray-700 mb-1">제목</label>
                <input type="text" id="qnatitle" name="qnatitle" required
                       class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary">
            </div>

            <div class="mb-4">
                <label for="qnacontents" class="block text-sm font-medium text-gray-700 mb-1">내용</label>
                <textarea id="qnacontents" name="qnacontents" rows="8" required
                          class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary resize-none"></textarea>
            </div>

            <div class="flex justify-end">
                <a href="${pageContext.request.contextPath}/qna/list"
                   class="px-6 py-2 border border-gray-300 rounded text-gray-700 bg-white hover:bg-gray-50 mr-3">
                   취소
                </a>
                <button type="submit"
                        class="px-6 py-2 bg-primary text-white rounded hover:bg-opacity-90">
                    제출하기
                </button>
            </div>
        </form>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>