<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | UI Sliders</title>

<!-- Ion Slider -->
<link rel="stylesheet" href="./resources/plugins/ion-rangeslider/css/ion.rangeSlider.min.css">
<!-- bootstrap slider -->
<link rel="stylesheet" href="./resources/plugins/bootstrap-slider/css/bootstrap-slider.min.css">
<style>


div[class*="workingBtn"] {
   display: inline-block;
}
.workingtime{
   width : 70px;
   text-align:center;
   margin-top: 5px;
   
   /*input 테두리 없애기*/
   	border:none;
	border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	border-color : white;
} 

input:focus {outline:none;}

#progressbar{
	height : 15px;
}


.workintTitile{
	font-size : 12px;
	margin-bottom : -20px !important;
}

.progress-bar{
	height : 15px;
	background-color : lightblue !important;
	border-radius: 5px;
	color : gray !important;
}

.progress{
border-radius: 5px;
}

#headerTitle, #noticeTable{
	font-size:small;
}
a[name='aTitle']{
	font-size:small;
}
#annual{
	font-size:small;
	background:#DAE1E7;
	padding : 5px;
}


</style>
  
</head>
<body >


	<div id="cardAttendance">
	
	
		<!-- 내정보 -->
      <div class="card card-info card-outline" style="width: 300px;">
             <div class="card-header" >            
               <div class="float-left" id="headerTitle">내 정보</div>
             </div>
			  
			  <!-- 개인정보 -->
              <div class="card-body box-profile">
                 <div class="text-center" style="margin-top:-5px; padding-bottom:15px;">
                    <i class="far fa-user-circle fa-2x"></i>
                 </div>
                 <h6  class="text-center">${loginUser.empName} ${loginUser.jobName}님 환영합니다</h6>
                 <p class="text-muted text-center">${loginUser.deptDname}</p>
              </div>    
        	
        	  <!-- 탭 -->	
	  		  <div class="card  card-outline card-outline-tabs" style="margin-top: -28px;">
	              <div class="card-header p-0 border-bottom-0">
	                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
	                  <li class="nav-item col-sm-6 text-center">
	                    <a class="nav-link active" id="custom-tabs-four-unchecked-tab" data-toggle="pill" href="#custom-tabs-four-unchecked" role="tab" aria-controls="custom-tabs-four-unchecked" aria-selected="true" name="aTitle">근태정보</a>
	                  </li>
	                  <li class="nav-item col-sm-6 text-center">
	                    <a class="nav-link" id="custom-tabs-four-recv-tab" data-toggle="pill" href="#custom-tabs-four-recv" role="tab" aria-controls="custom-tabs-four-recv" aria-selected="false" name="aTitle">휴가정보</a>
	                  </li>
	                </ul>
	              </div>
	           </div>	
	           <!--탭 -->
	           
              <!-- card body -->
              <div class="card-body" id="noticeCardBody">
	              <div class="tab-content" id="custom-tabs-four-tabContent">
		              <div class="tab-pane fade show active" id="custom-tabs-four-unchecked" role="tabpanel" aria-labelledby="custom-tabs-four-unchecked-tab">
		                  <!-- 근태정보 -->
	                      <div class="container-fluid text-center" style="margin-top:-10px; "> 
	                      	          
		                     <h5><i class="far fa-clock fa-sm"></i>&nbsp;<span id="nowTimes" ></span></<h5>                
		                  </div>
		                  <div class="container-fluid text-center">
							  <button  class="btn btn-outline-secondary  btn-sm" onclick="insertTime(1);" >출근</button>						                  
			                  <input type=text class="workingtime" id="inTime" value="${attendance.inTime}" readonly>
			                  <button  class="btn btn-outline-secondary  btn-sm "onclick="insertTime(2);" >퇴근</button>
			                  <input type=text class="workingtime" id="outTime" value="${attendance.outTime}" readonly>
		                  </div>
		                  <!-- 소정근로시간 -->
		                  <br>	
		              	  <div class="workintTitile" style="margin-top:-5px;">◽ 근로시간</div> 
		              	  <br>	
	                      <div class="progress">
							  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:20%">
							 	 35시간 0 분
							  </div>
						  </div> 
						 
						  <!-- 소정외근로시간 -->
	                      <div class="workintTitile" style="margin-top:5px;">◽소정외 근로시간</div> 
		              	  <br>	
	                      <div class="progress">
							  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:50%">
							 	 
							  </div>
						  </div> 	                
                     </div>
		                  
		              
		              <div class="tab-pane fade" id="custom-tabs-four-recv"  role="tabpanel" aria-labelledby="custom-tabs-four-recv-tab">
		                  <!-- 휴가정보 -->
		                  	<div class="card text-center" id="annual">
		                  		<span><b class="spanTag">입사일</b>&nbsp;&nbsp;${loginUser.empHire}</span>
		                  	</div>
		                  	<div class="card text-center" id="annual">
		                  		<span><b class="spanTag">지급연차</b>&nbsp;&nbsp;${annual.annual}일</span>
		                  	</div>
		                  	<div class="card text-center" id="annual">
		                  	    <span><b class="spanTag">사용연차</b>&nbsp;&nbsp;${annual.useAnnual}일</span>
		                  	</div>
		                  	<div class="card text-center" id="annual">
		                  		<span><b class="spanTag">잔여연차</b>&nbsp;&nbsp;${annual.leftAnnual}일</span>
		                  	</div>
		              </div>		         
	              </div>
             </div>
             <!-- card body -->
      		  
              				
                          
        </div>
        
        
        
		        <!-- 공지사항 -->
		          <div class="card card-info card-outline" style="width: 300px;">
		             <div class="card-header" >            
		               <div class="float-left" id="headerTitle">공지사항</div>
		             </div>
		              <div class="card-body" style="padding-top:5px;">
		                <table class="table table-hover" id="noticeTable" style="marign-top:-20px;">	
		                	<tbody>	                	
							<c:forEach items="${ noticeList }" var="n">
								<tr onclick="noticeNo(${ n.noticeNo });">
									<td style="border-top:none !important">◾ ${ n.noticeTitle }</td>
								</tr>
							</c:forEach>
							</tbody>	
		                </table>
		              </div>
				</div>
             
             
             
             
          

  
  </div>
                 
  





<!-- Bootstrap slider -->
<script src="./resources/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="./resources/plugins/bootstrap-slider/bootstrap-slider.min.js"></script>
<script>

function noticeNo(num){
	location.href = "detail.nt?bno="+ num;
	
}
</script>
<script>
function insertTime(num){	
	var nowDate = new Date();
	var hour = nowDate.getHours();
	var min = nowDate.getMinutes();
    var sec = nowDate.getSeconds();
    
    if(hour < 10) { hour = "0" + hour; }
    if(min < 10) { min = "0" + min; }
    if(sec < 10) { sec = "0" + sec; }
    var inOutTime= hour + ":" + min + ":" + sec ;

    var inTime = document.getElementById('inTime').value;
    var outTime = document.getElementById('outTime').value;
    
	if(num == 1){		
		
		if( hour > 15 || hour < 08 ){ //오후 3시부터 오전 7시까지는 출근등록을 할 수 없음			
			alert("지금은 출근시간을 등록할 수 없습니다")		
		}else{
			if(inTime == "00:00:00"){
				alert("출근시간이 등록되었습니다")
				 location.href="intime.ps?inOutTime=" + inOutTime; 		
			}else{
				alert("출근시간이 등록되어있습니다") //출근등록을 두번눌렀을때 방지
			}	
		}
		
	}else{
		
		if(inTime == "00:00:00"){ //출근등록을 안했을 때
			alert("출근시간을 먼저 등록해 주세요")
			
		}else if(hour > 23 || hour < 10 ){ //오전 12시부터 오전 9시까지는 퇴근등록을 할 수 없음		
			alert("지금은 퇴근시간을 등록할 수 없습니다")		
		}else{
			
			if(outTime == "00:00:00"){
				alert("퇴근시간이 등록되었습니다")
				 location.href="outTime.ps?inOutTime=" + inOutTime;	 
			}else{
				alert("퇴근시간이 등록되어있습니다")//퇴근등록을 두번눌렀을때 방지
			}
			
			
		}	
			
	}
	
}
</script>


<script>
document.addEventListener("DOMContentLoaded", function() {
    // 시간을 딜레이 없이 나타내기위한 선 실행
    realTimer();
    // 이후 0.5초에 한번씩 시간을 갱신한다.
    setInterval(realTimer, 100);
});

// 시간을 출력
function realTimer() {

   const nowDate = new Date();
   const year = nowDate.getFullYear();
   const month= nowDate.getMonth() + 1;
   const date = nowDate.getDate();
   const hour = nowDate.getHours();
   const min = nowDate.getMinutes();
   const sec = nowDate.getSeconds();
   document.getElementById("nowTimes").innerHTML = 
              hour + "시 " + addzero(min) + "분 " + addzero(sec) + "초";
}

// 1자리수의 숫자인 경우 앞에 0을 붙여준다.
function addzero(num) {
   if(num < 10) { num = "0" + num; }
   return num;

}

</script>
</body>
</html>