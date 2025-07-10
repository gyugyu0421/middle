<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="google_translate_element"></div>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
	function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'ko',autoDisplay: false}, 'google_translate_element');}
</script>
<a href='adminlogin'>관리자페이지 시작</a><hr/>
<a href='index'>시작</a><hr/>
<a href='main_recru'>메인</a><hr/>
<a href='koreaRecruit/koreaRecruit_List'>국내채용공고 리스트</a><hr/>
<a href='koreaRecruit/koreaRecruit_Write'>국내채용공고 작성</a><hr/>
<a href='koreaRecruit/koreaRecruit_View'>국내채용공고 게시글 상세</a><hr/>
<a href='overseaRecruit/overseaRecruit_List'>해외채용공고 리스트</a><hr/>
<a href='overseaRecruit/overseaRecruit_Write'>해외채용공고 작성</a><hr/>
<a href='overseaRecruit/overseaRecruit_View'>해외채용공고 게시글 상세</a><hr/>
<a href='resume/resume_Write'>이력서 작성</a><hr/>
<!-- <a href='resume/resume_List'>이력서 템플릿 리스트</a><hr/> -->
<a href="${pageContext.request.contextPath}/user/qna/list">Qna 페이지 보기</a><hr/>
<a href="${pageContext.request.contextPath}/free/list">자유게시판 바로가기</a><hr/>
<a href="${pageContext.request.contextPath}/main">메인 페이지 보기</a><hr/>
<a href="resume/resume_Mylist">이력서 리스트 페이지</a><hr/>
<a href="resume/resume_View">이력서 보기</a>
<a href="${pageContext.request.contextPath}/template/teamplatelist">탬플릿 페이지 보기</a><hr/>
<a href="${pageContext.request.contextPath}/gptchat">gptchat jsp바로가기</a> <hr/>

<a href="${pageContext.request.contextPath}/openai">openai</a>
<!-- 
kimjiwon                                                                                                                                  
password3

123
123

corp01
pass01
-->



</body>
</html>