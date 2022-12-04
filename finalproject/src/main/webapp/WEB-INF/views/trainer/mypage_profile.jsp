<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="" name=""/>
</jsp:include>



<body>

<div class="container-fluid">
    <div class="row mt-4">
        <div class="col-md-10 offset-md-1 p-4 rounded">



<form>
  <fieldset>
    <legend>훈련사 프로필 관리</legend>
    
    <div class="form-group row">
      <label for="staticEmail" class="col-sm-2 col-form-label">프로필 사진 들어가야함</label>
      <div class="col-sm-10">
        <input type="text" readonly="" class="form-control-plaintext" id="staticEmail" value="email@example.com">
      </div>
    </div>
    
    <div class="form-group">
      <!--<label for="formFile" class="form-label mt-4">Default file input example</label>  -->
      <input class="form-control" type="file" id="formFile">
    </div>
    
    
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">제목</label>
      <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목을 입력해주세요">     
    </div>

	
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">내용</label>
      <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
    </div>
    
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">자격증</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="apply에서 가져오는 자격증내역" readonly >
    </div>
    
    
   
     <button type="submit" class="btn btn-blue">Submit</button>          
   
    </fieldset>
    </form>

   			</div>
   	 </div>
  </div>
    


</body>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>