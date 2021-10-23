<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 업무공유</title>

<!-- summernote -->
 <link rel="stylesheet"	href="./resources/plugins/summernote/summernote-bs4.min.css">

<style>
	th{
		background-color: #DAE1E7;
		width: 15%;
		text-align: center !important;
	} 
	.content-wrapper{
		overflow:auto;
	}
	
	.fa-trash-alt{
		color: red;
		border: none;
		background-color: #FFFFFF;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-link"></i><b> 업무공유 작성</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card card-outline card-info">

						<div class="card-header text-center">
							<h6 style="margin-bottom: 0px">
								<b>업무공유</b>
							</h6>
						</div>

						<form id="insertWSForm" method="post" enctype="multipart/form-data">

							<div class="card-body">
								<div class="row">
									<div class="col-12">

										<table class="table table-bordered table-sm">
											<tr>
												<th>작성자</th>
												<td style="width: 35%;">
												&nbsp;
												<%-- <input type="text" name="loginEmpId" value="${loginUser.empName} ${loginUser.jobName}" style="border: none;" readonly> --%>
												${loginUser.empName} ${loginUser.jobName}
												<input type="hidden" name="ws_empno" value="${loginUser.empNo}">
												</td>
												<th>작성일</th>
												<td style="width: 35%;">
													&nbsp;
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" /></c:set> 
													<c:out value="${sysdate}" />
												 </td>
											</tr>
											<tr>
												<th>업무요약</th>
												<td colspan="3">
												<input type="text" name="ws_title" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th>수신직원</th>
												<td colspan="3">
												&nbsp;&nbsp;
												<input type="text" name="ws_recv">
												<div class="float-right">
													<button id="addressBook" type="button" class="btn btn-default btn-xs">주소록</button>
													&nbsp;&nbsp;
													<button id="searchEmp" type="button" class="btn btn-default btn-xs">직원 검색</button>
												</div>
												</td>
											</tr>
											<tr>
												<th>참조</th>
												<td colspan="3">
												&nbsp;&nbsp;
												<input type="text" name="ws_ref">
												<div class="float-right">
													<button id="refAB" type="button" class="btn btn-default btn-xs">주소록</button>
													&nbsp;&nbsp;
													<button id="refSEmp" type="button" class="btn btn-default btn-xs">직원 검색</button>
												</div>
												</td>
											</tr>
<!-- 											<tr>
												<th>수정권한</th>
												<td colspan="3">
												&nbsp;&nbsp;
												<div class="float-right">
													<button id="addressBook" type="button" class="btn btn-default btn-xs">주소록</button>
													&nbsp;&nbsp;
													<button id="searchEmp" type="button" class="btn btn-default btn-xs">직원 검색</button>
												</div>
												</td>
											</tr> -->
											<tr>
												<th>파일첨부</th>
												<td colspan="3">
													<span id="workShareAttachName"></span>
									                  <div class="btn btn-default btn-file btn-xs">
									                    <i class="fas fa-paperclip"></i> 첨부파일
									                    <input type="file" name="uploadFile" id="workShareAttach" multiple="multiple"> 
									               	  </div> 
												</td>
											</tr>
										</table>


									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<textarea id="summernote" name="ws_content"></textarea>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="float-right">
									<button id="tempSaveBtn" type="button" class="btn btn-secondary btn-sm" onclick="saveWorkShare();">임시저장</button>
									&nbsp;
									<button id="submitBtn" type="button" class="btn btn-primary btn-sm" onclick="insertWorkShare();">등록</button>
									&nbsp;
									<button id="resetBtn" type="button" class="btn btn-danger btn-sm" onclick="backToList();">취소</button>
									&nbsp;
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</section>
	</div>



	<!-- Summernote -->
	<script src="./resources/plugins/summernote/summernote-bs4.min.js"></script>
	<script>
    $(document).ready(function() {
    	  $('#summernote').summernote({
    	    height : 400
    	  });
    	});
    </script>
	
	<!-- 첨부파일 라벨 이름 추가 -->
	<script>
		
		$("#workShareAttach").on("change", function() {
			// 첨부파일 새로 첨부시 내용 삭제
			$('#workShareAttachName').empty();
			
			var filename = "";
			for(var i = 0; i < $(this)[0].files.length; i++){
				
				// filename += '<input type="button" id="deleteFile'+i+'" class="far fa-trash-alt" name="dFBtn"></input>&nbsp;&nbsp;';
				filename += $(this)[0].files[i].name + "&nbsp;&nbsp;";
				filename += "( " + Math.round(($(this)[0].files[i].size/1024)*100)/100 + " KB )	" ;
				filename += "<br>";
			}
			console.log("filename : " + filename)
			$('#workShareAttachName').append(filename); 
		});

	</script>
	
	<!-- 버튼 이동 -->
	<script>
	// 업무공유 보내기
 	function insertWorkShare(){
		$('#insertWSForm').each(function(){	
			
		    $("#insertWSForm").attr("action", "<%=request.getContextPath()%>/update.ws?ws_status=Y");
			$("#insertWSForm").submit();
			alert("업무공유가 수정되었습니다.");
		});
	}
	
	// 취소버튼 - 뒤로가기
 	function backToList(){
		
		var result = confirm("정말 취소하시겠습니까? (작성 중인 업무공유가 초기화됩니다.)");
		
		if(result){
			// 뒤로 가기
			history.back();
		} 
		
	} 
	
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>