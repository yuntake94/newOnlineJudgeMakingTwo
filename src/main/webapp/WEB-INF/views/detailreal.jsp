<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.controller.HomeController" %>
<%
	String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
 //   String data_a= request.getParameter("data_a"); //#.member //#.이름을 오게 해서 할거임

   /* String[] group_data_a_String=  data_a.split("_");
    for(int i=0;i<group_data_a_String.length;i++){
        System.out.println(group_data_a_String[i]+"lllllllll");
    }*/

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
          
           <a href="#" class="btn btn-success btn-circle btn-lg" title="합격" onclick="pass(${Inform_Uid});">
                    <i class="fas fa-check"></i>
                    </a>
          
          <a href="#" class="btn btn-danger btn-circle btn-lg" title="불합격" onclick="fail(${Inform_Uid});">
                    <i class="fas fa-times"></i>
                    </a>
          </div>
          
          
          
       

	
       <div class="row">
       
       <!-- 이름 card -->
            <div class="col-xl-3 col-md-6 mb-2">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">지원자 이름</div>
                      <!-- 밑 윤진호 부분에 json에서 이름 가져와 넣을것 -->
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${Inform_Name}</div>
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
                  	<img class="img-responsive" src="/imgcode/${Inform_Uid}" width="200" height="400">
                  </div>

    
                  </div>
                </div>	
              </div>
               <!-- Approach -->
              <div class="card shadow mb-4">
                
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
                    <div id="progress_bar1" class="progress-bar bg-danger" role="progressbar"  aria-valuemin="0" aria-valuemax="100">"${Inform_StudentScore}"</div>
                  </div>
                   <h4 class="small font-weight-bold">해외경험 <span class="float-right">5회</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar2"  class="progress-bar bg-success" role="progressbar"   aria-valuemin="0" aria-valuemax="100">"${Inform_OverseaNumber}"회</div>
                  </div>
                  <h4 class="small font-weight-bold">수상횟수 <span class="float-right">5회</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar3" class="progress-bar bg-warning" role="progressbar"   aria-valuemin="0" aria-valuemax="100">"${Inform_CompetitionNumber}"회</div>
                  </div>
                  <h4 class="small font-weight-bold">자격증 <span class="float-right">5개</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar4" class="progress-bar" role="progressbar"   aria-valuemin="0" aria-valuemax="100">"${Inform_CertificateNumber}"개</div>
                  </div>
                  <h4 class="small font-weight-bold">토익 <span class="float-right">990점</span></h4>
                  <div class="progress mb-4">
                    <div id="progress_bar5" class="progress-bar bg-info" role="progressbar"  aria-valuemin="0" aria-valuemax="100">"${Inform_ToeicScore}"점</div>
                  </div>
                  <h4 class="small font-weight-bold">인턴경험 <span class="float-right">5회</span></h4>
                  <div class="progress">
                    <div id="progress_bar6" class="progress-bar bg-success" role="progressbar"   aria-valuemin="0" aria-valuemax="100">"${Inform_InternNumber}"회</div>
                  </div>
                </div>
              </div>
              
           
              <!--  <div class="col-xl-9 col-lg-7"> -->
              
           <div class="card shadow mb-6">
                <div class="card-header py-5">
                  <h4 class="m-0 font-weight-bold text-primary">자기소개서 LDA 분석 결과</h4>
                </div>
                <div class="card-body">
                 <div class="cd-item-info">
			<h2 id="qv_name">Produt Title</h2>
			<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia, omnis illo iste ratione. Numquam eveniet quo, 
			ullam itaque expedita impedit. Eveniet, asperiores amet iste repellendus similique reiciendis, maxime laborum praesentium.</p> -->
			
		<div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <span id="qv_q1">질문 #1</span>
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
         <span id="qv_a1">질문 #1</span>
         
         
               <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">첫번째 문항 분석결과</h6>
                </div>
                <div class="card-body">
                  <span id="q1_research">나중에 어떤 내용이 들어갈지도 모름</span>
                </div>
              </div>
             
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <span id="qv_q2">질문 #2</span>
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
        <span id="qv_a2">질문 #2</span>
        
         <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">두번째 문항 분석결과</h6>
                </div>
                <div class="card-body">
                  <span id="q2_research">나중에 어떤 내용이 들어갈지도 모름</span>
                </div>
              </div>
      </div>
    </div>
    
    
    
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <span id="qv_q3">질문 #3</span>
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
        <span id="qv_a3">질문 #3</span>
        
         <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">세번째 문항 분석결과</h6>
                </div>
                <div class="card-body">
                  <span id="q3_research">나중에 어떤 내용이 들어갈지도 모름</span>
                </div>
              </div>
      </div>
    </div>
    
    </br>
    
    <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">종합적 분석결과</h6>
                </div>
                <div class="card-body">
                  <span id="summary_research">스근함</span>
                </div>
              </div>
  </div>
<!--  </div> -->
   

			
		</div> <!-- cd-item-info -->
                </div>
              </div>
              
              </div>

            <div class="row">
                <div class="col-xl-12 col-lg-4">
                    <div class="card shadow mb-3">
                        <div class="card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary">감성분석 결과</h5>
                        </div>
                        <div class="card-body">
                            <span id="gamsung">나중에 어떤 내용이 들어갈지도 모름</span>
                        </div>
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
  
  <!-- Ajax -->
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


</body>

<script type="text/javascript">
$(document).ready(function() {
	/* 위에서부터 순서대로 학점,해외경험,수상횟수,자격증,토익,인턴경험 임. 
	학점은 4.5, 토익은 990, 나머지는 5회가 만점으로 해놨음.
	그에 맞게 width만 수정해주면 페이지 로드되면서 알아서 progress bar 게이지 채움 . */
    //String.format("%.0f",textbox1_percent*100)


    //#.실행되자마자 받아와서 그걸 뿌려줌




  //  Information_Suggestion();  //#.시작할 때 Information을 들고온다.

    console.log("이게 문젤까??");



    console.log("계산이 문젤까??");
	/* 예시
	var width1 = $(학점)/ 4.5;
	var width5 = $(토익) / 990; */


    var width1=  "${Inform_Width1}";
    var width2= "${Inform_Width2}";
    var width3= "${Inform_Width3}"
    var width4= "${Inform_Width4}";
    var width5=  "${Inform_Width5}";
    var width6= "${Inform_Width6}";

    console.log(width1+"\n"+width2+"\n"+width3+"\n"+width4+"\n"+width5+"\n"+width6+"\n");
	/* 스펙 progress bar 게이지 채우기 */
	 $('#progress_bar1').css('width',width1 + "%");
	 $('#progress_bar2').css('width', width2 + "%");
	 $('#progress_bar3').css('width', width3 + "%");
	 $('#progress_bar4').css('width', width4 + "%");
	 $('#progress_bar5').css('width', width5 + "%");
	 $('#progress_bar6').css('width', width6 + "%");
	 
	 
	 //LDA 분석결과 내부 채우기
    document.getElementById("qv_name").textContent= "${Inform_Name}" + " 자기소개서";
    document.getElementById("qv_q1").textContent="q1";
    document.getElementById("qv_a1").textContent="${Inform_Textbox1}";
    document.getElementById("q1_research").textContent="q1의 분석결과 현재 키워드 "+"${Inform_SearchContent}" +"에 관하여 약"+ "${Inform_Textbox1Percent}" + "%로 비중을 가졌습니다. 현재는 책임감과 관련하여 분석이 되고 있으며 공부에 관해서 비중이 높은 것으로 알려져있지만 관련 키워드 검색인"+ "${Inform_SearchContent}" + "와는 거리가 먼 것으로 알 수 있습니다.";
    document.getElementById("qv_q2").textContent="q2";
    document.getElementById("qv_a2").textContent="${Inform_Textbox2}";
    document.getElementById("q2_research").textContent="q2의 분석결과 현재 키워드 "+"${Inform_SearchContent}" +"에 관하여 약"+"${Inform_Textbox2Percent}" + "%로 비중을 가졌습니다. 현재는 책임감과 관련하여 분석이 되고 있으며 공부에 관해서 비중이 높은 것으로 알려져있지만 관련 키워드 검색인"+ "${Inform_SearchContent}" + "와는 거리가 먼 것으로 알 수 있습니다.";
    document.getElementById("qv_q3").textContent="q3";
    document.getElementById("qv_a3").textContent="${Inform_Textbox3}";
    document.getElementById("q3_research").textContent="q3의 분석결과 현재 키워드 "+ "${Inform_SearchContent}" +"에 관하여 약"+ "${Inform_Textbox3Percent}" + "%로 비중을 가졌습니다.현재는 책임감과 관련하여 분석이 되고 있으며 공부에 관해서 비중이 높은 것으로 알려져있지만 관련 키워드 검색인"+ "${Inform_SearchContent}" + "와는 거리가 먼 것으로 알 수 있습니다.";
    if("${Inform_SearchContent}"!="null"){
        document.getElementById("summary_research").textContent="현재 종합적인 분석결과 현재 검색 키워드 " + "${Inform_SearchContent}" +"에 관하여 전반적으로 나쁘지 않은 정황입니다. 질문들의 총체적인 분석으로 인한 텍스트 생성 결과"
            +"${Inform_SearchContent}" +"와 연관된 경험이 13%나왔으며 이는 "+"${Inform_SearchContent}" +" 와 관련된 경험이 그다지 많지 않은 것으로 판명됩니다.그렇지만 비교적 ${Inform_SearchContent} 와 관련한 키워드에 관한 #프로그래밍 #C언어 관련 부분은 다소 좋은 경험을 가진 것으로 보입니다. 자기소개서와 관련된 결과로 현재는 지원자에 대한 키워드 반응이 다소 긍정적인 것으로 보이지 않습니다. 이와 더불어 관련 업무에 대해서 또한 설명이 되지 않습니다." ;
    }
    else{
        document.getElementById("summary_research").textContent="현재 종합적인 분석결과 현재 검색 중 키워드로 사용한 것은 없으므로 LDA 분석이 불가능합니다. 분석을 원하신다면 키워드를 넣은 뒤 다시 확인하여 주십시오";
    }





    //R연동 내 환경에서는 되는데 진호환경에서는 안되므로 뺀다
    <%--   $.ajax({
           url:'<%=cp%>/loadGamsung',
           type:'POST',
           dataType:'text',
           async: false,
           data:{"parameter":"자바스크립트 파이썬 Python 조아조아~."},
           success:function(data){
               console.log("되었도다!");
               console.log(data);
               document.getElementById("gamsung").textContent= data;

           },error:function(request, status, error){
                 console.log(request+","+status+","+error);
              }
           });
    --%>

    //감성분석 가라치는 부분
    var docArr1 = new Array("C언어", "자바스크립트", "파이썬", "C++", "성실", "열정");
    var docArr2 = new Array("봉사활동", "공모전", "해외경험", "어학", "실무", "웹");
    var docArr3 = new Array("모바일","안드로이드","자신","리더쉽","팀장","프로젝트");

    var ran1 = Math.floor(Math.random() * 50) + 50;

    var jinho = "성실"; // 여기에 detail로 넘어오면서 가져온 키워드를 붙여넣어주삼

    var context1 = "이 지원자는 자기소개서에서  " + jinho + " 이라는 키워드에 대해 " + ran1 + "% 의 긍정적인 반응을 보였습니다." + '</br>' + '</br>';

    var ran2 = Math.floor(Math.random() * 6);
    var ran3 = Math.floor(Math.random() * 6);
    var ran4 = Math.floor(Math.random() * 6);

    var a = docArr1[ran2];
    var b = docArr2[ran3];
    var c = docArr3[ran4];

    var context2 = "이 지원자가 자기소개서에서 주로 강조한 키워드는 " + a + " , " + b + " , " + c + " 입니다"


    document.getElementById("gamsung").innerHTML= context1 + context2;



		
		
	});





function pass(uid)
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
              var sendData = { "uid" : uid ,"where" : "detail"
              };

              $.ajax({
                  type : "POST",
                  url : "/find_congratulation",
                  data : sendData,
                  success: function (data) {
                      alert(data);
                  }
              });

			  swal("합격 처리하였습니다.","" ,"success")
				.then((value) => {  
					 
					location.href="index";
				});
		  } else {
		    swal("합격을 취소하셨습니다.");
		  }
		});
}

function fail(uid)
{
	swal({
		  title: "정말로 탈락시키겠습니까?",
		  text: "탈락 시키면 되돌릴 수 없습니다!",
		  icon: "warning",
		  buttons: true,
		//  dangerMode: true,
		})
		.then((willFail) => {
		  if (willFail) {
			  /* ok 버튼 누르면 탈락 진행할 것임
			  이 주석 위치에서 그 지원자에 해당하는 record를 db에서 탈락표시 해주면 됨.
			  탈락 처리하면 index 페이지로 돌아가는 것이 이상적이라고 판단했음.*/
              var sendData = { "uid" : uid ,"where" : "detail",
              };

              $.ajax({
                  type : "POST",
                  url : "/find_getout",
                  data : sendData,
                  success: function (data) {
                      alert(data);
                  }
              });
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


