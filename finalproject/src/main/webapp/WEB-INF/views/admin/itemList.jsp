<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="상품 관리" name="title"/>
</jsp:include>

<style>


   .underline-out{
		border-bottom:#fff;
	}

    .insert-box{
    	width:400px;
   		border:1.9px solid rgba(0, 0, 0, 0.7);
   		border-radius: 0.7rem;
   		height:200px;
   		padding:20px;
   }

	.form-select, 
	.form-control{
		font-size:15px;
	}
	table>tbody>tr>td{
		height:48px;
		padding-left:30px;
	}

</style>  
   
<script>
	$(function(){
		list();
		
		//상태 판정
		check={
			itemName:false,
			itemPrice:false, priceRegex:/^[0-9]{1,}$/,
			itemDisabled:false,
			allValid:function(){
				return this.itemName && this.itemPrice && this.itemDisabled;
			}
		}
		
		//이름 검사
		$("[name=itemName]").blur(function(){
			var value = $(this).val();
			$(this).removeClass("is-invalid");
			if(value.length>0){
				check.itemName = true;
			}else{
				$(this).addClass("is-invalid");
				check.itemName = false;
			}
		});
		
		//가격 검사
		$("[name=itemPrice]").blur(function(){
			var value = $(this).val();
			var regex = check.priceRegex;
			$(this).removeClass("is-invalid");
			if(regex.test(value)){
				check.itemPrice = true;
			}else{
				$(this).addClass("is-invalid");
				check.itemPrice = false;
			}
		});
		
		//진열상태 검사
		$("[name=itemDisabled]").change(function(){
			var value = $(this).val();
			$(this).removeClass("is-invalid");
			if(value.length!=0){
				check.itemDisabled = true;
			}else{
				$(this).addClass("is-invalid");
				check.itemDisabled = false;
			}
		});

		//등록
		$(".form-btn").submit(function(e){
			e.preventDefault();
			
			$("[name=itemName]").blur();
			$("[name=itemPrice]").blur();
			$("[name=itemDisabled]").change();
			
			var btnType = $(".btn-type").text();
			
			var itemName = $("[name=itemName]").val();
			var itemPrice = $("[name=itemPrice]").val();
			var itemDisabled = $("[name=itemDisabled] option:selected").val();
			
			if(check.allValid() && btnType=='상품 등록'){
				data={
						itemName:itemName,
						itemPrice:itemPrice,
						itemDisabled:itemDisabled
				}
				$.ajax({
					url:"http://localhost:8888/rest/item_insert",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success:function(resp){
						$("[name=itemName]").val("");
						$("[name=itemPrice]").val("");
						$("[name=itemDisabled]").val("");
						list();
					}
				});
			}
		});
		
		//목록 출력 함수
		function list(){
			$(".tbody").empty();
			$.ajax({
				url:"http://localhost:8888/rest/item_list",
				method:"get",
				success:function(resp){
					var tbody = $(".tbody");
					for(var i=0; i<resp.length; i++){
						var tr = $("<tr>");
						var td1 = $("<td>").attr("class","ajaxItemNo").text(resp[i].itemNo);
						var td2 = $("<td>").attr("class","ajaxItemName").text(resp[i].itemName);
						var td3 = $("<td>").text(resp[i].itemPrice);
						var td4 = $("<td>").text(resp[i].itemDate);
						var td5 = $("<td>").text(resp[i].itemDisabled);
						var td6 = $("<td>");
						var itag = $("<i>").attr("class","fa-solid fa-xmark delete-btn").css("color","red");
						td6.append(itag);
						tr.append(td1).append(td2).append(td3)
							.append(td4).append(td5).append(td6);
						tbody.append(tr);
					}
					
					//삭제
					$(".delete-btn").click(function(){
						var itemNo = $(this).parent().siblings(".ajaxItemNo").text();
						deleteBtn(itemNo);
					});
					
					//수정
					$(".ajaxItemName").click(function(){
						//버튼 변경
						$(".btn-type").text('상품 수정').attr("class","btn btn-yellow btn-type");
						//기존 정보 띄우기
						$("[name=itemName]").val($(this).text());
						$("[name=itemPrice]").val($(this).next().text());
						$("[name=itemDisabled]").val($(this).next().next().next().text());
						
						//수정버튼 클릭이벤트 전 데이터준비
						var btnType = $(".btn-type").text();
						var itemNo = $(this).prev().text();
						$(".btn-type").click(function(){
							if(btnType=='상품 수정'){
								//입력 및 선택된 값 확인
								var itemName = $("[name=itemName]").val();
								var itemPrice = $("[name=itemPrice]").val();
								var itemDisabled = $("[name=itemDisabled] option:selected").val();
								edit(itemNo, itemName, itemPrice, itemDisabled);
							}	
						});
						
						//삭제버튼 누를 경우 처리
						$(".delete-btn").click(function(){
							$("[name=itemName]").val("");
							$("[name=itemPrice]").val("");
							$("[name=itemDisabled]").val("");
							$(".btn-type").text('상품 등록').attr("class","btn btn-blue2 btn-type");
						});
						
					});
				}
			});
		}
		
		//수정
		function edit(itemNo, itemName, itemPrice, itemDisabled){
			data={
					itemNo:itemNo,
					itemName:itemName,
					itemPrice:itemPrice,
					itemDisabled:itemDisabled
			}
			$.ajax({
				url:"http://localhost:8888/rest/item_edit",
				method:"put",
				contentType:"application/json",
				data:JSON.stringify(data),
				success:function(resp){
					if(resp){
						$("[name=itemName]").val("");
						$("[name=itemPrice]").val("");
						$("[name=itemDisabled]").val("");
						$(".btn-type").text('상품 등록').attr("class","btn btn-blue2 btn-type");
						//수정 2번씩 늘어나는 이유를 찾지 못해서 ㅠ 새로고침으로 변경
						location.reload();
					}
				}
			});	
		}
		
		//삭제
		function deleteBtn(itemNo){
			$.ajax({
				url:"http://localhost:8888/rest/item_delete/"+itemNo,
				method:"delete",
				data:itemNo,
				success:function(resp){
					if(resp){
						list();
					}
				}
			});
		}
		
		
		
	});
</script>


<body>
<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-black mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/adminHome">홈</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav"  href="${pageContext.request.contextPath}/admin/memberList">일반회원관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/applyList">훈련사 전환</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/admin/trainerList">훈련사 관리</a>
	        </li>
	         <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/admin/itemList"">포인트상품 관리</a>
	        </li>
	      
     	 </ul>
    	</div>
  	</div>
</nav>
	<div class="container-fluid">
	
        <div class="row mt-80">
              <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">상품 관리</h4>
             </div>
        </div>
        
        <form class="form-btn">
		<div class="row  mt-5">
			<div class="col-md-6 offset-md-3 ">
				<div class="row justify-content-center">
					<div class="insert-box">
						<table style="margin-left: auto; margin-right: auto;">
							<tbody>
								<tr>
									<th>상품명</th>
									<td>
										<input type="text" name="itemName" class="form-control underline">
									</td>
								</tr>
								<tr>
									<th>가격</th>
									<td>
										<input type="text" name="itemPrice" class="form-control underline">
									</td>
								</tr>
								<tr>
									<th>진열상태</th>
									<td>
										<select name="itemDisabled" class="form-select underline">
											<option value="">선택</option>
											<option value="Y">진열함</option>
											<option value="N">진열안함</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row  mt-4">
			<div class="col-md-6 offset-md-3 text-center">
				<button type="submit" class="btn btn-blue2 btn-type">상품 등록</button>
			</div>
		</div>
		</form>
		
		<div class="row  mt-5" style="margin-bottom:100px;">
			<div class="col-md-6 offset-md-3 text-center">
				<table class="table text-center align-middle">
					<thead>
						<tr class="table-default">
							<th>번호</th>
							<th>상품명</th>
							<th>가격</th>
							<th>등록일</th>
							<th>진열상태</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody class="tbody">
						<!-- 비동기화 처리 -->
					</tbody>
				</table>
			</div>
		</div>

</div>

</body>
