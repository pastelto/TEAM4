<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	#officeAddressBookTable {
		text-align: center !important;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">

						<h4>
							<i class="nav-icon fas fa-table"></i><b> 주소록</b>
						</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-12">
				
		            <div class="card card-info card-outline card-outline-tabs">
		              <div class="card-header p-0 border-bottom-0">
		                <ul class="nav nav-tabs" id="custom-tabs-addressBook-tab" role="tablist">
		                  <li class="nav-item">
		                    <a class="nav-link active" id="custom-tabs-officeAddressBook-tab" data-toggle="pill" href="#custom-tabs-officeAddressBook" role="tab" aria-controls="custom-tabs-officeAddressBook" aria-selected="true">사내 주소록</a>
		                  </li>
		                  <li class="nav-item">
		                    <a class="nav-link" id="custom-tabs-personalAddressBook-tab" data-toggle="pill" href="#custom-tabs-personalAddressBook" role="tab" aria-controls="custom-tabs-personalAddressBook" aria-selected="false">외부주소록</a>
		                  </li>
		                </ul>
		              </div>
		              
		              <div class="card-body">
						<div class="tab-content" id="custom-tabs-four-tabContent">
						
							<!-- 사내 주소록 탭 -->
							<div class="tab-pane fade show active" id="custom-tabs-officeAddressBook" role="tabpanel" aria-labelledby="custom-tabs-officeAddressBook-tab">
								<div class="card" style="margin-bottom: 0px;">
										
										<table id="searchOfficeAddressBookTable">
										 <thead>
											<tr>
												<th>추가</th>
												<td>
													<form action="#">
														<!-- <table id="addOfficeAddressBookEmployee" >
															<tr>
																<th style="height: 20px">이름</th>
																<td style="height: 20px"></td>
																<th style="height: 20px">부서</th>
																<td style="height: 20px"></td>
																<th style="height: 20px">내선번호</th>
																<td style="height: 20px"></td>
																<th style="height: 20px">이메일</th>
																<td style="height: 20px"></td>
																<td style="height: 20px"><button class="btn btn-sm">버튼</button></td>
															</tr>
														</table> -->
														<div class="input-group mt-1 mb-1">
															&nbsp;&nbsp;
													  		<div class="input-group-prepend">
															    <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
															      	부서 선택
															    </button>
															    <div class="dropdown-menu">
															      <a class="dropdown-item" href="#">Link 1</a>
															      <a class="dropdown-item" href="#">Link 2</a>
															      <a class="dropdown-item" href="#">Link 3</a>
															    </div>
															  </div>
														  <input type="text" class="form-control form-control-sm" placeholder="Username">
														</div>
													</form>
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
														<button id="allEmployeeSearchBtn" type="button" class="btn btn-default btn-sm" onclick="selectAllOfficeAddressBookEmployee();">전체검색</button>
														&nbsp;&nbsp;
														
															<select id="optionType" name="optionType" class="custom-select custom-select-sm" style="width: 10%;" onchange="deptSelect(this.value);">
																<option value="allType">전체</option>
																<option value="deptType" >부서</option>
																<option value="empNoType">사번</option>
																<option value="empNameType">이름</option>
																<option value="ePhoneType">내선번호</option>
																<option value="emailType">이메일</option>
															</select>
															<span id="deptTypeBlank"style="display:none">&nbsp;&nbsp;</span>
															<select id="deptTypeOption" name="deptTypeOption" class="custom-select custom-select-sm" style="width: 15%; display:none">
																<option value="A">경영지원본부</option>
																<option value="A1">인사팀</option>
																<option value="A2">총무팀</option>
																<option value="A3">재무회계팀</option>
																<option value="B">영업지원본부</option>
																<option value="B1">영업팀</option>
																<option value="B2">운영지원팀</option>
																<option value="C">사업본부</option>
																<option value="C1">디자인팀</option>
																<option value="C2">마케팅팀</option>
																<option value="C3">IT개발팀</option>
															</select>
															&nbsp;&nbsp;
															<div class="input-group" style="width: 30%;">
																<input type="search" id="searchInput"
																	class="form-control form-control-sm"
																	placeholder="검색어를 입력하세요." name="searchEmployee" value="${ search }">
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
									
									<!-- 주소록 리스트 -->
									<div class="col-12" style="overflow:auto; height: 450px">
									<table id="officeAddressBookTable" class="table table-sm">
									<caption style="caption-side:top">* 정렬 기준 : <span id="sortOption">전체</span></caption>
										<thead>
											<tr>
												<th style="width: 5%"></th>
												<th style="width: 10%">사번</th>
												<th style="width: 20%">이름</th>
												<th style="width: 10%">직급</th>
												<th style="width: 10%">부서</th>
												<th style="width: 10%">내선번호</th>
												<th style="width: 20%">이메일</th>
												<th style="width: 15%"></th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach items="${ officeAddresslist }" var="officeAddresslist">
							                    <tr>
							                    	<th><input type='checkbox' name='deleteAddressBook' id='deleteAddressBook'></th>
							                        <td>${ officeAddresslist.oabEnrollNO }</td>
							                        <td>${ officeAddresslist.empName} ( ${officeAddresslist.empEn} )</td>
							                        <td>${ officeAddresslist.jobName }</td>
							                        <td>${ officeAddresslist.deptDname }</td>
							                        <td>${ officeAddresslist.empEphone }</td>
							                        <td>${ officeAddresslist.empEmail }</td>
							                        <th>
							                        	<button id='sendMail' type='button' class='btn btn-default btn-xs'>메일발송</button>&nbsp;
							                        	<button id='workShare' type='button' class='btn btn-default btn-xs'>업무공유</button>
							                        </th>
							                    </tr>
						                    </c:forEach>
										
										</tbody>
									</table>
								</div>
								<!-- /.col -->

		                  	</div>
		                  
		                  	<!-- 외부 주소록 탭 -->
		                  	<div class="tab-pane fade" id="custom-tabs-personalAddressBook" role="tabpanel" aria-labelledby="custom-tabs-personalAddressBook-tab">

								<div class="card" style="margin-bottom: 0px;">
										
										<table id="searchPersonalAddressBookTable">
										 <thead>
											<tr>
												<th>추가</th>
												<td>
													<form action="#">
														<div class="input-group mt-1 mb-1">
															&nbsp;&nbsp;
													  		<div class="input-group-prepend">
															    <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
															      	부서 선택
															    </button>
															    <div class="dropdown-menu">
															      <a class="dropdown-item" href="#">Link 1</a>
															      <a class="dropdown-item" href="#">Link 2</a>
															      <a class="dropdown-item" href="#">Link 3</a>
															    </div>
															  </div>
														  <input type="text" class="form-control form-control-sm" placeholder="Username">
														</div>
													</form>
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
		              </div>
		              <!-- /.card -->
		            </div>
		          </div>
			
			</div>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	
	
</body>
</html>