<%@page import="kr.smhrd.PMnt.mapper.*"%>
<%@page import="kr.smhrd.PMnt.entity.ProProduct"%>
<%@page import="kr.smhrd.PMnt.entity.ProUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="cpath" value = "${pageContext.request.contextPath}"></c:set>
<%
ProUser user = (ProUser) session.getAttribute("loginuser");

ProProduct productinfo = (ProProduct) session.getAttribute("product");


// 동일한 요청에 의해 실행되는 페이지 간에 정보를 유지하기 위해 HttServletRequest객체에 등록 합니다.
request.setAttribute("user", user);
// 클라이언트 단위로 정보를 유지하고자 할때 HttpSession 객체에 등록합니다.
session.setAttribute("user", user);
// 웹 애플리케이션 단위로 정보를 유지하고자 할 때 ServletContest 객체에 등록합니다.
application.setAttribute("user", user);

%>
<!DOCTYPE html>
<html lang="en">
<script src="https://kit.fontawesome.com/369266d994.js"
	crossorigin="anonymous"></script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Admin Dashboard | Korsat X Parmaga</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="resources/css/style.css">
    <!-- ======= jquery ====== -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<!-- ======= bootstrap ====== -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">

        for (i = 1; i < 41; i++) {
            $.ajax({
                type: "GET",
                url: "http://www.garak.co.kr/publicdata/dataOpen.do?id=3468&passwd=1q2w3e4r!&dataid=data4&pagesize=10&pageidx=" + i + "&portal.templet=false&p_ymd=date&p_jymd=20140429&d_cd=2&p_jjymd=20130429&p_pos_gubun=1&pum_nm=",
                data: {},
                success: function (response) {
                    console.log(response);
                    var $response = $(response); // 응답 데이터를 jQuery 객체로 저장

                    $response.find("list").each(function () {
                        var str = $(this).find("PUM_NM_A").text(); // $(this)를 사용하여 요소 내에서 찾기
                        var str1 = $(this).find("U_NAME").text();
                        var str2 = $(this).find("PAV_P_A").text();
                        var str3 = $(this).find("G_NAME_A").text();
                        /* console.log("품목명@@@@@@@" + str + "@@@갯수@@@" + str1 + "@@@가격@@@" + str2); */

                        var li = document.createElement("li"); // 새로운 <li> 요소 생성
                        var a = document.createElement("a");
                        a.href = "#"; // Set the href attribute to "#"
                        a.className = "link"; // Set the class attribute to "link"
                        a.textContent = str + "   " + str3 + "  " + str1 + "  " + str2 + "원"; // Set the text content to "내용"


                        li.appendChild(a);; // 텍스트 설정

                        document.getElementById('rolling').appendChild(li); // 결과를 기존 결과의 뒤에 추가
                    });
                }
            });
        }
    </script>
	   <script>
        $(document).ready(function () {
            setTimeout(function () {
                var num2 = document.getElementsByClassName('link').length
                var height = $(".notice").height(); //공지사항의 높이값을 구해주고~~
                var num = $(".rolling li").length; // 공지사항의 개수를 알아볼수 있어요! length라는 것으로!
                console.log(num);
                var max = height * num; //그렇다면 총 높이를 알 수 있겠죠 ?
                console.log("높이>>" + height + " 총>>>" + num + "or" + num2 + "맥>>>" + max);
                var move = 0; //초기값을 설정해줍니다.
                function noticeRolling() {
                    move += height; //여기에서 += 이라는 것은 move = move + height 값이라는 뜻을 줄인 거에요.
                    $(".rolling").animate({ "top": -move }, 2000, "linear", function () { // animate를 통해서 부드럽게 top값을 올려줄거에요.
                        if (move >= max) { //if문을 통해 최대값보다 top값을 많이 올렸다면 다시 !
                            $(this).css("top", 0); //0으로 돌려주고~
                            move = 0; //초기값도 다시 0으로!
                        };
                    });
                };
                noticeRollingOff = setInterval(noticeRolling, 2000); //자동롤링답게 setInterval를 사용해서 1000 = 1초마다 함수 실행!!
                $(".rolling").append($(".rolling li").first().clone()); //올리다보면 마지막이 안보여서 clone을 통해 첫번째li 복사!
            }, 3000);
            
        });




    </script>
</head>

<body>
<script>
	$(document).ready(function(){
		// trueproductlist() 함수 호출
		fruitslist();
		fruitsCnt();
		tempChart();
	}); // 제일 먼저 실행되는 함수
	
	function fruitslist(){
		console.log("병국쌤 바보");
		
		// ajax통신으로 요청 주고 받기
		
		$.ajax({
			url : "${cpath}/fruits.do",
			type : "get",
			// data : 보내줄 데이터 없음
			dataType : "json",
			success : callBack,
			error : function(){
				alert("akax통신 실패!!");
			
			} //function() 함수 끝
			
		})
	}
		
		function callBack(data){
		console.log(data);
			var fruitslist = '<div class="textbox">';
			fruitslist += '<h1 class="text">추천 상품은 수박입니다.</h1>';
			fruitslist += '<div class="text">'+data[0].ftext+'</div>';
			fruitslist += '</div>'; 
			$('.box').html(fruitslist);
		}

		// chartdp에 데이터 값 출력하기
		function fruitsCnt(){
			console.log("chartval 실행 확인");
			
			$.ajax({
				url : "${cpath}/fruitsData.do",
				type : "get",
				// data : 보내줄 데이터 없음
				dataType : "json",
				success : chartVal,
				error : function(){
					alert("akax통신 실패!!");
				
				} //function() 함수 끝
				
			})
			
		}
		
		function chartVal(data){
			
			/* console.log(data);  */
			chartData = data;
			
		}
		
		function tempChart(){
			console.log("chartval 실행 확인");
			
			$.ajax({
				url : "${cpath}/tempData.do",
				type : "get",
				// data : 보내줄 데이터 없음
				dataType : "json",
				success : tempData,
				error : function(){
					alert("akax통신 실패!!");
				
				} //function() 함수 끝
				
			})
			
		}
		
</script>
<%-- <script>

	
	$(document).ready(function(){
		// productlist() 함수 호출
		trueproductlist();
		
	}); // 제일 먼저 실행되는 함수
	
	function trueproductlist(){
		
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
/* 		function trueproduct(data){
			console.log(data);
			
			var prolist = ''
		}
		
		
	} */
	
	function productlist(data){
		console.log(data);
		
		var prolist = '<table id="pro_product">';
		prolist += '<thead>';
		prolist += '<tr>';
		prolist += '<th>제품 번호</th>';
		prolist += '<th>제품 이름</th>';
		prolist += '<th>입고량</th>';
		prolist += '<th>출고량</th>';
		prolist += '<th>입고일</th>';
		prolist += '<th>출고일</th>';
		prolist += '<th>소비기한</th>';
		prolist += '<th>입고금액</th>';
		prolist += '<th>출고금액</th>';
		prolist += '<th>수입</th>';
		prolist += '<th>비고</th>';
		prolist += '<th>삭제</th>';
		prolist += '</tr>';
		
		$.each(data,(index,product)=>{
			if(<%= user.getUserbno() %> == product.userbno){
			
			prolist += '<tr>';
			prolist += '<td>' +product.pnum +'</td>'; // 제품번호
			prolist += '<td>' +product.pname +'</td>'; // 제품이름
			prolist += '<td>' +product.preceivingquantity +'</td>'; // 입고량
			prolist += '<td>' +product.pshipments +'</td>'; // 출고량
			prolist += '<td>' +product.preceivingdate +'</td>'; // 입고일
			prolist += '<td>' +product.pshippingdate +'</td>'; // 출고일
			prolist += '<td>' +product.pexpirationdate +'</td>'; // 소비기한
			prolist += '<td>' +product.preceivingamount +'</td>'; // 입고금액
			prolist += '<td>' +product.pshippingamount +'</td>'; // 출고금액
			prolist += '<td>' +product.pincome +'</td>'; // 수입
			prolist += '<td>' +product.premarks +'</td>'; // 비고
			/* prolist += '<td>' +$("<a>").prop("href", "#").addClass("delete-link").append("삭제") +'</td>'; // 비고 */
			
			prolist += '<tr>'
			} // if문 끝
			
		}); // each() 끝
		 	prolist += '</thead>';
		    prolist += '<tbody></tbody>';
		    prolist += '</table>';
		    $('.quote').html(prolist);
		} //trueproduct 끝
	
</script> --%>

<!-- <script>
	function productDel(pseq){
		
		$.ajax({
			url : "${cpath}/productDelete",
			type : "delete",
			sucess : true,
			error : function(){
				alert("삭제 실패...")
			}
		})
	}
</script> -->
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
                            <img src="resources/imgs/logo.png" alt="" class="rogo" >
                        </span>
                        
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
                            
                        </tr>
                    <tr>
                        <td></td>
                        <td><a class="weatherwidget-io" href="https://forecast7.com/en/37d57126d98/seoul/" data-label_1="SEOUL" data-label_2="WEATHER" data-font="Verdana" data-icons="Climacons Animated" data-mode="Current" data-mooncolor="#ffda03" data-cloudcolor="#b3e5fc" data-cloudfill="#fff" data-raincolor="#2f3a55" data-snowcolor="#fff"  data-textcolor="black" data-suncolor="#ffb74d" >SEOUL WEATHER</a>
                        </td>
                    </tr>
                </table>
                    
                   
                
                <!-- <li>
                    <a href="/loginpage.html">
                        <span class="icon">
                            <ion-icon name="log-in-outline"></ion-icon>
                        </span>
                        <span class="title">로그인</span>
                    </a>
                </li> -->

             
                <!-- ===================로그인시 바뀔곳============== -->
                <li>
                    <label for="tab-3">
                        <span class="icon">
                            <ion-icon name="settings-outline"></ion-icon>
                        </span>
                        <a class="title" href="${cpath}/imformation.do">회원정보 수정</a>
                        <!-- <span class="title">회원정보 수정 </span> -->
                    </label>
                </li>

                <li>
                    <label>
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <%-- <a class="title"href="<c:url value='/logout.do'/>" >로그아웃</a> --%>
                        <a class="title" href="${cpath}/logout.do">로그아웃</a>
                        <!-- <span class="title">로그아웃</span> -->
                    </label>
                </li>
                

            </ul>
        </div>
<!-- =======================메인콘텐츠=============================== -->
        <!-- ========================= 재고현황 ==================== -->
         <div class="topmian"><!--1번div-->
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="maincon">
				<div class="btnhome">
                    <a href="${cpath}/main.do"><button class="bt11">취소</button></a>
                </div>
                <div class="quote">
                    <table id="pro_product">
                        <thead>
                            <tr>
                                <th>제품 번호</th>
                                <!-- <th>제품 이름</th> -->
                                <!-- 제품이름 검색 추가 부분 -->
                                <th class="pro_name">
                                    <span id="pname">제품 이름</span>
                                        <button id="p-btn">찾기</button>
                                        <form id="p-form" action="${cpath}/productSearch.do" method="get">
                                        	<input id="pn"type="text" name="pname" placeholder="제품이름 검색" />
                                        	<input type="hidden" name="userbno" value="<%=user.getUserbno()%>"/>
                                        	<button id="search-btn" type="submit">검색</button>
                                        <button id="re-btn" type="button">취소</button>
                                        </form>
                                   
                                    <!-- <input id="check-btn" type="checkbox" />
                                    <label for="check-btn"><img class="sur2"src="/img/op.png" alt=""></label>
                                      <ul class="menubars">
                                          <li><input class="sur" type="text"><button type="submit">찾기</button></li>
                                          
                                      </ul>     -->
                                      <!-- <form action="" class="search-bar" id="search-bar1" onclick="toggleBtn1()">
                                        <input class="search"type="search" name="search" pattern=".*\S.*" required >
                                        <button class="search-btn" id="search-btn1" type="submit">
                                            <span>Search</span>
                                        </button>
                                    </form> -->
                                </th>
                                <th>입고량</th>
                                <th>출고량</th>
                                <!-- <th>입고일</th> -->
                                <!-- <th>출고일</th> -->
                                <form action = "${cpath}/productSearch2.do" method = "get">
                                <input type="hidden" name="userbno" value="<%=user.getUserbno()%>"/>
                                <th class="input_date_box">입고일
                                <button id="search-btn" type ="submit">검색</button>
                                <input type="date" id="dbox" name ="preceivingdate">
                                </th>
                                </form>
                                <form action = "${cpath}/productSearch3.do" method = "get">
                                <input type="hidden" name="userbno" value="<%=user.getUserbno()%>"/>
                                <th class="input_date_box">출고일
                                <button id="search-btn" type ="submit">검색</button>
                                <input type="date" id="dbox" name ="pshippingdate"></th>
                                </form>
                                <th>소비기한</th>
                                <th>입고금액</th>
                                <th>출고금액</th>
                                <th>수입</th>
                                <th>비고</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody id="pro_product_body">
								<!-- session에 담긴 userbno값 불러오기 확인용  -->                        		
                        		<%-- <span>${user.userbno}</span>  --%>
                        	<c:forEach items="${search}" var = "productl">
                        		<%-- <span>${sessionScope}</span> 세션의 값 확인용--%> 
                        		<!-- 참고용 -->
                        		<!-- session에 담긴 userbno값과 list에 있는 userbno의 값이 같은 것만 list에 출력해주는 방식으로 출력해준다 -->
									<c:if test="${productl.userbno == user.userbno}">
	                        			<tr>
											<form action = "${cpath}/productUpdate.do" method ="post">
	                        				<input type="hidden" name="pseq" value="${productl.pseq}"/>
											<td>${productl.pnum}</td> <!-- 제품번호 -->
											<td>${productl.pname}</td> <!-- 제품이름 -->
											<td><input type="text" placeholder="${productl.preceivingquantity}" name ="preceivingquantity" style="width:70px"></td>
											<td><input type="text" placeholder="${productl.pshipments}"  name ="pshipments" style="width:70px"></td>
											<td><input type="date" value="${productl.preceivingdate}"  name ="preceivingdate"></td>
											<td><input type="date" value="${productl.pshippingdate}"  name ="pshippingdate"></td>
											<td>${productl.pexpirationdate}</td> <!-- 소비기한 -->
											<td><input type="text" placeholder="${productl.preceivingamount}"  name="preceivingamount" style="width:70px"></td>
											<td><input type="text" placeholder="${productl.pshippingamount}"  name="pshippingamount" style="width:70px"></td>
											<td><input type="text" placeholder="${productl.pincome}"  name="pincome" style="width:70px"></td>
											<td><input type="text" placeholder="${productl.premarks}"  name="premarks" style="width:70px"></td>
											<input type="hidden" id="userbno" name="userbno" value = "<%=user.getUserbno() %>">
											<td><button type = "submit" id="append_row">수정</button></td>
										</form>
										</tr>
                        			</c:if>
	                        		<!-- <script type="text/javascript">
										alert("준비중입니다.");
									</script> -->
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text"><h3>제품추가</h3></div>
                <div class="input_pro">
                    <table id="pro_product_plus">
                        <thead>
                            <tr>
                                <!-- <th>제품 번호</th> -->
                                <th>제품 이름</th>
                                <th>입고량</th>
                                <th>출고량</th>
                                <th>입고일</th>
                                <th>출고일</th>
                                <!-- <th>소비기한</th> -->
                                <th>입고금액</th>
                                <th>출고금액</th>
                                <th>수입</th>
                                <th>비고</th>
                                <th>추가</th>
                            </tr>
                        </thead>
	                        <%-- <c:choose>
	            				<c:when test="${empty productInsert}" value = ""> --%>
		                    		<form action ="${cpath}/productInsert.do" method="post">
				                        <tbody>
				                        	<tr>
					                            <!-- <td><input type="text" placeholder="제품번호" id="pnum" name="pnum"></td> -->
					                            <td><input type="text" placeholder="제품 이름" id="pname" name = "pname"> </td>
					                            <td><input type="text" placeholder="입고량" id="preceivingquantity" name ="preceivingquantity"></td>
					                            <td><input type="text" placeholder="출고량" id="pshipments" name ="pshipments"></td>
					                            <td><input type="date" placeholder="입고일" id="preceivingdate" name ="preceivingdate"></td>
					                            <td><input type="date" placeholder="출고일" id="pshippingdate" name ="pshippingdate"></td>
					                            <!-- <td><input type="text" placeholder="소비기한" id="pexpirationdate" name="pexpirationdate"></td> -->
					                            <td><input type="text" placeholder="입고금액" id="preceivingamount" name="preceivingamount"></td>
					                            <td><input type="text" placeholder="출고금액" id="pshippingamount" name="pshippingamount"></td>
					                            <td><input type="text" placeholder="수입" id="pincome" name="pincome"></td>
					                            <td><input type="text" placeholder="비고" id="premarks" name="premarks"></td>
					                            <input type="hidden" id="userbno" name="userbno" value = "<%=user.getUserbno() %>">
					                            <td><button type="submit" id="append_row2">제품추가</button></td>
					                           </tr>
				                        </tbody>
		                    		</form>
		                    <%-- 	</c:when>
		                    </c:choose> --%>
                    	</table>
                </div>
            </div>
            <!-- =================상품예측=============== -->
            <div class="maincon"><!--2번div-->
                <div class="menuu">
                    <div class="menu">
                        <div class="card">
                            <div>
                                <div class="numbers"> <ion-icon name="stats-chart-outline"></ion-icon>종합</div>
                            </div>
                        </div>
                    </div>
                    <div class="notice-block">
                        <div class="notice">
                            <ul class="rolling" id="rolling">
                                
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
                <!-- 텍스트 박스 -->
                <div class="box">
                    <div class="textbox">
                        <div class="text"></div>
                    </div>
                </div>   
            </div>
            <!-- ================ 회원수정 ================= -->
            <div class="maincon"><!--4번div-->
                
            </div>
        </div>
    </div>
<!-- ====================테이블추가/삭제==================== -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- <script type="text/javascript">

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
    
    </script> -->
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
    <script src="resources/js/loginpage.js"></script>
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