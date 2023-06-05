<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="cpath" value = "${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/loginpage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <section class="wrapper">
        <div class="login">
            <header>로그인</header>
            <c:choose>
            	<c:when test="${empty loginuser}">
            <form action="${cpath}/loginu.do" method="post" class="loginform">
            <!-- <form action="/loginu.do" method="post" class="loginform"> -->
                    <input type="text" name="userbno" id="userbno"  placeholder="사업자 등록번호를 입력해 주세요" required />
                    <input type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력해 주세요" required />
                    <a href="#">비밀번호 찾기</a>
                    <div class="input_field">
                        <input type="submit" value="로그인" class="btn">
                    </div>
            </form>
            </c:when>
            </c:choose>
        </div>
        
        <div class="sign">
            <header>회원 가입</header>
            <form action="#" class="signform">
                    <input type="text"  name="userBno" placeholder="사업자 등록번호를 입력해 주세요" required />
                    <input type="password" name="userPw" placeholder="비밀번호를 입력해 주세요" required />
                    <input type="text" name="userName" placeholder="이름을 입력해주세요" required />
                    <input type="text" name="userCompany" placeholder="회사명을 입력해주세요" required />
                    <input type="text" name="userAddr" placeholder="사업장 주소 입력해 주세요" required />
                    <input type="text" name="userEmail" placeholder="E-mail을 입력해 주세요" required />
                    <div class="input_field">
                        <input type="submit" value="등록" class="btn">
                        <span>&nbsp;&nbsp;</span>
                        <input type="button" value="취소" class="btn">
                    </div>
            </form>
        </div>
    </section>
<script src="resources/js/loginpage.js"></script>
</body>
</html>