<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/loginpage.css">
</head>
<body>
    <section class="wrapper">
        <div class="login">
            <header>로그인</header>
            <form action="/login.do" method="post" class="loginform">
                    <input type="text" name="userBno" placeholder="사업자 등록번호를 입력해 주세요" required />
                    <input type="password" name="userPw" placeholder="비밀번호를 입력해 주세요" required />
                    <a href="#">비밀번호 찾기</a>
                    <div class="input_field">
                        <input type="submit" value="로그인" class="btn">
                    </div>
            </form>
        </div>
        
        <div class="sign">
            <header>회원 가입</header>
            <form action="/signup.do" method="post" class="signform">
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