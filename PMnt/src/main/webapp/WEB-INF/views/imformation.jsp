<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value = "${pageContext.request.contextPath}"></c:set>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/imformation.css">
    
</head>

	<body>
	
	<script type = "text/javascript">
		function insertFn(userBno){
				
				// form태그에 있는 정보를 가지고 옴(title, content, writer)
				// var title = $("#title").val(); 반복하기 힘들기 때문에....
				// .serialize() 통해서 form 태그에 담긴 내용 다 가져올수 있음
				var Fdata = $("#imporUpdate").serialize(); // 직렬화 함수
				console.log(Fdata);
				
				// Ajax 활용
				$.ajax({
					url : "${cpath}/impormatoin",
					type : "post",
					data : Fdata,
					// dataType 가져올 데이터 없음
					success : boardList, // DB에 있는 값을 가져올 boardList() 함수 실행
					error : function(){
						alert("회원정보수정 실패")
					}
					
				}); // ajax 끝
		}
	</script>
	    <div class="container">
	        <header>마이페이지</header>
	
	        <form action="#" >
	            <div class="first">
	                <div class="command">
	                    <span class="title">회원정보수정</span>
	
	                    <div class="fields">
	                        <input type="text" name = "userBno" placeholder="사업자 등록번호를 입력해 주세요" required />
	                        <input type="password" name="userPw" placeholder="변경할 비밀번호를 입력해 주세요" required />
	                        <!-- <input type="password" placeholder="비밀번호를 다시 한번 입력해주세요" required /> -->
	                        <input type="text" name ="userName" placeholder="이름을 입력해주세요" required />
	                        <input type="text" name ="usercompany" placeholder="회사명을 입력해주세요" required />
	                        <input type="text" name = "userAddr" placeholder="사업장 주소 입력해 주세요" required />
	                        <input type="text" name = "userEmail"placeholder="E-mail을 입력해 주세요" required />
	                        <div class="input_field">
	                            <input id = "imporUpdate" type="submit" value="수정" class="btn">
	                            <span>&nbsp;&nbsp;</span>
	                            <input type="reset" value="취소" class="btn">
	                            <span>&nbsp;&nbsp;</span>
	                            <input type="submit" value="탈퇴" class="btn">
	                        </div>
	                    </div>
	                    
	                </div>
	            </div>
	      
	        </form>
	    </div>
    
	</body>
</html>