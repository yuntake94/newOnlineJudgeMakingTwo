<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.vo.Member" %>
<%
	String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");


    Member user = (Member)session.getAttribute("login");
    System.out.println(user);
//String name = user.getMyinfo().getName();
    String email = user.getEmail();

    int fail_number=0;
    int pass_number=0;
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
  
  <!-- SideBar -->
	<jsp:include page="sidebar.jsp"></jsp:include>
    

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
            <h1 class="h3 mb-0 text-gray-800">합격자 목록</h1>
            
          </div>
      
      <!-- Content Row -->

	<div style="display: flex;">
								합격자 / 불합격자 테이블 선택 : 
									<select class="form-control" name="name"
										value="serviceoffering" id="sel"
										style="width: 130px; margin-left: 10px;">
										<!--  <option value="">Select...</option>-->
										<option value="pass" selected>합격자목록</option>
										<option value="fail">불합격자목록</option>
							
									</select>

								</div>

    
          <!-- DataTales Example -->
          <div class="card shadow mb-4" id="passTable">
            <div class="card-header py-3">
              <h4 class="m-0 font-weight-bold text-primary">합격자  목록</h4>
              <p align="right">
              <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="pass_mail()"><i class="fas fa-download fa-sm text-white-50" ></i> 합격자 메일 일괄 전송 </button>  
             
              </p>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
					
                      <th>이메일 주소</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
    				
                      <th>이메일 주소</th>
                    </tr>
                  </tfoot>
                  <tbody>

                  <c:forEach var="item" items="${textfileList}" end="10" step="1" >

							<c:catch var="error">
                                <c:if test="${item.filed eq 2}">
                                  <%=pass_number+=1%>
                                  <tr>
                                    <td style="cursor:pointer" onclick="clicked(${item.member.uid})">
                                        <img class="img-responsive" src="imgcode/${item.member.uid}" id="img${item.member.uid}" width="200" height="100">
                                    </td>

                                    <td style="cursor:pointer">
                                        ${item.member.name}
                                    </td>



                                    <td style="cursor:pointer">
                                        ${item.member.email}
                                    </td>

                                  </tr>
                                </c:if>

							</c:catch>								

					</c:forEach>

      
                  </tbody>
                </table>
              </div>
            </div>
          </div> 
          
          <!-- DataTales Example -->
          <div class="card shadow mb-4" id = "failTable">
            <div class="card-header py-3">
              <h4 class="m-0 font-weight-bold text-primary">불합격자  목록</h4>
              <p align="right">
              <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="fail_mail()"><i class="fas fa-download fa-sm text-white-50" ></i> 불합격자 메일 일괄 전송 </button>
              </p>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
					
                      <th>이메일 주소</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
    				
                      <th>이메일 주소</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <c:forEach var="item" items="${textfileList}" end="10" step="1" >

							<c:catch var="error">
                              <c:if test="${item.filed eq 3}">
                                <%=fail_number+=1%>
                                <tr>
                                    <td style="cursor:pointer" onclick="clicked(${item.member.uid})">
                                        <img class="img-responsive" src="imgcode/${item.member.uid}" id="img${item.member.uid}" width="200" height="100">
                                    </td>

                                    <td style="cursor:pointer">
                                        ${item.member.name}
                                    </td>

                                    <td style="cursor:pointer">
                                        ${item.member.email}
                                    </td>
                                </tr>
                              </c:if>
							</c:catch>								

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

/* 페이지 로드될 때 합격자 테이블 먼저 보여줄 것. */
$(document).ready(function(){
	showTable(1);
	
	var table2 = $('#dataTable').DataTable();
	   
    $('#dataTable tbody')
        .on( 'mouseover', 'tr', function () {
         
            $(this).css("background-color", "#E6E6E6", function(){
       
                });
        
        } );
    $('#dataTable tbody')
  .on( 'mouseleave', 'tr', function () {

      $(this).css("background-color", "white", function(){
      	
          });      
  } );
    
    var table3 = $('#dataTable2').DataTable();
	   
    $('#dataTable2 tbody')
        .on( 'mouseover', 'tr', function () {
         
            $(this).css("background-color", "#E6E6E6", function(){
       
                });
        
        } );
    $('#dataTable2 tbody')
  .on( 'mouseleave', 'tr', function () {

      $(this).css("background-color", "white", function(){
      	
          });      
  } );
});



var table1 = $('#dataTable').dataTable( {

} );

var table2 = $('#dataTable2').dataTable( {

	} );

function clicked(a)
{

  var sendData = { "tr_uid" :a ,"searchText" : "null","where" : "pass_fail"};      //$(this).closest('tr').children().attr('name')  };

  console.log(sendData);
  console.log("여기로 들어오나??ㅁㅇㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇ");

  $.ajax({
    type : "POST",
    url : "/find_Detail",
    data : sendData,
    success: function (data) {


      console.log(data);

      swal(a + " 번째 지원자를 선택하셨습니다.", "detail 페이지로 이동합니다!", "info")
              .then((value) => {

        location.href="detailreal?data_a="+data+"&searchText=null";
    });


    }
  });


  <%--
  swal은 알림창 같은거 되게 예쁘게 보여주는 라이브러리 기능중 하나임. 눌러보면 알 수 있음.
  then((value) => {~~} 이 안에 뭐든지 넣으면 잘 작동할 것임. 이 index의 경우에선 페이지 넘기는것 말곤 할게 없겠군.


  location.href = "detail?index=~~";
  위와 같은 형식으로 끝에 이렇게 달리는게 get 방식이었나? 뭐 이런식으로 몇번째 지원자인지 detail로 넘겨주면
  또 detail에선 그 몇번쨰인지만 알면 json에서 그에 해당하는 정보 전부 뽑아서 출력해줄것임.

  --%>
}

$(function(){   
	  
	  $("#sel").on('change', function(){
		  	switch($("#sel option:selected").val())
		  	{
		  	case "pass" : showTable(1); break;
		  	case "fail"  : showTable(2); break;

		  	}			  	
		  	});
		}); 

function showTable(choice){
	  
	kind = choice;
	var con1 = document.getElementById("passTable");
	var con2 = document.getElementById("failTable");  
	   
	
	switch(choice)
	{  
		case 1 : {
		con1.style.display = ''; 
		con2.style.display = 'none';

		break;
		}
		case 2 : { 	
		con2.style.display = '';   
		con1.style.display = 'none';
		
		break;
		}
		
		 
			
	}
};

/* 합격자 메일 전송 */
function pass_mail()
{
	swal({
		  title: "메일을 일괄 전송하시겠습니까?",
		  text: "메일 전송 후에는 돌이킬 수 없습니다!",
		  icon: "warning",
		  buttons: true,
		  //dangerMode: true,
		})
		.then((willPass) => {
		  if (willPass) {

            console.log("니가 여길맞아");
            $.ajax({
              url : "/mail/mailSending",
              type : 'POST',
              dataType : 'text',
              async : false,
              data : {
                "tomail" : "vndejddlxn1@naver.com", /* 이쪽에 합격자들 메일들을 json에서 꺼내와서 넣어줘야함 */
                "title" : "당신은 합격 하셨습니다.",
                "content" : "응~ 합격"

              }
            });


			  
			  
			  swal("전송하였습니다.","" ,"success")
				.then((value) => {  
					 
					window.location.reload();
				});
		  } else {
		    swal("전송을 취소하셨습니다.");
		  }
		});
	
	
	}
	
function fail_mail()
{
	swal({
		  title: "메일을 일괄 전송하시겠습니까?",
		  text: "메일 전송 후에는 돌이킬 수 없습니다!",
		  icon: "warning",
		  buttons: true,
		  //dangerMode: true,
		})
		.then((willPass) => {
		  if (willPass) {
		     console.log("지금 이건 ");
			  console.log("${textfileList.size()}");
			  for ( var i = 0; i < ${textfileList.size()}; i++) /* 불합격자 수 만큼 */
				{

				  if("${textfileList.get(i).filed}"=="3"){
                  $.ajax({
                    url : "/mail/mailSending",
                      type : 'POST',
                    dataType : 'text',
                    async : false,
                    data : {
                      "tomail" : "vndejddlxn1@naver.com", /* 이쪽에 불합격자들 메일들을 json에서 꺼내와서 넣어줘야함 */
                      "title" : "당신은 불합격 하셨습니다.",
                      "content" : "응~ 불합격"

                    }
                  });
                }

			
				}
			  
			  

			  swal("전송하였습니다.","" ,"success")
				.then((value) => {  
					 
					window.location.reload();
				});
		  } else {
		    swal("전송을 취소하셨습니다.");
		  }
		});
	
	
	}
</script>
