<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.irs--flat .irs-bar	{
	background-color : lightpink !important;
}
.irs-min , .irs-max{
	visibility: hidden !important;
}

.workintTitile{
	font-size : 12px;
	margin-bottom : -20px !important;
}

.progress-bar{
	height : 15px;
	background-color : lightpink !important;
	border-radius: 5px;
}

.progress{
border-radius: 5px;
}

</style>
  
</head>
<body >


	<div id="cardAttendance">
      <div class="card card-info card-outline" style="width: 300px;">
             <div class="card-header" >            
               <div class="float-left">내 정보</div>
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
	  		  <div class="card  card-outline card-outline-tabs" style="margin-top: -15px;">
	              <div class="card-header p-0 border-bottom-0">
	                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
	                  <li class="nav-item col-sm-6 text-center">
	                    <a class="nav-link active" id="custom-tabs-four-unchecked-tab" data-toggle="pill" href="#custom-tabs-four-unchecked" role="tab" aria-controls="custom-tabs-four-unchecked" aria-selected="true">근태정보</a>
	                  </li>
	                  <li class="nav-item col-sm-6 text-center">
	                    <a class="nav-link" id="custom-tabs-four-recv-tab" data-toggle="pill" href="#custom-tabs-four-recv" role="tab" aria-controls="custom-tabs-four-recv" aria-selected="false">휴가정보</a>
	                  </li>
	                </ul>
	              </div>
	           </div>	
	           <!--탭 -->
	           
              <!-- card body -->
              <div class="card-body">
	              <div class="tab-content" id="custom-tabs-four-tabContent">
		              <div class="tab-pane fade show active" id="custom-tabs-four-unchecked" role="tabpanel" aria-labelledby="custom-tabs-four-unchecked-tab">
		                  <!-- 근태정보 -->
	                      <div class="container-fluid text-center" style="margin-top:-7px;"> 
	                      	          
		                     <h5><span id="now"></span></h5>                     
		                  </div>
		                  <div class="container-fluid text-center">
							  <button  class="btn btn-outline-secondary  btn-sm" onclick="insertTime(1);" >출근</button>						                  
			                  <input type=text class="workingtime" id="inTime" value="${attendance.inTime}" readonly>
			                  <button  class="btn btn-outline-secondary  btn-sm "onclick="insertTime(2);" >퇴근</button>
			                  <input type=text class="workingtime" id="outTime" value="${attendance.outTime}" readonly>
		                  </div>
		                  <br>
		                 <div class="irs-wrapper complete">
		                  	<div class="workintTitile">소정근로시간</div>
	                        <input id="range_1" type="text" name="range_1" value="9" disabled>
	                      </div>
	                      <div class="progress">
							  <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
							  70%</div>
							</div>
	                      <br>	                
                     </div>
		                  
		              
		              <div class="tab-pane fade" id="custom-tabs-four-recv" role="tabpanel" aria-labelledby="custom-tabs-four-recv-tab">
		                  <!-- 휴가정보 -->
		                  	휴가정보 나와라 얍
		              </div>		         
	              </div>
             </div>
             <!-- card body -->
      		  
              				
                          
        </div>

  
  </div>
                 
  





<!-- Bootstrap slider -->
<script src="./resources/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<script src="./resources/plugins/bootstrap-slider/bootstrap-slider.min.js"></script>
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
		if(inTime == "00:00:00"){
			alert("출근시간이 등록되었습니다")
			location.href="intime.ps?inOutTime=" + inOutTime;		
		}else{
			alert("출근시간이 등록되어있습니다")
		}	
	}else{
		if(outTime == "00:00:00"){
			alert("퇴근시간이 등록되었습니다")
			location.href="outTime.ps?inOutTime=" + inOutTime;		
		}else{
			alert("퇴근시간이 등록되어있습니다")
		}			
	}
	
}
</script>

<script>
  $(function () {
    $('#range_1').ionRangeSlider({
       min: 0,
       max: 10,
       postfix   : '시간'

    })

  })
    $(function () {
    $('#range_2').ionRangeSlider({
      type      : 'single',
      step      : 100,
      postfix   : '시간',
      from      : 55000,
      hideMinMax: true,
      hideFromTo: false
    })

  })
</script>
<script>
// 시간을 출력
function realTimer() {

   const nowDate = new Date();
   const year = nowDate.getFullYear();
   const month= nowDate.getMonth() + 1;
   const date = nowDate.getDate();
   const hour = nowDate.getHours();
   const min = nowDate.getMinutes();
   const sec = nowDate.getSeconds();
   document.getElementById("now").innerHTML = 
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