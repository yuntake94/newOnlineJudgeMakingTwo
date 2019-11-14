<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.vo.Member" %>
<%
	String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");


  Member user = (Member)session.getAttribute("login");
  System.out.println(user);
  //String name = user.getMyinfo().getName();
  String email = user.getEmail();
  System.out.println("dashboard");
  System.out.println("정상실행");
  //int uid = user.getUid();
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
            <h1 class="h3 mb-0 text-gray-800">DashBoard</h1>
     
          
          
          </div>
          
  
          
           <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 지원자 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">"${allmembernumber}"</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">오늘 새롭게 등록한 지원자 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">"${today_register_member_size}"</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">처리한 자기소개서
                      </div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">"${dashboardList.get(0).selfintroduction}"</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">지원자 문의사항</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">"${dashboardList.get(0).questioncount}" 건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
       

	
       
       
            
             <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">지원자 평균 스펙</h6>
                </div>
                <div class="card-body">
                  <h4 class="small font-weight-bold">학점 <span class="float-right">4.5</span></h4>
                  <div class="progress mb-4">
                 <%--  아래 쪽 제일 끝 3.5 라고 박아 넣은 부분에 json 에서 값꺼내서 넣어주면 될거임. ${학점} 이런 식으로. 
                 여기서는 넣을 때 json 전체 for문 돌면서 평균 구해서 넣으면 되겠다.
                 --%>
                    <div id="progress_bar1" class="progress-bar bg-danger" role="progressbar"  aria-valuemin="0" aria-valuemax="100">${dashboardList.get(0).averagestudentscore}</div>
                  </div>
                   <h4 class="small font-weight-bold">해외경험 <span class="float-right">5회</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar2"  class="progress-bar bg-success" role="progressbar"   aria-valuemin="0" aria-valuemax="100">${dashboardList.get(0).averageoverseascore}회</div>
                  </div>
                  <h4 class="small font-weight-bold">수상횟수 <span class="float-right">5회</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar3" class="progress-bar bg-warning" role="progressbar"   aria-valuemin="0" aria-valuemax="100">${dashboardList.get(0).averageprizescore}회</div>
                  </div>
                  <h4 class="small font-weight-bold">자격증 <span class="float-right">5개</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar4" class="progress-bar" role="progressbar"   aria-valuemin="0" aria-valuemax="100">${dashboardList.get(0).averagecertificatescore}개</div>
                  </div>
                  <h4 class="small font-weight-bold">토익 <span class="float-right">990점</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar5" class="progress-bar bg-info" role="progressbar"  aria-valuemin="0" aria-valuemax="100">${dashboardList.get(0).averagetoeicscore}점</div>
                  </div>
                  <h4 class="small font-weight-bold">인턴경험 <span class="float-right">5회</span></h4>
                  <div class="progress">
                    <div id="progress_bar6" class="progress-bar bg-success" role="progressbar"   aria-valuemin="0" aria-valuemax="100">${dashboardList.get(0).averageinternscore}회</div>
                  </div>
                </div>
              </div>
              
            
            
              <div class="row">

            <!-- Area Chart -->
   
   		 <!-- 최근 10일간 등록된 자기소개서 건수를 넣어봤음. 그냥 값 맘대로 집어넣었는데, 진짜로 값을 넣고 싶다면 나에게 문의하삼 -->
   
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">등록된 자기소개서</h6>
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
                
                 <!-- 지원자들 대학교 분포도를 넣어봤음. 그냥 값 맘대로 집어넣었는데, 진짜로 값을 넣고 싶다면 나에게 문의하삼 -->
                
                <div class="card-body">

                 <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">최근 10일 간의 등록된 자기소개서 건수 추이는 다음과 같습니다.</div>
                  <div class="chart-area">
                    <canvas id="myAreaChart2"></canvas>
                  </div>
                </div>
              </div>
                 <!-- Approach -->	
                 
                 <!-- 내가 말했던 입사 후 퍼포먼스 부분인데 어떻게 출력해줄건지 추후의 상의가 더 필요할 듯. -->

            
             <!-- Donut Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">지원자 대학교 분포</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                
                  <div class="chart-pie pt-4">
                    <canvas id="myPieChart2"></canvas>
                  </div>
                  <hr>
                   <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">지원자들의 출신 대학교 분포는 위와 같습니다.</div>
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
  <script src="<%=cp%>/resources/js/demo/chart-area-demo.js"></script>
  <script src="<%=cp%>/resources/js/demo/dashboard_pie-chart.js"></script>
  
  <!-- SweetAlert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>

<script type="text/javascript">
$(document).ready(function() {
	/* 위에서부터 순서대로 학점,해외경험,수상횟수,자격증,토익,인턴경험 임. 
	학점은 4.5, 토익은 990, 나머지는 5회가 만점으로 해놨음.
	그에 맞게 width만 수정해주면 페이지 로드되면서 알아서 progress bar 게이지 채움 . */
	
	var width1="${Width1}";
	var width2="${Width2}";
	var width3="${Width3}";
	var width4="${Width4}";
	var width5="${Width5}";
	var width6="${Width6}";
	/* 예시
	var width1 = $(학점)/ 4.5; 
	var width5 = $(토익) / 990; */
	
	/* 여기서 평균계산해서 넣어주면 됨 */
	
	 $('#progress_bar1').css('width', width1 + "%");
	 $('#progress_bar2').css('width', width2 + "%");
	 $('#progress_bar3').css('width', width3 + "%");
	 $('#progress_bar4').css('width', width4 + "%");
	 $('#progress_bar5').css('width', width5 + "%");
	 $('#progress_bar6').css('width', width6 + "%");
	 

	});
	
//line
var ctxL = document.getElementById("lineChart").getContext('2d'); /* 이건 디자인 적인 부분이라 신경 안써도 됨 */
var myLineChart = new Chart(ctxL, {
  type: 'line',
  data: {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [{
        label: "My First dataset",
        data: [65, 59, 80, 81, 56, 55, 40],
        backgroundColor: [
          'rgba(105, 0, 132, .2)',
        ],
        borderColor: [
          'rgba(200, 99, 132, .7)',
        ],
        borderWidth: 2
      },
      {
        label: "My Second dataset",
        data: [28, 48, 40, 19, 86, 27, 90],
        backgroundColor: [
          'rgba(0, 137, 132, .2)',
        ],
        borderColor: [
          'rgba(0, 10, 130, .7)',
        ],
        borderWidth: 2
      }
    ]
  },
  options: {
    responsive: true
  }
});


</script>


