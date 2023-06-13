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
</head>

<body>


<%-- <script>
                                    $(document).ready(function() {
                                    	  // date 입력 값이 변경되었을 때 실행되는 이벤트 핸들러
                                    	  $('#dbox1').on('change', function() {
                                    	    var selectedDate = $(this).val(); // 선택한 날짜 값을 가져옵니다.
                                    	    var userbno = <%=user.getUserbno()%>; // userbno 값을 가져옵니다.
											console.log(selectedDate) // 날짜 확인 완료  "2023-06-08"
											console.log(userbno) // userbno 확인 완료  "123456"
											
                                    	    $.ajax({
                                    	      url: '#{cpath}/productSearch2.do',
                                    	      type: 'post',
                                    	      dataType: 'json',
                                    	      data: {
                                    	        date: selectedDate,
                                    	        userbno: userbno
                                    	      },
                                    	      success: function() {
                                    	    	  alert("ajax통신 성공")
                                    	        // AJAX 요청이 성공적으로 완료된 후 실행될 콜백 함수입니다.
                                    	        console.log(response);
                                    	        // 서버에서 반환된 응답 데이터를 콘솔에 출력하거나 필요한 작업을 수행합니다.
                                    	      },
                                    	      error: function(xhr, status, error) {
                                    	    	  alert("ajax통신 실패")
                                    	        // AJAX 요청이 실패한 경우 실행될 콜백 함수입니다.
                                    	        console.error(error);
                                    	        // 오류 메시지를 콘솔에 출력하거나 오류 처리를 수행합니다.
                                    	      }
                                    	    });
                                    	  });
                                    	});
                                    
                                    </script> --%>

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
                    <button class="bt11">수정</button><button class="bt22">초기화</button>
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
                        	<c:forEach items="${list}" var = "productl">
                        		<%-- <span>${sessionScope}</span> 세션의 값 확인용--%> 
                        		<!-- 참고용 -->
                        		<!-- session에 담긴 userbno값과 list에 있는 userbno의 값이 같은 것만 list에 출력해주는 방식으로 출력해준다 -->
									<c:if test="${productl.userbno == user.userbno}">
	                        		<tr>
	                        			<td>${productl.pnum}</td> <!-- 제품번호 -->
	                        			<td>${productl.pname}</td> <!-- 제품이름 -->
	                        			<%-- <td><input type="text" placeholder="${productl.pnum}" id="pname" name = "pname"> </td> --%>
	                        			<td>${productl.preceivingquantity}</td> <!-- 입고량 -->
	                        			<td>${productl.pshipments}</td> <!-- 출고량 -->
	                        			<td>${productl.preceivingdate}</td> <!-- 입고일 --> 
	                        			<td>${productl.pshippingdate}</td> <!-- 출고일 -->
	                        			<td>${productl.pexpirationdate}</td> <!-- 소비기한 -->
	                        			<td>${productl.preceivingamount}</td> <!-- 입고금액 -->
	                        			<td>${productl.pshippingamount}</td> <!-- 출고금액 -->
	                        			<td>${productl.pincome}</td> <!-- 수입 -->
	                        			<td>${productl.premarks}</td> <!-- 비고 -->
	                        			<form action = "${cpath}/productDelete.do" method ="post">
	                        				<input type="hidden" name="pseq" value="${productl.pseq}"/>
											<td><button type = "submit" id="append_row">삭제</button></td>
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
                <div class="input_pro">
                    <h3>제품 추가</h3>
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
					                            <td><button type="submit" id="append_row">제품추가</button></td>
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
                    <div class="rollingbanner ">
                        <div class="wrap">
                            <ul>
                                <li class="current"><a href="#">사과 1kg 10000원</a></li>
                                <li class="next"><a href="#"></a></li>
                                <li><a href="#">복숭아 1kg 15000원</a></li>
                                <li><a href="#">딸기 1kg 20000원</a></li>
                                <li class="prev"><a href="#">포도 1kg 15000원</a></li>
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