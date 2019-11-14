<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.vo.Member" %>
<%
	String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");

    String data_a= request.getParameter("data_a"); //#.member //#.member의 name

    

    String[] group_data_a_String=  data_a.split("_");


    //Member member= (Member) data_a;
 
%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="<%=cp%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=cp%>/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
   <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="topbar.jsp"></jsp:include>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">자기소개서 디테일</h1>
     
          
          
          </div>
          
        
          
          <div style="float:right">
          
           <a href="#" class="btn btn-success btn-circle btn-lg" title="합격" onclick="pass();">
                    <i class="fas fa-check"></i>
                    </a>
          
          <a href="#" class="btn btn-danger btn-circle btn-lg" title="불합격" onclick="fail();">
                    <i class="fas fa-times"></i>
                    </a>
          </div>
          
          
          
       

	
       <div class="row">
       
       <!-- 이름 card -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">지원자 이름</div>
                      <!-- 밑 윤진호 부분에 json에서 이름 가져와 넣을것 -->
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><%=group_data_a_String[0]%></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-male fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Area Chart -->
            <div class="col-xl-4 col-lg-10">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">지원자 사진</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>   
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <div>
                <!-- 이 부분 src="~~" 에 db에서 이미지 꺼내서 넣어주면 됨. -->
                  	<img class="img-responsive" src="/imgcode/<%=group_data_a_String[2]%>">
                  </div>
                  
    
                  </div>
                </div>	
              </div>
               <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary"> 자기소개서 내용 </h6>
                </div>
                <div class="card-body">
                <!--  밑의 부분에 db에서 자소서 내용 전부 꺼내서 넣어주면 됨. -->
                  <p>   공모전 열심히 했고 토익 만점입니다. 성실합니다. 학점 높습니다. 자바스크립트 잘합니다. 커피 잘 탑니다.</p>
                  <p class="mb-0">열심히 할게용~</p>
                </div>
              </div>
              
            </div>
            
             <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">스펙</h6>
                </div>
                <div class="card-body">
                  <h4 class="small font-weight-bold">학점 <span class="float-right">4.5</span></h4>
                  <div class="progress mb-4">
                 <%--  아래 쪽 제일 끝 3.5 라고 박아 넣은 부분에 json 에서 값꺼내서 넣어주면 될거임. ${학점} 이런 식으로. 
                 나머지 것들의 1회,2회 등등도 다 json에서 직접 값 꺼내서 박아주면 됨. width 라는 변수로 게이지가 몇퍼센트 차냐를 결정해줄건데
                 맨 밑의 스크립트 부에서 페이지 로드할떄 다 설정되게끔 해놓았음.
                 --%>
                    <div id="progress_bar1" class="progress-bar bg-danger" role="progressbar"  aria-valuemin="0" aria-valuemax="100"><%=group_data_a_String[4]%></div>
                  </div>
                   <h4 class="small font-weight-bold">해외경험 <span class="float-right">5회</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar2"  class="progress-bar bg-success" role="progressbar"   aria-valuemin="0" aria-valuemax="100"><%=group_data_a_String[7]%>회</div>
                  </div>
                  <h4 class="small font-weight-bold">수상횟수 <span class="float-right">5회</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar3" class="progress-bar bg-warning" role="progressbar"   aria-valuemin="0" aria-valuemax="100"><%=group_data_a_String[9]%>회</div>
                  </div>
                  <h4 class="small font-weight-bold">자격증 <span class="float-right">5개</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar4" class="progress-bar" role="progressbar"   aria-valuemin="0" aria-valuemax="100"><%=group_data_a_String[6]%>개</div>
                  </div>
                  <h4 class="small font-weight-bold">토익 <span class="float-right">990점</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar5" class="progress-bar bg-info" role="progressbar"  aria-valuemin="0" aria-valuemax="100"><%=group_data_a_String[5]%>점</div>
                  </div>
                  <h4 class="small font-weight-bold">인턴경험 <span class="float-right">5회</span></h4>
                  <div class="progress">
                    <div id="progress_bar6" class="progress-bar bg-success" role="progressbar"   aria-valuemin="0" aria-valuemax="100"><%=group_data_a_String[8]%>회</div>
                  </div>
                </div>
              </div>
              
          
            
              <div class="row">

            <!-- Area Chart -->
             <!-- 학점 분포도라고 넣어놓은 부분인데 이건 표시할 방법이 없는듯?
             나중에 삭제하던지 아니면 적당히 값을 만져서 대충 표시해주던지 해야할 듯. -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">입사 후 퍼포먼스</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                 <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이 지원자와 비슷한 유형의 자기소개서를 제출한 지원자는 입사 후 인사고과 점수에서 평균적으로 아래와 같은 퍼포먼스를 보였습니다.</div>
                  <div class="chart-area">
                    <canvas id="myAreaChart3"></canvas>
                  </div>
                </div>
              </div>
                 <!-- Approach -->	
                 
                 <!-- 내가 말했던 입사 후 퍼포먼스 부분인데 어떻게 출력해줄건지 추후의 상의가 더 필요할 듯. -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary"> 빈 카드 </h6>
                </div>
                <div class="card-body">
                  <p>나중에 어떤 내용이 들어갈지도 모름</p>
                </div>
              </div>
              
            </div>
            
             <!-- Donut Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">입사 후 직급 현황</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                
                  <div class="chart-pie pt-4">
                    <canvas id="myPieChart"></canvas>
                  </div>
                  <hr>
                   <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이 지원자와 비슷한 유형의 자기소개서를 제출한 지원자들의 입사 후 현재 직위는 위와 같습니다.</div>
                </div>
              </div>
            </div>
          </div>
            

         
          </div>
           
            
    

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; 자기소개서 필터링 프로그램 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<%=cp%>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%=cp%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%=cp%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%=cp%>/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%=cp%>/resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%=cp%>/resources/js/demo/chart-area-demo_detail.js"></script>
  <script src="<%=cp%>/resources/js/demo/chart-pie-demo.js"></script>
  
  <!-- SweetAlert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>

<script type="text/javascript">
$(document).ready(function() {
	/* 위에서부터 순서대로 학점,해외경험,수상횟수,자격증,토익,인턴경험 임. 
	학점은 4.5, 토익은 990, 나머지는 5회가 만점으로 해놨음.
	그에 맞게 width만 수정해주면 페이지 로드되면서 알아서 progress bar 게이지 채움 . */
	
	var width1=70;
	var width2=20;
	var width3=40;
	var width4=60;
	var width5=80;
	var width6=100;
	/* 예시
	var width1 = $(학점)/ 4.5; 
	var width5 = $(토익) / 990; */
	
	
	 $('#progress_bar1').css('width', width1 + "%");
	 $('#progress_bar2').css('width', width2 + "%");
	 $('#progress_bar3').css('width', width3 + "%");
	 $('#progress_bar4').css('width', width4 + "%");
	 $('#progress_bar5').css('width', width5 + "%");
	 $('#progress_bar6').css('width', width6 + "%");
	 
	 
	});
	
function pass()
{
	swal({
		  title: "정말로 합격시키겠습니까?",
		  text: "합격 시키면 되돌릴 수 없습니다!",
		  icon: "warning",
		  buttons: true,
		  //dangerMode: true,
		})
		.then((willPass) => {
		  if (willPass) {
			  /* ok 버튼 누르면 합격 진행할 것임
			  이 주석 위치에서 그 지원자에 해당하는 record를 db에서 합격표시 해주면 됨.
			  합격 처리하면 index 페이지로 돌아가는 것이 이상적이라고 판단했음.*/
			  swal("합격 처리하였습니다.","" ,"success")
				.then((value) => {  
					 
					location.href="index";
				});
		  } else {
		    swal("합격을 취소하셨습니다.");
		  }
		});
}

function fail()
{
	swal({
		  title: "정말로 탈락시키겠습니까?",
		  text: "탈락 시키면 되돌릴 수 없습니다!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willFail) => {
		  if (willFail) {
			  /* ok 버튼 누르면 탈락 진행할 것임
			  이 주석 위치에서 그 지원자에 해당하는 record를 db에서 탈락표시 해주면 됨.
			  탈락 처리하면 index 페이지로 돌아가는 것이 이상적이라고 판단했음.*/
			  swal("탈락 처리하였습니다.","" ,"success")
				.then((value) => {  

					location.href="index";
				});
		  } else {
		    swal("탈락을 취소하셨습니다.");
		  }
		});
}

</script>


