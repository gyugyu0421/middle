<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>신고 상세 페이지</title>
</head>
<body>

<h2>신고 상세 정보</h2>

<table border="1">
    <tr><th>신고 번호</th><td>${report.reportId}</td></tr>
    <tr><th>게시판 유형</th><td>${report.boardType}</td></tr>
    <tr><th>게시글 번호</th><td>${report.boardId}</td></tr>
    <tr><th>신고자 회원번호</th><td>${report.reporterMkey}</td></tr>
    <tr><th>신고 사유</th><td>${report.reason}</td></tr>
    <tr><th>신고 날짜</th><td>${report.reportDate}</td></tr>
    <tr><th>처리 상태</th><td>${report.status}</td></tr>
</table>

<hr>

<h2>신고 대상 게시글 상세</h2>

<c:choose>
    <c:when test="${report.boardType eq 'freeboard'}">
        <h3>자유게시판 글 상세</h3>
        <table border="1">
            <tr><th>제목</th><td>${reportedPost.freeboard.fbtitle}</td></tr>
            <tr><th>작성자</th><td>${reportedPost.freeboard.username}</td></tr>
            <tr><th>내용</th><td>${reportedPost.freeboard.fbcontent}</td></tr>
            <tr><th>작성일</th><td>${reportedPost.freeboard.fbdate}</td></tr>
        </table>
    </c:when>
    <c:when test="${report.boardType eq 'recruitment'}">
        <h3>채용공고 글 상세</h3>
        <table border="1">
            <tr><th>제목</th><td>${reportedPost.recruitment.rctitle}</td></tr>
            <tr><th>기업명</th><td>${reportedPost.recruitment.username}</td></tr>
            <tr><th>내용</th><td>${reportedPost.recruitment.rccontent}</td></tr>
            <tr><th>등록일</th><td>${reportedPost.recruitment.regdate}</td></tr>
        </table>
    </c:when>
    <c:otherwise>
        <p>신고 대상 게시글 정보를 불러올 수 없습니다.</p>
    </c:otherwise>
</c:choose>

<hr>

<!-- 처리 상태 변경 폼 (필요하면 추가 가능) -->
<form action="/report/updateStatus" method="post">
    <input type="hidden" name="reportId" value="${report.reportId}">
    <label for="status">처리 상태:</label>
    <select name="status" id="status">
<option value="처리대기" <c:if test="${report.status eq '처리대기'}">selected="selected"</c:if>>처리대기</option>
<option value="처리중" <c:if test="${report.status eq '처리중'}">selected="selected"</c:if>>처리중</option>
<option value="처리완료" <c:if test="${report.status eq '처리완료'}">selected="selected"</c:if>>처리완료</option>
    </select>
    <button type="submit">상태 변경</button>
</form>

<br>
<a href="/reportList">목록으로 돌아가기</a>

</body>
</html>