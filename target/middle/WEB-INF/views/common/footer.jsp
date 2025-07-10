<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 푸터 -->
    <footer class="bg-gray-800 text-white pt-12 pb-6">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
          <div>
            <a href="#" class="font-['Pacifico'] text-2xl mb-4 inline-block">
              <span class="text-primary">Re</span
              ><span class="text-white">spot</span>
            </a>
            <p class="text-gray-300 text-sm mb-4">
              Respot은 전 세계 구직자들이 더 나은 커리어를 찾을 수 있도록 돕는
              글로벌 채용 플랫폼입니다.
            </p>
            <!-- <div class="flex space-x-4">
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-facebook-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-twitter-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-linkedin-fill"></i>
              </a>
              <a
                href="#"
                class="text-gray-300 hover:text-white w-8 h-8 flex items-center justify-center rounded-full hover:bg-gray-700"
              >
                <i class="ri-instagram-fill"></i>
              </a>
            </div> -->
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">서비스</h3>
            <ul class="space-y-2 text-gray-300 text-sm">
              <li><a href="${pageContext.request.contextPath}/koreaRecruit/koreaRecruit_List" class="hover:text-primary">국내채용공고</a></li>
              <li><a href="${pageContext.request.contextPath}/overseaRecruit/overseaRecruit_List" class="hover:text-primary">해외채용공고</a></li>
              <li><a href="${pageContext.request.contextPath}/resume/resume_Write" class="hover:text-primary">이력서 작성</a></li>
              <li><a href="${pageContext.request.contextPath}/template/templatelist" class="hover:text-primary">이력서 템플릿</a></li>
              <!-- <li>
                <a href="#" class="hover:text-primary">합격 자기소개서</a>
              </li>
              <li><a href="#" class="hover:text-primary">면접 후기</a></li> -->
              <li><a href="${pageContext.request.contextPath}/chat" class="hover:text-primary">자주 묻는 질문(FAQ)</a></li>

            </ul>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">회사 정보</h3>
            <ul class="space-y-2 text-gray-300 text-sm">
              <li><a href="#" class="hover:text-primary">회사 소개</a></li>
              <li><a href="#" class="hover:text-primary">이용약관</a></li>
              <li>
                <a href="#" class="hover:text-primary">개인정보처리방침</a>
              </li>
              <li><a href="#" class="hover:text-primary">채용 정보</a></li>
              <li><a href="#" class="hover:text-primary">제휴 문의</a></li>
            </ul>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-4">고객센터</h3>
            <p class="text-gray-300 text-sm mb-2">
              평일 09:00 - 18:00 (주말, 공휴일 휴무)
            </p>
            <p class="text-white font-medium mb-4">1588-1234</p>
            <a
              href="#"
              class="bg-primary text-white px-4 py-2 rounded-button text-sm font-medium hover:bg-blue-600 transition-colors inline-block whitespace-nowrap"
              >1:1 문의하기</a
            >
          </div>
        </div>
        <div
          class="border-t border-gray-700 pt-6 flex flex-col md:flex-row justify-between items-center"
        >
          <p class="text-gray-400 text-sm mb-4 md:mb-0">
            © 2025 Respot. All rights reserved.
          </p>
          <div class="flex items-center space-x-4">
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-visa-fill mr-1 text-lg"></i> Visa
            </span>
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-mastercard-fill mr-1 text-lg"></i> Mastercard
            </span>
            <span class="text-gray-400 text-sm flex items-center">
              <i class="ri-paypal-fill mr-1 text-lg"></i> PayPal
            </span>
          </div>
        </div>
      </div>
    </footer>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // 대륙 탭 전환 기능
        const continentTabs = document.querySelectorAll(".continent-tab");
        const continentContents = document.querySelectorAll(".continent-content");
        continentTabs.forEach((tab) => {
          tab.addEventListener("click", () => {
            // 활성 탭 스타일 변경
            continentTabs.forEach((t) => t.classList.remove("active"));
            tab.classList.add("active");
            // 해당 콘텐츠 표시
            const targetContinent = tab.getAttribute("data-continent");
            continentContents.forEach((content) => {
              content.classList.remove("active");
              if (content.id === targetContinent) {
                content.classList.add("active");
              }
            });
          });
        });
      });
    </script>

</body>
</html>