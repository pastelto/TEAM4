<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorks - 미확인 업무</title>
<style>

#WorkShareTable {
	margin-left : 10%;
	margin-right : 10%;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="content-wrapper">
	
<!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>업무 공유</h1>
          </div>

        </div>
      </div><!-- /.container-fluid -->
    </section>
	<div class="section">
				
		<!-- 업무공유 상단 탭메뉴 -->
		<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" id="unread_tab" aria-current="page" href="javascript:goPage(0);">미확인내역</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="send_tab" href="javascript:goPage(1);">수신내역</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="receive_tab" href="javascript:goPage(2);">발신내역</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="temp_tab" href="javascript:goPage(3);">임시저장</a>
			  </li>
		</ul>

		    	<ul class="box1 b1">
					<li>
					<strong class="label1">검색조건</strong>
					<span class="sel1">
						<a href="javascript:void(0);" class="btn1" id="btn_all">전체보기</a>
						<select name="strkey" id="strkey">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							
								<option value="name_kor">작성자</option>
							
						</select>
						<input type="text" name="keyword" id="keyword" class="input_st1" onkeyup="if(event.keyCode==13) search();" maxlength="100">
						<input type="text" name="hiddenTxt" class="input_st1" style="display: none;">
						<a href="javascript:void(0);" class="btn1" id="btn_search">검색</a>
					</span>
					</li>
				</ul>
			</div>
	<!-- 업무 목록 리스트 테이블 -->
	<div class="row">
          <div class="col-10" id="WorkShareTable">
            <div class="card">
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead align="center">
                    <tr>
                      <th width="10px;">No.</th>
                      <th width="10px;">⭐</th>
                      <th width="500px;">제목</th>
                      <th width="50px;">발신인</th>
                      <th width="50px;">등록일</th>
                    </tr>
                  </thead>
                  <tbody align="center">
                    <tr>
                      <td>183</td>
                      <td>☆</td>
                      <td>업무 공유 제목 부분입니다.</td>
                      <td>김헬로 사원</td>
                      <td>21-10-15</td>
                    </tr>
                    <tr>
                      <td>219</td>
                      <td>☆</td>
                      <td>업무 공유 제목 부분입니다.</td>
                      <td>김헬로 사원</td>
                      <td>21-10-15</td>
                    </tr>
                    <tr>
                      <td>657</td>
                      <td>☆</td>
                      <td>업무 공유 제목 부분입니다.</td>
                      <td>김헬로 사원</td>
                      <td>21-10-15</td>
                    </tr>
                    <tr>
                      <td>175</td>
                      <td>☆</td>
                      <td>업무 공유 제목 부분입니다.</td>
                      <td>김헬로 사원</td>
                      <td>21-10-15</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
	
	
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
<!-- 스크립트  -->
<script>

</script>
</body>
</html>