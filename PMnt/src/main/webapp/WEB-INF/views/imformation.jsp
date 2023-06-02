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
<!-- <script type = "text/javascript">
function goUpdate(userBno){
	
	// 수정 내용을 담은 textarea(value)을 가져옴
	var newImformation= $("#nc"+idx).val();
	
	$.ajax({
		
		url : "${cpath}/board",
		type : "put",
		data : JSON.stringify({"idx":idx, "content" : newContent}), // 보내줄 데이터를 json형식으로
		contentType : "application/json;charset=utf-8",
		success : boardList,
		error : function(){
			alert("글쓰기 수정 통신 실패...");
		}
		
	}) // update문 끝태그

</script> -->
	<body>
	    <div class="container">
	        <header>마이페이지</header>
	
	        <form action="#">
	            <div class="first">
	                <div class="command">
	                    <span class="title">회원정보수정</span>
	
	                    <div class="fields">
	                        <input type="text" placeholder="사업자 등록번호를 입력해 주세요" required />
	                        <input type="password" placeholder="변경할 비밀번호를 입력해 주세요" required />
	                        <!-- <input type="password" placeholder="비밀번호를 다시 한번 입력해주세요" required /> -->
	                        <input type="text" placeholder="이름을 입력해주세요" required />
	                        <input type="text" placeholder="회사명을 입력해주세요" required />
	                        <input type="text" placeholder="사업장 주소 입력해 주세요" required />
	                        <input type="text" placeholder="E-mail을 입력해 주세요" required />
	                        <div class="input_field">
	                            <input type="submit" value="수정" class="btn">
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