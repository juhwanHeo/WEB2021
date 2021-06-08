<%@page import="com.project.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전기차 충전소</title>
	<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="user" class="com.project.vo.UserVO" scope="page"/>
	<!-- loading https://icons8.com/preloaders/ -->
	<div class="wrap-loading display-none"><img src="${pageContext.request.contextPath}/img/loading3.gif" /></div> 
	<div class="top-bar">
		<div class="login-box">
			<%
				UserVO userVO = (UserVO) session.getAttribute("userVO");
				if(userVO == null) {
			%>
				<a href="#">로그인</a>
			<% } else { %>
				<jsp:setProperty name="user" property="name"  value="<%= userVO.getName() %>"/>
				<span><jsp:getProperty name="user" property="name" />님 환영합니다!!</span> <br>
				<a href="#">관리자 페이지</a>
			<% } %>
		</div>
		<div class="search-box">
			<input type="text" name="search" id="search" placeholder="search..." value="<%= request.getParameter("addr") %>">
			<button class="icon" onclick="getCharge(null)"><i class="fa fa-search"></i></button>
		</div>
	</div>
	
	<div class="left-bar">
		<div class="item"><a href="index.jsp" style="margin-left: 5px;"><i class="fa fa-home fa-2x"></i></a></div>
		<div class="item">
			<div class="title">
				충전타입
			</div>
			<div class="type">
				<input type="checkbox" name="cb_all" checked> 전체  <br>
				<input type="checkbox" name="cb_ac3_sang"> AC3상  <br>
				<input type="checkbox" name="cb_ac_wan"> AC완속  <br>
				<input type="checkbox" name="cb_dc_demo"> DC차데모 <br>
				<input type="checkbox" name="cb_dc_combo"> DC콤보  <br>
				<input type="checkbox" name="cb_triple"> 트리플형 <br>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div id="map">
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51514afad23b808dd3f78f3965d57b28"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51514afad23b808dd3f78f3965d57b28&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51514afad23b808dd3f78f3965d57b28&libraries=LIBRARY"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51514afad23b808dd3f78f3965d57b28&libraries=services,clusterer,drawing"></script>
	<script>
		/* 
			참고 
			https://apis.map.kakao.com/web/sample/geolocationMarker/
		*/
		
		$("input[name='cb_all']").click(function() {
			if($(this).is(":checked")) {
				$('input:checkbox[name="cb_ac3_sang"]').prop("checked", false);
				$('input:checkbox[name="cb_ac_wan"]').prop("checked", false);
				$('input:checkbox[name="cb_dc_demo"]').prop("checked", false);
				$('input:checkbox[name="cb_dc_combo"]').prop("checked", false);
				$('input:checkbox[name="cb_triple"]').prop("checked", false);
				checkdBox();
			}
		})
		
		$('input[name="cb_ac3_sang"]').click(function() {
			if($(this).is(":checked")) {
				$("input[name='cb_all']").prop("checked", false);
			}
			checkdBox();
		})
		
		$('input[name="cb_ac_wan"]').click(function() {
			if($(this).is(":checked")) {
				$("input[name='cb_all']").prop("checked", false);
			}
			checkdBox();
		})
		
		$('input[name="cb_dc_demo"]').click(function() {
			if($(this).is(":checked")) {
				$("input[name='cb_all']").prop("checked", false);
			}
			checkdBox();
		})
		
		$('input[name="cb_dc_combo"]').click(function() {
			if($(this).is(":checked")) {
				$("input[name='cb_all']").prop("checked", false);
			}
			checkdBox();
		})
		$('input[name="cb_triple"]').click(function() {
			if($(this).is(":checked")) {
				$("input[name='cb_all']").prop("checked", false);
			}
			checkdBox();
		})
		
		function checkdBox() {
			var type = []
			if($('input[name="cb_all"]').is(":checked")) {
				var search = $("#search").val();
				getCharge(search, 'cb_all');
				return null;
			}
			
			if($('input[name="cb_ac3_sang"]').is(":checked")) {
				type.push('AC3상')
			}
			if($('input[name="cb_ac_wan"]').is(":checked")) {
				type.push('AC완속')
				
			}
			if($('input[name="cb_dc_demo"]').is(":checked")) {
				type.push('DC차데모')
				
			}
			if($('input[name="cb_dc_combo"]').is(":checked")) {
				type.push('DC콤보')
				
			}
			if($('input[name="cb_triple"]').is(":checked")) {
				type.push('트리플형')
			}

			var search = $("#search").val();
			getCharge(search, type);
		}
		
		var addr = '<%= request.getParameter("addr") %>'
		if(addr) getCharge(addr);
		
		var positions = [];
		var markers = [];
		var options = {
				center: new kakao.maps.LatLng(37.8537615, 127.6870611),
				level: 5 // 1 ~ 14
			};
		var container = document.getElementById('map');
		var map = new kakao.maps.Map(container, options);
		
		function getCharge(address, type) {
			var search;
			if(address) search = address;
			else {
				search = $("#search").val();
				$('input:checkbox[name="cb_all"]').prop("checked", true);
				$('input:checkbox[name="cb_ac3_sang"]').prop("checked", false);
				$('input:checkbox[name="cb_ac_wan"]').prop("checked", false);
				$('input:checkbox[name="cb_dc_demo"]').prop("checked", false);
				$('input:checkbox[name="cb_dc_combo"]').prop("checked", false);
				$('input:checkbox[name="cb_triple"]').prop("checked", false);
			}
			if(search === 'all') search = '';

			console.log('search: ' + search);
			console.log('type: ' + type);
			$.ajax({
	            type : "GET",
				data : { search, type },
	            url : "api/GetCharge.jsp",
	            dataType : "json",
	            success : function(data){
		        	console.log("positions.length: " + positions.length); 
					if(positions.length != 0) 
	            		removeMarker();
					$.each(data, function(i, item) {
	                	//console.log(i + ": " + JSON.stringify(item));
	                	positions.push({
	                		content: '<div>' + item.charge_name + '</div>',
	                		latlng: new kakao.maps.LatLng(item.latitude, item.longitude)
	                	});
					});
	            },
				beforeSend : function() {
					var width = 0;
					var height = 0;
					var left = 0;
					var top = 0;
					width = 256;
					height = 256;
					top = ($(window).height() - width) / 2
							+ $(window).scrollTop();
					left = ($(window).width() - height) / 2
							+ $(window).scrollLeft();
					if ($(".wrap-loading").length != 0) {
						$(".wrap-loading").css({
							"top" : top + "px",
							"left" : left + "px"
						});
						$('.wrap-loading').removeClass('display-none');
					}
				},
	            complete : function() {
            	 	setTimeout(function() {
            	 		if(positions.length != 0) {
			            	setCenter(positions[0].latlng);
		                	addMarker();
		            	}
		            	else {
		            		alert("검색 결과 없음");
		            	}
						$('.wrap-loading').addClass('display-none');
					}, 1000);
	            	
	            	
				},
	            error : function(){
	                alert("통신실패!!!!");
					$('.wrap-loading').addClass('display-none');
	            }
	             
	        });
		}
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		    	markers[i].setMap(null);
		    }   
		    markers = [];
		    positions = [];
		}
		function addMarker() {
			// 마커
			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng // 마커의 위치
			    });
				
			    markers.push(marker);
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content // 인포윈도우에 표시할 내용
			    });

			    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    (function(marker, infowindow) {
			        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			        kakao.maps.event.addListener(marker, 'mouseover', function() {
			            infowindow.open(map, marker);
			        });

			        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			        kakao.maps.event.addListener(marker, 'mouseout', function() {
			            infowindow.close();
			        });
			    })(marker, infowindow);
			}
		}
		
		function setCenter(pos) {            
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = pos;
		    
		    // 지도 중심을 이동 시킵니다
		    // map.setCenter(moveLatLon); 
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);
		    
		}
		
	</script>
</body>
</html>