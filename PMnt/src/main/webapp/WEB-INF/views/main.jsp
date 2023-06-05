<%@page import="kr.smhrd.PMnt.entity.ProUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="cpath" value = "${pageContext.request.contextPath}"></c:set>
<%
ProUser user = (ProUser) session.getAttribute("loginuser");
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Admin Dashboard | Korsat X Parmaga</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="resources/css/style.css">
</head>

<body>
<script>
	$(document).ready(function(){
		// productlist() 함수 호출
		productlist();
		
	}); // 제일 먼저 실행되는 함수
	
	function productlist(){
		
		// ajax통신으로 요청 주고 받기
		
		$.ajax({
			url : "${cpath}/product.do",
			type : "get",
			// data : 보내줄 데이터 없음
			dataType : "json",
			success : trueproduct,
			error : function(){
				alert("akax통신 실패!!");
			
			} //function() 함수 끝
			
		}); // productlist() 함수 끝
		
		// 리스트를 가지고 오는 function문
		function trueproduct(data){
			console.log(data);
			
			var prolist = ''
		}
		
		
	}
	
</script>
    <!-- =============== Navigation ================ -->
    <div class="container">
        <input type="radio" id="tab-1" name="show" checked/>
        <input type="radio" id="tab-2" name="show" />
        <input type="radio" id="tab-3" name="show" />
        <input type="radio" id="tab-4" name="show" />
        <div class="navigation">
            <ul>
                <li>
                    <label href="">
                        <span class="icon">
                            <img src="resources/imgs/rogo.png" alt="" class="rogo" >
                        </span>
                        <span class="title">PMnt</span>
                    </label>
                </li>

                <li>
                    <label  for="tab-1">
                        <span class="icon">
                            <ion-icon name="cellular-outline"></ion-icon>
                        </span>
                        <span class="title">재고 현황</span>
                    </label>
                </li>

                <li>
                    <label for="tab-2">
                        <span class="icon">
                            <ion-icon name="bar-chart-outline"></ion-icon>
                        </span>
                        <span class="title">통계 현황</span>
                    </label>
                </li>

                <table class="weather">
                        <tr>
                            <th ><ion-icon name="sunny-outline" style="width: 40px; height: 40px;"></ion-icon></th>
                            <th></th>
                        </tr>
                    <tr>
                        <td></td>
                        <td><a class="weatherwidget-io" href="https://forecast7.com/en/37d57126d98/seoul/" data-label_1="SEOUL" data-label_2="WEATHER" data-font="Ubuntu" data-mode="Current" data-days="3" data-theme="retro-sky" >SEOUL WEATHER</a>
                        </td>
                    </tr>
                </table>
                    
                   
                
                <li>
                    <a href="/loginpage.html">
                        <span class="icon">
                            <ion-icon name="log-in-outline"></ion-icon>
                        </span>
                        <span class="title">로그인</span>
                    </a>
                </li>

             
                <!-- ===================로그인시 바뀔곳============== -->
                <!-- <li>
                    <label for="tab-4">
                        <span class="icon">
                            <ion-icon name="settings-outline"></ion-icon>
                        </span>
                        <span class="title">회원정보 수정</span>
                    </label>
                </li>

                <li>
                    <label>
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">로그아웃</span>
                    </label>
                </li> -->


            </ul>
        </div>
<!-- =======================메인콘텐츠=============================== -->
        <!-- ========================= 재고현황 ==================== -->
         <div class="topmian">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="maincon">
                <div class="quote">
                    <table id="pro_product">
                        <thead>
                            <tr>
                                <th>제품 번호</th>
                                <th>제품 이름</th>
                                <th>입고량</th>
                                <th>출고량</th>
                                <th>입고일</th>
                                <th>출고일</th>
                                <th>소비기한</th>
                                <th>입고금액</th>
                                <th>출고금액</th>
                                <th>수입</th>
                                <th>비고</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody id="pro_product_body">
                            
                        </tbody>
                    </table>
                </div>
                <div class="input_pro">
                    <h3>제품 추가</h3>
                    <table id="pro_product_plus">
                        <thead>
                            <tr>
                                <th>제품 번호</th>
                                <th>제품 이름</th>
                                <th>입고량</th>
                                <th>출고량</th>
                                <th>입고일</th>
                                <th>출고일</th>
                                <th>소비기한</th>
                                <th>입고금액</th>
                                <th>출고금액</th>
                                <th>수입</th>
                                <th>비고</th>
                                <th>추가</th>
                            </tr>
                        </thead>
                        <tbody>
                            <td><input type="text" placeholder="제품번호" id="p_num"></td>
                            <td><input type="text" placeholder="제품 이름" id="p_name"> </td>
                            <td><input type="text" placeholder="입고량" id="p_receivingquantity"></td>
                            <td><input type="text" placeholder="출고량" id="p_shipments"></td>
                            <td><input type="date" placeholder="입고일" id="p_receivingdate"></td>
                            <td><input type="date" placeholder="출고일" id="p_shippingdate"></td>
                            <td><input type="text" placeholder="소비기한" id="p_expirationdate"></td>
                            <td><input type="text" placeholder="입고금액" id="p_receivingamount"></td>
                            <td><input type="text" placeholder="출고금액" id="p_shippingamount"></td>
                            <td><input type="text" placeholder="수입" id="p_income"></td>
                            <td><input type="text" placeholder="비고" id="p_remarks"></td>
                            <td><button type="button" id="append_row">제품추가</button></td>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- =================상품예측=============== -->
            <div class="maincon">
                <div class="menuu">
                    <div class="menu">
                        <div class="card">
                            <div>
                                <div class="numbers"> <ion-icon name="stats-chart-outline"></ion-icon>종합</div>
                            </div>
        
                            
                        </div>
        
                        <div class="card">
                            <div>
                                <div class="numbers"><ion-icon name="rainy-outline"></ion-icon>날씨</div>
                            </div>
        
                            
                        </div>
        
                        <div class="card">
                            <div>
                                <div class="numbers"><ion-icon name="thermometer-outline"></ion-icon>온도</div>
                            </div>
        
                        
                        </div>
        
                        <div class="card">
                            <div>
                                <div class="numbers"><ion-icon name="cube-outline"></ion-icon>유통량</div>
                            </div>
        
                            
                        </div>
                    </div>
                    <div class="rollingbanner ">
                        <div class="wrap">
                            <ul>
                                <li class="current"><a href="#">어제의 안성민 1000원</a></li>
                                <li class="next"><a href="#">오늘의 안성민 2000원</a></li>
                                <li><a href="#">내일의 안성민 2500원</a></li>
                                <li><a href="#">토요일의 안성민 0원</a></li>
                                <li class="prev"><a href="#">일요일의 안성민 0원</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ================ Add Charts JS ================= -->
                <div class="charttt">
                    <div class="chartsBx">
                        <div class="chart"> <canvas id="chart-1"></canvas> </div>
                        <div class="chart"> <canvas id="chart-2"></canvas> </div>
                    </div>
                </div>    
            </div>
            <!-- ================ 로그인회원가입 ================= -->
            <div class="maincon">
                <div class="wrapper">
                    <div class="log">
                        <div class="login">
                            <header>로그인</header>
                            <form action="#" class="loginform">
                                    <input class="user" type="text" placeholder="사업자 등록번호를 입력해 주세요" required />
                                    <input class="user" type="password" placeholder="비밀번호를 입력해 주세요" required />
                                    <a class="find" href="#">비밀번호 찾기</a>
                                    <div class="input_field">
                                        <input type="submit" value="로그인" class="btn">
                                    </div>
                            </form>
                        </div>
                        <div class="sign">
                            <header>회원 가입</header>
                            <form action="#" class="signform">
                                    <input class="user" type="text" placeholder="사업자 등록번호를 입력해 주세요" required />
                                    <input class="user" type="password" placeholder="비밀번호를 입력해 주세요" required />
                                    <input class="user" type="text" placeholder="이름을 입력해주세요" required />
                                    <input class="user" type="text" placeholder="회사명을 입력해주세요" required />
                                    <input class="user" type="text" placeholder="사업장 주소 입력해 주세요" required />
                                    <input class="user" type="text" placeholder="E-mail을 입력해 주세요" required />
                                    <div class="input_field">
                                        <input  type="submit" value="등록" class="btn">
                                        <span>&nbsp;&nbsp;</span>
                                        <input  type="button" value="취소" class="btn">
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- ====================테이블추가/삭제==================== -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

    // 추가
    
    $("#append_row").on("click", function() {
    
        
    
        $("#pro_product").append(
    
            
    
            $("<tr>").append(
    
            
    
                $("<td noWrap class='editable'>").append( $("#p_num").val() ),
    
                $("<td noWrap class='editable'>").append( $("#p_name").val() ),
    
                $("<td noWrap class='editable'>").append( $("#p_receivingquantity").val() ),
                    
                $("<td noWrap class='editable'>").append( $("#p_shipments").val() ),
    
                $("<td noWrap class='editable'>").append( $("#p_receivingdate").val() ),

                $("<td noWrap class='editable'>").append( $("#p_shippingdate").val() ),

                $("<td noWrap class='editable'>").append( $("#p_expirationdate").val() ),
    
                $("<td noWrap class='editable'>").append( $("#p_receivingamount").val() ),

                $("<td noWrap class='editable'>").append( $("#p_shippingamount").val() ),

                $("<td noWrap class='editable'>").append( $("#p_income").val() ),
                    
                $("<td noWrap class='editable'>").append( $("#p_remarks").val() ), 
                    
                $("<td noWrap>").append(
    
                    $("<a>").prop("href", "#").addClass("delete-link").append("삭제")     
    
                )		
    
            )	
    
        );	
    
    });
    
    
    
    // 삭제
    
    $("#pro_product").on("click", ".delete-link", function () {
    
        
    
        $(this).parent().parent().remove();
    
        
    
    });
    
    </script>
    <!-- =============================수정=================== -->
    <script>
        $(document).ready(function() {
            // 테이블 셀 더블 클릭 이벤트 핸들러
            $(document).on("dblclick", ".editable", function() {
            // 더블 클릭한 셀의 내용을 가져옴
            var value=$(this).text();
            // 새로운 input 엘리먼트를 만들어서 테이블 셀에 추가
            var input="<input type='text' class='input-data' value='"+value+"' class='form-control'>";
            $(this).html(input);
            // 셀에서 editable 클래스를 삭제
            $(this).removeClass("editable");
            });
            // input 엘리먼트 blur 이벤트 핸들러
            $(document).on("blur", ".input-data", function() {
            // input 엘리먼트에서 수정된 값을 가져옴
            var value=$(this).val();
            // input 엘리먼트의 부모 td 엘리먼트를 찾아서 변수에 할당
            var td=$(this).parent("td");
            // input 엘리먼트를 삭제
            $(this).remove();
            // 수정된 값을 td 엘리먼트에 추가
            td.html(value);
            // td 엘리먼트에 editable 클래스 추가
            td.addClass("editable");
            });
            // input 엘리먼트 keypress 이벤트 핸들러
            $(document).on("keypress", ".input-data", function(e) {
            // 엔터키 입력 시
            var key=e.which;
            if(key==13) {
                // input 엘리먼트에서 수정된 값을 가져옴
                var value=$(this).val();
                // input 엘리먼트의 부모 td 엘리먼트를 찾아서 변수에 할당
                var td=$(this).parent("td");
                // input 엘리먼트를 삭제
                $(this).remove();
                // 수정된 값을 td 엘리먼트에 추가
                td.html(value);
                // td 엘리먼트에 editable 클래스 추가
                td.addClass("editable");
            }
            });
        });
    </script>
    <!-- =========== Scripts =========  -->
    <script src="resources/js/main.js"></script>
    <!-- <script src="resources/js/loginpage.js"></script> -->

    <!-- ======= Charts JS ====== -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script src="resources/js/chartsJS.js"></script>

    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <!-- =================날씨=========== -->
    <script>
        !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
        </script>
</body>

</html>