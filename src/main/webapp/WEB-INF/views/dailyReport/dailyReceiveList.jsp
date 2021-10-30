<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수신함</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<style>
	.content-wrapper {
		overflow: auto;
	}
	#searchOfficeAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchOfficeAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchOfficeAddressBookTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchPersonalAddressBookTable>thead{
		border-bottom: 1px solid #DAE1E7;
	}
	#searchPersonalAddressBookTable>thead>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#searchPersonalAddressBookTable>tbody>tr>th	{
		background-color: #DAE1E7;
		width: 10%;
		text-align: center !important;
	}
	#dailyType{
		background: #DAE1E7;
	}
	#weeklyType{
		background: #00909E;
	}
	#monthlyType{
		background: #27496D;
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
							<i class="nav-icon fas fa-edit"></i><b> 일일보고 수신함</b>
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
								<b>수신함</b>
							</h6>
						</div>



							<div class="card-body">
								<div class="row">
									<div class="col-12">

								<div class="card" style="margin-bottom: 0px;">
										
										<table id="searchPersonalAddressBookTable">
										 <thead>
											<tr>
												<th>작성일자</th>
												<td>
													<div class="row mt-1 mb-1" style="margin-left: 0px;">
													&nbsp;&nbsp;
													<button type="button" class="btn btn-default btn-sm" style="width: 100px;">1일</button>&nbsp;
													<button type="button" class="btn btn-default btn-sm" style="width: 100px;">1주</button>&nbsp;
													<button type="button" class="btn btn-default btn-sm" style="width: 100px;">1개월</button>&nbsp;
													<button type="button" class="btn btn-default btn-sm" style="width: 100px;">6개월</button>
													<input type="date" class="date"> date가 못생겼넹...
													</div>
												</td>
											</tr>
											</thead>
										<tbody>
											<tr>
												<th>검색</th>
												<td>
												<form action="searchOfficeAddressBookEmployee.adb">
												<div class="row mt-1 mb-1" style="margin-left: 0px;">
														&nbsp;&nbsp;
														<button id="allPersonSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllPeronalAddressBookEmployee();">전체검색</button>
														&nbsp;&nbsp;
														
															<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																<option value="allType">전체</option>
																<option value="deptType" >부서</option>
																<option value="empNoType">사번</option>
																<option value="empNameType">이름</option>
																<option value="ePhoneType">내선번호</option>
																<option value="emailType">이메일</option>
															</select>
															
															&nbsp;&nbsp;
															<div class="input-group" style="width: 30%;">
																<input type="search" id="searchInput"
																	class="form-control form-control-sm"
																	placeholder="검색어를 입력하세요." name="searchPerson" value="${ search }">
																<div class="input-group-append">
																	<button type="submit" class="btn btn-sm btn-default">
																		<i class="fa fa-search"></i>
																	</button>
																</div>
															</div>
														</div>
													</form>
												</td>
											</tr>
											</tbody>
										</table>
									</div>										


										

									</div>
								</div>
								
								<hr>
								
								<div class="row">
									<div class="col-12" style="height: 450px">
										<table class="table table-sm text-center" >
										<caption style="caption-side:top">* 정렬 기준 : <span id="sortOption">
											<c:set var="now" value="<%=new java.util.Date()%>" />
											<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd" /></c:set> 
											<c:out value="${sysdate}" />
										</span></caption>
											<thead>
												<tr>
													<th style="width: 5%;">NO.</th>
													<th style="width: 10%;">보고 유형</th>
													<th style="width: 20%">제목</th>
													<th style="width: 10%">작성자</th>
													<th style="width: 10%;">직위</th>
													<th style="width: 10%;">부서</th>
													<th style="width: 10%;">파일</th>
													<th style="width: 5%">열람 여부</th>
													<th style="width: 15%;">작성일</th>
													<th style="width: 10%;">발송 유형</th>
													
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${dailyReportList}" var="dailyReportList" varStatus="status">
													<tr>
														<td>${status.index+1}</td>
														
														<c:if test="${ dailyReportList.drCategory == 'D' }">
															<td><span class="badge" id="dailyType">일일보고</span></td>
														</c:if>
														<c:if test="${ dailyReportList.drCategory == 'W' }">
															<td><span class="badge" id="weeklyType">주간보고</span></td>
														</c:if>
														<c:if test="${ dailyReportList.drCategory == 'M' }">
															<td><span class="badge" id="monthlyType">월간보고</span></td>
														</c:if>
														
														<td>${ dailyReportList.drTitle }</td>
														<td>${ dailyReportList.writerName }</td>
														<td>${ dailyReportList.jobName }</td>
														<td>${ dailyReportList.deptDname}</td>
														<c:if test="${ !empty dailyReportList.drAttachOrigin }">
															<td><i class="bi bi-paperclip"></i></td>
														</c:if>
														<c:if test="${ empty dailyReportList.drAttachOrigin}">
															<td></td>
														</c:if>
														
														<c:if test="${ dailyReportList.drConfirm == 'N'}">
															<td><i class="bi bi-envelope"></i></td>
														</c:if>
														<c:if test="${ dailyReportList.drConfirm == 'Y'}">
															<td><i class="bi bi-envelope-open"></i></td>
														</c:if>
														<td><fmt:formatDate value="${ dailyReportList.drCreateDate }" pattern="yyyy/MM/dd HH:mm"/></td>
														
														<c:if test="${ dailyReportList.drReceiverNo != 0 and dailyReportList.drRef == 0}">
															<td><span class="badge badge-info">보고</span></td>
														</c:if>
														<c:if test="${ dailyReportList.drReceiverNo == 0 and dailyReportList.drRef != 0 }">
															<td><span class="badge badge-warning">참조</span></td>
														</c:if>
														<c:if test="${ dailyReportList.drReceiverNo != 0 and dailyReportList.drRef != 0 }">
															<td><span class="badge badge-info">보고</span> <span class="badge badge-warning">참조</span></td>
														</c:if>
													</tr>
												</c:forEach>
																								
											</tbody>
										</table>
									</div>
								</div>

								<div id="pagingArea">
						                <ul class="pagination">
						                	<c:choose>
						                		<c:when test="${ pi.currentPage ne 1 }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                	
						                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						                    	<c:choose>
							                		<c:when test="${ pi.currentPage ne p }">
						                    			<li class="page-item"><a class="page-link" href="${pageURL}?currentPage=${ p }">${ p }</a></li>
							                		</c:when>
							                		<c:otherwise>
							                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							                		</c:otherwise>
							                	</c:choose>
						                    </c:forEach>
						                    
						                    
						                    <c:choose>
						                		<c:when test="${ pi.currentPage ne pi.maxPage }">
						                			<li class="page-item"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item disabled"><a class="page-link" href="${pageURL}?currentPage=${ pi.currentPage+1 }">Next</a></li>
						                		</c:otherwise>
						                	</c:choose>
						                </ul>
						            </div>


							</div>

							<div class="card-footer">
							
							</div>

					</div>
				</div>
			</div>
		
		
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	
</body>
</html>