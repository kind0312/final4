<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="훈련사프로필수정" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
    	/* overflow: hidden; 사진 첨부하고 주석풀기*/
	}
	.form-control{
		display:inline;
	}
	.table{
		border-color: rgba(0, 0, 0, 0);
		font-size:17px;
		margin-left:auto;
		margin-right:auto;
	}
	table>tbody>tr{
		height:70px;
		vertical-align: middle;
	}

</style>


<body>

<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-blue mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/mypage/training">마이페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}//trainer/mypage_reservation">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/trainer/mypage_profile">프로필 관리</a>
	        </li>      
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">회원페이지로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>








<div class="container-fluid">
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1 p-4 rounded">



<form>
  <fieldset>
    <legend>훈련사 프로필 관리</legend>
    
    
    <div class="row text-center mt-3">
            <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">   
                 <img src="${pageContext.request.contextPath}/image/profile_basic.jpg" 
                 		width="120" height="120" class="img-circle">
                 <input type="file" style="display:none;" class="input-file form-control" name="trainerProfileImg" accept=".jpg, .png, .gif">
                 <div class="invalid-feedback">사진을 등록해주세요!</div>
			</div>
	</div>
    
    
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">제목</label>
      <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목을 입력해주세요"  name="trainerProfile">     
    </div>

	
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">내용</label>
      <textarea class="form-control" id="exampleTextarea" rows="3" name= "trainerProfileContencts"></textarea>
    </div>
    
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">자격증</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="자격증" >
    </div>
    
    <!-- input 으로 넘겨야 하는데 안써도 되는건 히든으로 넘겨야함 -->
   
     <button type="submit" class="btn btn-blue">수정</button>          
   
    </fieldset>
    </form>

   			</div>
   	 </div>
  </div>
    


</body>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>