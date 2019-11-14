<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.vo.Member" %>
<%
	String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
    int tempint=0;



  Member user = (Member)session.getAttribute("login");
  System.out.println(user);
  //String name = user.getMyinfo().getName();
  String email = user.getEmail();
  //int uid = user.getUid();
%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>자소서 필터링 프로그램 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="<%=cp%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=cp%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
 
  <!-- Custom styles for this page -->
  <link href="<%=cp%>/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">자기소개서 필터링 프로그램    
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="color">Colors</a>
            <a class="collapse-item" href="border">Borders</a>
            <a class="collapse-item" href="animation">Animations</a>
            <a class="collapse-item" href="other">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login">Login</a>
            <a class="collapse-item" href="register">Register</a>
            <a class="collapse-item" href="forgot-password">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="error404">404 Page</a>
            <a class="collapse-item" href="blank">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
         <!--  <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="검색 하고자 하는 키워드 입력" aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form> -->

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler Â· 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun Â· 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog Â· 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">김준승</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          
      
      <!-- Content Row -->

    
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">자기소개서 목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
                      <th>자기소개서</th>
                      <th>학점</th>
                      <th>Function</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
                      <th>자기소개서</th>
                      <th>학점</th>
                      <th>Function</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  	<c:forEach var="item" items="${textfileList}" end="10" step="1" >
						<tr>
							<c:catch var="error">
							
							
							<%-- 아래와 같은 방식으로 데이터 넣어주면 됨.  td 태그안에 들어가는 값이 테이블에서 출력됨.
							style="cursor: pointer;"는 마우스 올리면 손모양 으로 변하는 기능이므로 신경안써도 됨
							onclick으로 눌렀을 때 clicked 함수 호출 할건데 안에 파라미터로 json안에서 식별 가능한 어떤 값
							정해서 대충 넣어주면 됨. 그래야 clicked 함수에서 detail.jsp로 어떤 지원자를 넘길건지 식별할 수 있으니까
							넘길때는 post던 get이던 써서 그 식별할 값만 넘겨주면 detail 에서 json 안에서 그 식별자에 맞는 값 찾으면 됨.
							<c:out value="~~"/>이 부분이 실질적으로 테이블에 출력될 값임.
							
						 <td style="cursor: pointer;"
						onclick="clicked('${jsonname.getJSONObject(index).getString('id')}')"><c:out
						value="${jsonname.getJSONObject(index).getString('name') }" /></td>
							
							
					  <th>사진</th>
                      <th>이름</th>
                      <th>자기소개서</th>
                      <th>학점</th>
                      <th>Function</th> 로 총 5개의 열이 있음.
                      사진 , 이름, 자소서, 학점 이 4가지를 td로 넣어주면 됨. 마지막 function은 테이블 설정부분에서 내가 아이콘 넣고 함수 넣을거라 
                      그냥 <td></td> 이렇게 빈칸 출력해주면 됨. 그리고 지금 위쪽의 c:forEach를 보면 jstl문법인데 그냥 for문임.
                      begin=0 부터 end=10 까지 총 11번 돌아감. var="index"는 for ( int i = 0; i < 10; i++ ) 에서 i 역할
                      그러므로 그냥 이 forEach 문 안에 td 총 5개 해주면은 for문 돌면서 datatable 안의 행들을 계속 채울 것임.
                      나중에 니가 작업할때는 end 부분을 end="${diskofferinglist.length()-1 }" 이런 식으로 json .length() 로 설정하면 자소서 수만큼 돌것임.
                     
                     잘 모르겠으면 그냥 이 주석 그대로 놓고 페이지 실행시키면 아래의 5가지 td가 어떤식으로 출력되는지 볼 수 있음.
                     아래쪽 예시에서 사진 행에 clicked 함수를 걸어놔보겠음. 
                     
                     그리고 datatable 작업하다보면 가끔씩 위쪽 show 10 entire , 키워드 검색이 사라질 때가 있음. 그건 뭔가 format이 잘못돼서 datatable 이 터졌을 때
                     발생하는 현상임. 무언가 실수가 있다는 뜻이므로 잘 살펴보면 됨. 모든것이 완벽할때에만 모든 기능이 다 나옴.
                     
                     그밖에 datatable에 관련된 의문사항 또는 추가하고 싶은것이 생긴다면 언제든지 말해주길 바람
                      <!--  td에 item.cid를 통해 바로바로 접근을 할 예정임 >
							--%>

												<td style="cursor:pointer" onclick="clicked(${item.cid})" name="${item.cid}">
                                                  <img class="img-responsive" src="imgcode/${item.cid}" id="img${item.cid}" width="200" height="100 onclick="button_click();">
                                                    ${item.textbox1}
											<!--	<c:out value="사진" />  -->
												</td>
												
												<td style="cursor:pointer">
												<c:out value="${item    myinfo.get(i).name}" />
												</td>
										
												<td style="cursor:pointer">
												<c:out value="${item.textbox1}" />
										
												<td style="cursor:pointer">
												<c:out value="${item.myinfo.get(i).studentscore}" />
												</td>
												
												<td></td>
							
							</c:catch>								
						</tr>				
					</c:forEach>
      
                  </tbody>
                </table>
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
  <script src="<%=cp%>/resources/js/demo/chart-pie-demo.js"></script>
  
  <!-- SweetAlert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  <!-- Page level plugins -->
  <script src="<%=cp%>/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%=cp%>/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%=cp%>/resources/js/demo/datatables-demo.js"></script>

</body>

</html>

<script type="text/javascript">

    var temppid=0;

$('#dataTable').dataTable( {
	  "columnDefs": [
		{ "width": "12%", "targets": 0 },
		{ "width": "7%", "targets": 1 },
	    { "width": "7%", "targets": 3 },
	    { "width": "3%", "targets": 4 },
	    {
			'targets' : 4,
			//'searchable' : false,  
			//'orderable' : false,
			'render' : function(data, type, full, meta) {
				if (type === 'display') {


                    //alert(data+" "+ type + " " + full + " " + meta + " " +tempint+"이거맞음?");



					var $span = $('<span></span>');

					$(
							'<div class="c1" style="float: left; width: 50%; color:black; cursor: pointer" ><i class="fa fa-bookmark" id="bookmark" style="font-size:24px; line-height : 32px; text-align:center; "></i></div>')
							.appendTo($span);
					 $(
							'<div class="c2" style="float: left; width: 50%; color:black; cursor: pointer" ><i class="fa fa-trash-alt" id="trashalt" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
							.appendTo($span);
					/*$(
							'<div class="c3" style="float: left; width: 25%; color:black; cursor: pointer" ><i class="fa fa-angle-double-up" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
							.appendTo($span);
					$(
							'<div class="c4" style="float: left; width: 25%; color:black; cursor: pointer" ><i class="fa fa-angle-double-down" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
							.appendTo($span); */
					return $span.html();
				}

				//temppid = temppid+1;
				//alert(temppid);
				return data;
			}
		},
		
	  ],
	  "language": {
		    "search": "키워드 입력 : "
		  },
		  'drawCallback' : function(settings) {
				//$('#computingtable tr:last .c2').remove();

				// Remove previous binding before adding it
				$('.c1').unbind('click');
				$('.c2').unbind('click');


				/*	$('.c5').unbind('mouseover');
					$('.c5').unbind('mouseleave'); */

				// 마우스 올리면 색깔 변경
				$('.c1').mouseover(color);
				$('.c2').mouseover(color);


				// 마우스 떠나면 원래 색으로
				$('.c1').mouseleave(colorOff);
				$('.c2').mouseleave(colorOff);




				$('.c1').click(bookmark);
				$('.c2').click(my_delete);
				
				/* c1이 왼쪽 bookmark 아이콘 있는 버튼 눌렀을때임. bookmark() 함수를 호출할거임.
				c2가 오른쪽 쓰레기통 아이콘, my_delete() 함수 호출할 것. */
				
			}
	} );


function color() {
	$(this).css("color", '#2C81B7');
}

function colorOff() {
	$(this).css("color", 'black');
}

function clicked(a)
{
	
	swal(a + " 번째 지원자를 선택하셨습니다.", "detail 페이지로 이동합니다!", "info")
	.then((value) => {  
		location.href="detail";
	});


	<%-- 
	swal은 알림창 같은거 되게 예쁘게 보여주는 라이브러리 기능중 하나임. 눌러보면 알 수 있음.
	then((value) => {~~} 이 안에 뭐든지 넣으면 잘 작동할 것임. 이 index의 경우에선 페이지 넘기는것 말곤 할게 없겠군. 
	
	
	location.href = "detail?index=~~";   
	위와 같은 형식으로 끝에 이렇게 달리는게 get 방식이었나? 뭐 이런식으로 몇번째 지원자인지 detail로 넘겨주면
	또 detail에선 그 몇번쨰인지만 알면 json에서 그에 해당하는 정보 전부 뽑아서 출력해줄것임.
	
	--%>
}


function bookmark()
{


     //var tr = $(this).closest('tr');

	swal({
		  title: "즐겨찾기로 등록하시겠습니까?",
		  text: "등록하시면 왼쪽 즐겨찾기 메뉴에서 확인하실 수 있습니다",
		  icon: "info",
		  buttons: true,
		 // dangerMode: true,
		})
		.then((willAdd) => {
		  if (willAdd) {
            var sendData = { "tr_cid" : $(this).closest('tr').children(). attr('name'),
            };

            console.log("bookmark_try" + sendData);

            $.ajax({
              type : "POST",
              url : "/find_Like",
              data : sendData,
              success: function (data) {
                alert(data);
              }
            });

			  /*
			   ok 버튼 누르면 삭제 진행할 것임
			  이 주석 위치에서 그 지원자에 해당하는 record를 db에서 즐겨찾기 해주면 됨.
			  등록 완료해도 테이블이 동적으로 변하는게 아니니 새로고침 한번 해주면 잘 등록된 상태로 나올 것임.
			  이건 뭐 즐겨찾기라서 추가한다고 변하는 것도 없으니 새로고침 안해도 될라나? 알아서 판단하시길
			  */

			  swal("즐겨찾기 등록이 완료되었습니다.","" ,"success")
				.then((value) => {  
					 
					/*  밑에 새로고침 기능은 넣어놨음.
					  */


				//	window.location.reload();

				});
		  } else {
		    swal("즐겨찾기 등록을 취소하셨습니다.");
		  }
		});
}
	
function my_delete()
{
	swal({
		  title: "정말로 삭제하시겠습니까?",
		  text: "삭제 하시면 되돌릴 수 없습니다!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  /* ok 버튼 누르면 삭제 진행할 것임
			  이 주석 위치에서 그 지원자에 해당하는 record를 db에서 지워주면 됨.
			  삭제 완료해도 테이블이 동적으로 변하는게 아니니 새로고침 한번 해주면 잘 삭제된 상태로 나올 것임.*/


              var sendData = { "tr_cid" : $(this).closest('tr').children(). attr('name'),
              };

              $.ajax({
                  type : "POST",
                  url : "/find_Delete",
                  data : sendData,
                  success: function (data) {
                      alert(data);
                  }
              });



			  swal("삭제가 완료되었습니다.","" ,"success")
				.then((value) => {
					/*  밑에 새로고침 기능은 넣어놨음.
					  */


				//	 window.location.reload();
				});
		  } else {
		    swal("삭제를 취소하셨습니다.");
		  }
		});
}
</script>
