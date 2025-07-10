<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../common/header.jsp" %>

    <div class="max-w-2xl mx-auto mt-10 bg-white p-8 rounded shadow">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">1:1 문의 수정</h2>

        <form action="${pageContext.request.contextPath}/qna/edit" method="post">
            <!-- 수정 대상 글의 고유번호 -->
            <input type="hidden" name="qnakey" value="${qna.qnakey}" />

            <div class="mb-4">
                <label for="qnatitle" class="block text-sm font-medium text-gray-700 mb-1">제목</label>
                <input type="text" id="qnatitle" name="qnatitle" required
                       value="${qna.qnatitle}"
                       class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary">
            </div>

            <div class="mb-4">
                <label for="qnacontents" class="block text-sm font-medium text-gray-700 mb-1">내용</label>
                <textarea id="qnacontents" name="qnacontents" rows="8" required
                          class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-primary resize-none">${qna.qnacontents}</textarea>
            </div>

            <div class="flex justify-end">
                <a href="${pageContext.request.contextPath}/qna/view/${qna.qnakey}"
                   class="px-6 py-2 border border-gray-300 rounded text-gray-700 bg-white hover:bg-gray-50 mr-3">
                   취소
                </a>
                <button type="submit"
                        class="px-6 py-2 bg-primary text-white rounded hover:bg-opacity-90">
                    수정 완료
                </button>
            </div>
        </form>
    </div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>