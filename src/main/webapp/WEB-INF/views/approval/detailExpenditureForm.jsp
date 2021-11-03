<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>

<style>	
	 td, span, input{
		font-weight:normal;!important;
		vertical-align: middle;!important;
	}
	input{
		border : none;
		background-color: white;
		pointer-events: none;
	}
	#plus_line_btn{
		margin-bottom:15px;
	}
	#ccName{
		width: 300px; !important;
	}
	.bottom-margin0{
		margin-right:8px;
		margin-botton:0px;
	}
	.content-wrapper{
		overflow:auto;
	}
	.confirm{
		width:50px;
		length:50px;
	}
	#confirm0{
		font-family: "나눔손글씨 펜", 함초롱바탕, cursive;
	}
	#confirm1{
		font-family: "교보 손글씨 2019", 함초롱바탕, cursive;
	}
	#confirm2{
		font-family: "LG 그램", 함초롱바탕, cursive;
	}
	#confirm3{
		font-family: "문체부 쓰기 정체", 함초롱바탕, cursive;
	}
	#confirm4{
		font-family: 필기, 함초롱바탕, cursive;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />


	<div class="content-wrapper">
		<!-- 페이지 헤더 -->
		<section class="content-header">
		      <div class="container-fluid">
		        <div class="row mb-2">
		          <div class="col-sm-6">
		            <h4><i class="fas fa-chart-pie"></i> <b>전자 결재</b></h4>
		          </div>
		        </div>
		      </div><!-- /.container-fluid -->
		</section>	
		
		<section class="content">
			<form id="normalApprovalForm" method="post" enctype="multipart/form-data">						
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">							
							<!-- 지출결의서 -->
							<div class="card card-outline card-info" id="normal_div">
								<div class="card-header" >
									<h3 class="card-title" >지출결의서</h3>
								</div>
								<div class="card-body">
									<table style="width:300px; font-size:0.8em; height:50px;" align="right">
										<tbody>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<tbody>
															<tr>															
																<th rowspan="2"  colspan="1">결재</th>
																<th class="emp_level" colspan="1">
																	<input type="text" class="emp_level0" id="emp_level1_0" name ="writerJob" value="${approval.writerJob}" readonly/>
																</th>																																																																
																<th class="emp_level" colspan="1">
																	<input type="text" class="emp_level1" id="emp_level1_1" name="job" readonly/>
																	</th>
																<th class="emp_level" colspan="1" >																
																	<input type="text" class="emp_level2" id="emp_level1_2" name="job" readonly/>																	
																</th>
																<th class="emp_level" colspan="1" >																
																	<input type="text" class="emp_level2" id="emp_level1_3" name="job" readonly/>																	
																</th>		
																<th class="emp_level" colspan="1" >																
																	<input type="text" class="emp_level2" id="emp_level1_4" name="job" readonly/>																	
																</th>																																						
															</tr>
															<tr>
																<td class="table emp_name" colspan="1" >
																	<input type="text" class="emp_name0" id="emp_name0" name="lineName" value="${approval.writerName}" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm0"  readonly/>
																	</div>																	
																</td>
																<td class="table emp_name" colspan="1">
																	<input type="text" class="emp_name1" id="emp_name1_1" name="lineName" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm1" readonly/>
																	</div>
																</td>
																<td class="table emp_name" colspan="1">
																	<input type="text" class="emp_name2" id="emp_name1_2" name="lineName" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm2" readonly/>
																	</div>
																</td>
																<td class="table emp_name" colspan="1">
																	<input type="text" class="emp_name3" id="emp_name1_3" name="lineName" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm3"  readonly/>
																	</div>
																</td>
																<td class="table emp_name" colspan="1">
																	<input type="text" class="emp_name4" id="emp_name1_4" name="lineName" readonly/>
																	<div class="confirm" id="divConfirm0">
																		<input type="text" class="confirm-input" id="confirm4" readonly/>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<table class="table table-bordered" id="process_table">
														<tbody>
															<tr>
																<th rowspan="2"  scop="col">협조</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_1" name="cooJob" value="${approval.cooJob}" readonly/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_2" disabled/>
																</th>
																<th class="table coo_level"  scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_3" disabled/>
																</th>
																<th class="table coo_level" scop="col">
																	<input type="text" class="coo_level1" id="coo_level1_4" disabled/>
																</th>											
															</tr>
															<tr>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name1_1" id="coo_name1_1" name="cooName" value ="${approval.cooName}" readonly/>
																</td>
																<td class="table coo_name"  scop="col">
																	<input type="text" class="coo_name1_2" id="coo_name1_2" disabled/>
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name1_3" id="coo_name1_3" disabled/>
																</td>
																<td class="table coo_name" scop="col">
																	<input type="text" class="coo_name1_3" id="coo_name1_4" disabled/>
																</td>										
															</tr>
														</tbody>
													</table>
												</td>											
											</tr>										
										</tbody>
									</table>							
									<table width="100%" style="font-size:0.8rem" vertical-align="middle" >
										<tr>
											<td>
												<table class="table table-bordered" id="detail_table">
													<tbody>
													<tr height="30px">
														<th width="10%" colspan="1">
															수신참조 												
														</th>
														<th colspan="11" style="text-align:left !important;">
														<div class="input-group" style="width:30% !important;">														
															<input type="text" id="ccName1" class="form-control" name="ccName" width="30%" style="font-size:0.8rem"/>	
														</div>
														</th>
													</tr>
													<tr>
														<td colspan="1">
															지출형식
														</td>
														<td colspan="11">
																<input type="text" name="exForm" id="exForm" value="${ ae.exForm }"/>
															<c:if test="${ae.exCommon eq 'Y' }">															
																<span>공통경비</span>
															</c:if>		
														</td>
													</tr>
													<tr>
														<th colspan="1">
															일자
														</th>
														<td colspan="3">
															<input type="text" id="createDate" class="form-control"  style="font-size:0.8rem" value="${approval.createDate}" />
														</td>
														<th colspan="1">
															부서
														</th>
														<td colspan="3">
															<input type="text" name="userDept" id="userDept" class="form-control" value="${approval.deptName}" style="font-size:0.9em"/> 
														</td>
														<th colspan="1">
															이름
														</th>
														<td colspan="3">
														 	<input type="text" id="fieldWriter1" class="form-control" style="font-size:0.8rem" value="${approval.writerName}" />
														</td>
													</tr>
													<tr>
														<td colspan="1">
															제목
														</td>
														<td colspan="11">
															<input type=text class="form-control" id="ap_title" name="ap_title" value="${approval.title}"/>
														</td>
													</tr>
													<tr id="temp_hidden">
														<td colspan="2">
															지급유형
														</td>
														<td colspan="4">
															<input type=text class="form-control" id="corpor_select" name="exType" style="font-size:0.8rem"/>
														</td>
														<td colspan="2">
															<span id='exNum'>지급번호</span>
														</td>
														<td colspan="4">
															<input type=text class="form-control" id="card_select" name="exNum" style="font-size:0.8rem"/>
														</td>
													</tr>
													
													<tr>
														<th colspan="1">
															지출일자
														</th>
														<th colspan="2">
															내용
														</th>
														<th colspan="1">
															금액
														</th>
														<th colspan="2">
															업체명
														</th>
														<th colspan="1">
															지급은행
														</th>
														<th colspan="2">
															계좌번호(-포함)
														</th>
														<th colspan="1">
															예금주
														</th>
														<th colspan="1">
															지출부서
														</th>
														<th colspan="1">
															비고
														</th>														
													</tr>										
													<tr name="exRow">
														<td colspan="1">															
															<input type="text" class="form-control" name="exDate" id="exDate1" style="font-size:0.8rem"/>
														</td>
														<td colspan="2">
															<input type="text" class="form-control" id='exContent_select1' name="exContent" style="font-size:0.8rem"/>
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="price1" name="price" style="font-size:0.8rem"/>
														</td>
														<th colspan="2">
															<input type="text" class="form-control" id="accountName1" name="accName" class="form-control" style="font-size:0.8rem">											
														</th>
														<td colspan="1">
															<input type="text" class="form-control" id="exBank1" name="bankName" class="form-control" style="font-size:0.8rem">
														</td>
														<td colspan="2">
															<input type="text" class="form-control" id="accountNum1" name="accNum" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="accHolder1" name="accHolder" style="font-size:0.8rem">
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="exDept1" name="exDept" style="font-size:0.8rem"/>
														</td>
														<td colspan="1">
															<input type="text" class="form-control" id="exNote1" name="note" style="font-size:0.8rem">
														</td>					
													</tr>
													<tr>
														<th colspan="1">
															합계
														</th>
														<td colspan="11" >
															<input type="text" id="sumTd" class="form-control"/>
														</td>
													</tr>													
													<tr>
														<th colspan="1">
															결재문서첨부
														</th>
														<td colspan="11">
															<select multiple class='form-control' id="exfile_select">
															</select>
														</td>
													</tr>								
													<tr>
														<td colspan="12">
															${approval.content}
														</td>
													</tr>
													<tr>
														<td colspan="12">															
															<div class="btn btn-default btn-file btn-xs">
											                    <i class="fas fa-paperclip"></i> 파일이름									                    
									                  		</div> 
														</td>
													</tr>
													<tr>
														<th colspan="1">
															<b>결재로그</b>
														</th>
														<td colspan="11">
															<span id="approval_log">
																<strong>[${ approval.createDate }]</strong>
																&nbsp;${ approval.deptName }&nbsp;${ approval.writerName }&nbsp;${ approval.writerJob }
																<b>제출</b> 
															</span>
														</td>
													</tr>
												
													<tr>
														<th colspan="1">
															<b>결재의견</b>
														</th>
														<td colspan="11">
															<span id="span_comment">																
															</span>
														</td>
													</tr>												
													<tr id="commentBox">
														<th colspan="1">
															<b>의견작성</b>
															<br>
															(250자 이내)
														</th>
														<td colspan="10">
															<textarea id="approval_comment" style="height:100px; width:100%" class="form form-control" name="commentText"></textarea>
														</td>
														<td colspan="1">
															<button type="button" class="btn btn-primary" onclick="writeComment('${approval.apNo}');">등록</button>
														</td>
													</tr>
													</tbody>												
												</table>
											</td>
										</tr>
									</table>
								</div>
							</div>																						
						</div>
					</div>
				</div>
							<div class="card-footer">
								<div class="float-left">
									<button id="backBtn" type="button" class="btn btn-secondary btn-sm" onclick="goBack();">목록</button>
								</div>
								<div class="float-right">					
									<button id="confirmBtn" type="button" class="btn btn-success btn-sm" onclick="confirmApproval();">결재</button>
									<button id="returnBtn" type="button" class="btn btn-danger btn-sm" onclick="returnApproval();">반려</button>
								</div>
							</div>
				
			</form>
		</section>
	</div>
	<jsp:include page="../common/footer.jsp"/>




<!---------- script------------>
	<!-- 결재라인 -->
	<script>		
		var arr = new Array();
		<c:forEach items="${ lineList }" var="line">
			arr.push({job:"${line.jobName}", name:"${line.empName}", number:"${line.empNo}", lineNo:"${line.lineNo}",
					  status:"${line.confirmStatus}"});
		</c:forEach>
		
		$("#confirm0").append("${approval.writerName}");
		
		var n=1;
		var user = "${ loginEmpNo }";
		var progress = "${ approval.progress }";
		var writer = "${ approval.writer }";
		
		for(var i=0;i<arr.length;i++){
			$('input[id="emp_level1_'+n+'"]').val(arr[i].job);
			$('input[id="emp_name1_'+n+'"]').val(arr[i].name);
			
			if(arr[i].lineNo <= arr[i].status){
				$('#confirm'+n).val(arr[i].name);
			}
			n++;
		}
		
		for(var i=0;i<arr.length;i++){
			if(user == arr[i].number && progress == '진행중'){				
				$("#confirmBtn").show();
				$("#returnBtn").show();
				break;
			}else {
				$("#confirmBtn").hide();
				$("#returnBtn").hide();
			}
		}	
		
		for(var i=0; i<arr.length; i++){
			if(user == arr[i].number || user == writer ){
				$("#commentBox").css("display",'');
			} else {
				$("#commentBox").attr("display",'none');
			}
		}
	</script>
	<!-- 수신참조 -->
	<script>
		var deptName = null;
		var ccDept = null;
		var memberName = null;
		var ccMember = null;
		<c:choose>
			<c:when test="${ not empty apCC.ccName }">
				deptName = "${apCC.ccName}"
				ccDept = "${apCC.ccDept}"				
			</c:when>
			<c:when test="${ not empty apCC.ccName }">
				memberName = "${ apCC.ccName }"
				ccMember = "${apCC.ccMember}"
			</c:when>	
		</c:choose>
		
		if(deptName != null){
			$('input[id="ccName1"]').val(deptName);
			$('input[id="ccCode1"]').val(ccDept);
		} else if (memberName != null){
			$('input[id="ccName1"]').val(memberName);
			$('input[id="ccCode1"]').val(ccMember);
		}
	
	</script>
	
	<script>
		$(function(){
			
			var exForm = "${ ae.exForm }";
					
			if('${ ae.exForm }' == '법인카드') {
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
			}
			
			if('${ ae.exForm }' == '현금가지급'){
				$('input[name="accNum"]').attr("disabled",true);
				$('input[name="accHolder"]').attr("disabled",true);
				
			}
			
			if('${ ae.exCommon }' == 'Y') {
				$("input[name='exDept']").attr('disabled',true);
			}	
		
		});
		
	</script>

	<script>
		$(function(){	
			var arr = new Array();
			<c:forEach items="${ adList }" var="ad">
						
				arr.push({date:"${ad.exDate2}", type:"${ad.exType}", cardNum:"${ad.exNum}",
						  content:"${ad.exContent}", price:"${ad.price}", accName:"${ad.accName}", bank:"${ad.bankName}",
						  accNum:"${ad.accNum}", holder:"${ad.accHolder}", dept:"${ad.exDept}", note:"${ad.note}"});
				
				</c:forEach>
			
			console.log(arr);
			
			$("#corpor_select").val(arr[0].type);
			$("#card_select").val(arr[0].cardNum);
			
			

			
			var n=1;
			var addRow = null;
			
			for(var i=1; i<arr.length; i++){
				n++;
				var addRow = 
				'<tr name="exRow">'+
					'<td colspan="1">'+															
						'<input type="text" class="form-control" name="exDate" id="exDate'+n+'" style="font-size:0.8rem"/>'+
					'</td>'+
					'<td colspan="2">'+
						'<input type="text" class="form-control" id="exContent_select'+n+'" name="exContent" style="font-size:0.8rem"/>'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="price'+n+'" name="price" style="font-size:0.8rem"/>'+
					'</td>'+
					'<th colspan="2">'+
						'<input type="text" class="form-control" id="accountName'+n+'" name="accName" class="form-control" style="font-size:0.8rem">'+											
					'</th>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="exBank'+n+'" name="bankName" class="form-control" style="font-size:0.8rem">'+
					'</td>'+
					'<td colspan="2">'+
						'<input type="text" class="form-control" id="accountNum'+n+'" name="accNum" style="font-size:0.8rem">'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="accHolder'+n+'" name="accHolder" style="font-size:0.8rem">'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="exDept'+n+'" name="exDept" style="font-size:0.8rem"/>'+
					'</td>'+
					'<td colspan="1">'+
						'<input type="text" class="form-control" id="exNote'+n+'" name="note" style="font-size:0.8rem">'+
					'</td>'+					
				'</tr>';
				
				var trHtml = $("tr[name='exRow']:last");
				trHtml.after(addRow);
				
				if('${ ae.exForm }' == '법인카드') {
					$('input[name="accNum"]').attr("disabled",true);
					$('input[name="accHolder"]').attr("disabled",true);
				}
				
				if('${ ae.exForm }' == '현금가지급'){
					$('input[name="accNum"]').attr("disabled",true);
					$('input[name="accHolder"]').attr("disabled",true);
					
				}
				
				if('${ ae.exCommon }' == 'Y') {
					$("input[name='exDept']").attr('disabled',true);
				}	
			}
			
			var k = 2;
			
			for(var i=0; i<arr.length; i++){
				if(i==0){
					$("#exDate1").val(arr[i].date);
					$("#exContent_select1").val(arr[i].content).prop("selected", true);
					$("#price1").val(arr[i].price);
					$("#accountName1").val(arr[i].accName);
					$("#exBank1").val(arr[i].bank).prop("selected", true);
					$("#accHolder1").val(arr[i].holder);
					$("#accountNum1").val(arr[i].accNum);
					$("#exDept1").val(arr[i].dept);
					$("#exNote1").val(arr[i].note);
					
				}else {
					$('#exDate'+k).val(arr[i].date);
					$('#exContent_select'+k).val(arr[i].content).prop("selected",true);
					$('#price'+k).val(arr[i].price);
					$('#accountName'+k).val(arr[i].accName);
					$('#exBank'+k).val(arr[i].bank).prop("selected", true);
					$('#accountNum'+k).val(arr[i].accNum);
					$('#accHolder'+k).val(arr[i].holder);
					$('#exDept'+k).val(arr[i].dept);
					$('#exNote'+k).val(arr[i].note);
				}
			}
		});
	</script>
	
	<script>
	$(function(){
		var cnt = $('input[id^="price"]').length; 
		var sum = 0;
		
		for(var i=1; i<=cnt; i++){				
			sum += parseInt($('input[id^="price'+i+'"]').val());				
		};
		
			$("#sumTd").val(sum);	
	})	
	
	</script>

	<!-- comment  -->
	<script>
		var arr = new Array();
		<c:forEach items="${ cmList }" var="cm">
			arr.push({writer:"${cm.cmName}", dept:"${cm.cmDept}", job:"${cm.cmJob}", create:"${cm.commentDate}",
					  content:"${cm.comment}"});
		</c:forEach>
	
		var value ="";
		
		for(var i=0; i<arr.length; i++){
			value += '<strong>['+ arr[i].create +']</strong>&nbsp;' +
			arr[i].dept +'&nbsp;'+ arr[i].writer +'&nbsp;'+arr[i].job +'<br>'+ 
			arr[i].content +'<br>'+'<hr color="gray">';
		}
		
		$("#span_comment").html(value);
	
	
	 	function writeComment(apNo){
	 		
	 		var comment = $("textarea[id='approval_comment']").val();
	 		
	 		console.log(apNo);
	 		console.log(comment);
	 		
	 		$.ajax({
	 			url: "insertComment.ea",
	 			type: "post",
	 			data :{
	 				comment : comment,
	 				apNo : apNo
	 			},
	 			success: function(list){
	 				
	 				var value = "";
	 				
 					$.each(list, function(i, obj){
 						value += '<strong>['+ obj.commentDate +']</strong>&nbsp;' +
						obj.cmDept +'&nbsp;'+obj.cmName +'&nbsp;'+obj.cmJob +'<br>'+ 
						obj.comment +'<br>'+'<hr color="gray">';
 					});
 					
 					console.log("ajax 통신 성공")
 					console.log(list)
 					
 					$("#span_comment").html(value);
 					$("#approval_comment").val('');
 				},
 				error:function(){
 					console.log("comment 등록 실패");
 				}
	 			 			
	 		});
	 	}	 
	 </script>



	<script>

		var arr = new Array();
		<c:forEach items="${ lineList }" var="line">
			arr.push({job:"${line.jobName}", name:"${line.empName}", number:"${line.empNo}", lineNo:"${line.lineNo}",
					  status:"${line.confirmStatus}"});
		</c:forEach>
		
		var empNo = '${ loginEmpNo }';
		var flag;	
		var apNo = ${approval.apNo}
		
		function goBack(){									
				location.href= "<%=request.getContextPath()%>/myNormal.ea";
					
		}
		
		function confirmApproval(){					
				
				for(var i=0; i<arr.length; i++){
					if(empNo == arr[arr.length-1].number){
						flag = 1;
					} else {
						flag = 2;
					}
				}

				location.href= "<%=request.getContextPath()%>/confirmApproavl.ea?apNo="+apNo+"&flag="+flag;
				
		}
		
		function returnApproval(){						
				location.href= "<%=request.getContextPath()%>/returnApproavl.ea?apNo="+apNo;
				
		}
		
		
	</script>
	
</body>
</html>