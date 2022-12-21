<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="훈련사 목록" name="title"/>
</jsp:include>

<script type="text/javascript">
	$(function(){
	    $(".star-score").score({
	        starColor:"#81BDF1",//별 색상(기본 : 금색)
	        integerOnly:false,
	        display: {
	            showNumber:true,//숫자 표시
	            placeLimit:2,//소수점 자리수
	            textColor:"#81BDF1",//숫자 색상(기본 : 금색)
	        }
	    });
	
	    $(".star-score-edit").score({
	        editable:true,//수정 가능하도록 설정
	        integerOnly:true,//정수만 가능
	        display:{
	            showNumber:true,
	        },
	        send: {
	            sendable:true,//전송가능 설정
	            name:"reviewScore"//전송 파라미터 명 설정
	        }
	    });
	});

	$(function(){
		//시작시 진행예약화면 고정
		ingClick();
		
		//진행 예약 버튼 이벤트
		$(".ing-btn").click(function(){
			ingClick();
		});
		
		//지난 예약 버튼 이벤트
		$(".end-btn").click(function(){
			endClick();
		});
		
		function ingClick(){
			//버튼 색상 변경
			$(".end-btn").removeClass("unselect-btn select-btn");
			$(".ing-btn").removeClass("unselect-btn select-btn");
			$(".end-btn").addClass("unselect-btn");
			$(".ing-btn").addClass("select-btn");
			//진행 예약만 출력
			$(".training-end").children().hide();
			$(".training-ing").children().show();
		}
		
		function endClick(){
			//버튼 색상 변경
			$(".ing-btn").removeClass("unselect-btn select-btn");
			$(".end-btn").removeClass("unselect-btn select-btn");
			$(".ing-btn").addClass("unselect-btn");
			$(".end-btn").addClass("select-btn");
			//지난 예약만 출력
			$(".training-end").children().show();
			$(".training-ing").children().hide();
		}

	});	


</script>

<style>
	.list-back{
		width:100%;
		height:500px;
		margin-top:80px;
		background-color:#F7F8FA;
	}
	.info-box{
		width:1000px;
		height:274px;
		border:1px solid #EBEBEB;
		display:flex;
		position:relative;
		align-items:center;
		background-color:white;

	}
	.img-box{
		width:430px;
		height:250px;
		border-radius:5px;
		margin-left:10px;
	}
	.box-content{
		padding:38px 45px 0 45px;
		height:100%;
		display:flex;
		flex-grow:1;
		flex-direction:column;
		justify-content:space-between;
		align-items:center;
	}
	.content-title{
		border-bottom:1px solid #EBEBEB;
		padding-bottom:18px;
		width:100%
	}
	.name-font{
		font-size:22px;
		letter-spacing:-0.2px;
		font-weight:500;
		color:#393C47;
		margin-top:8px;
		line-height:29px;
	}
	.title-font{
		font-size:17px;
		letter-spacing:-0.2px;
		font-weight:400;
		color:#393C47;
		margin-top:8px;
		line-height:29px;
	}

	.training-btn{
		background-color:#F7F8FA;
		border:none;
		color:#303030;
		font-size:17px;
	}
	a{
		color:black;	
	}

</style>
<body>
	
		<div>
			<div style="width:1000px; margin:0px auto; margin-top:130px;">
				<div>
					<h1>훈련사를 소개합니다!</h1>
					<p class="mt-4" style="font-size:15px; colof:#4D5055;">
						나와 우리 반려견에 꼭 맞는 훈련사를 찾아보세요!
		            </p>
				</div>
			</div>

			<!-- 훈련사 소개 시작 -->
			<div class="list-back ">
	            <div class="col-lg-10 offset-lg-1 col-md-8 offset-md-2 col-sm-6 offset-sm-3">
            		<p class="text-end" style="margin-right:100px; padding-top:10px;">
                 		<i class="fa-solid fa-arrow-up-9-1 fa-2xs"></i><button class="training-btn ing-btn">후기순</button>
                		<i class="fa-solid fa-arrow-down-9-1 fa-2xs"></i><button class="training-btn end-btn">평점순</button>
                 	</p>
	                 <div style="display:flex; padding-top:40px;" class="justify-content-center">
	                 	<div class="info-box shadow-sm rounded">
	                 		
	                 		<div>
	                 			<a href="#">
	                 				<img src="/image/kang.png" class="img-box">
	                 			</a>
	                 		</div>
	                 		<a class="box-content" href="#">
	                 			<div class="content-title">
	                 				<h3 class="name-font">훈련사 이름 훈련사</h3>
	                 			</div>
	                 			<div style="display:flex; justify-content:space-between; width:100%;height:100%;">
	                 				<h4 class="title-font mt-3">단순 훈련사만이 아닌 심리 안정을 위한 멘토가 되어드리겠습니다. </h4>
	                 			</div>
	                 			<div style="display:flex; margin-top:21px; margin-bottom:30px; width:100%;">
		                 			<div style="display:flex; flex-direction:row; align-items:center; margin-right:18px;">
										<p style="font-size:15px; font-weight:bolder; display:inline-block; margin-right:5px;" class="blue">★★★★★<span style="color:#303030; margin-left:5px;">5.00</span></p>
										<p style="font-size:15px; font-weight:bolder; display:inline-block; color:#303030; margin-right:5px;"> | </p>
										<p style="font-size:15px; font-weight:bolder; display:inline-block; color:#303030; margin-right:5px;">후기 <span>5</span>개</p>
									</div>
									<div class="flex-fill text-end">
										<button type="button" class="btn btn-blue">상세</button>
									</div>
								</div>
	                 		</a>
	                 	</div>
					
	                 </div>
	            </div>
	        </div>
			<!-- 훈련사 소개 끝 -->
			
			
			
		</div>
		
		
		
		
		
		
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>




