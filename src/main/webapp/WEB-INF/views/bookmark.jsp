<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%
	String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
 
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

          
      
      <!-- Content Row -->

    
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h4 class="m-0 font-weight-bold text-primary">즐겨찾기  목록</h4>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
					
                      <th>Function</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
    				
                      <th>Function</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <c:forEach var="item" items="${textfileList}" end="10" step="1" >

                      <c:catch var="error">



                        <c:if test="${item.filed eq 1}">
                          <tr>
                          <td style="cursor:pointer" onclick="clicked(${item.member.uid})" name="${item.member.uid}">
                            <img class="img-responsive" src="imgcode/${item.member.uid}" id="img${item.member.uid}" width="200" height="100">
                          </td>
                          <td style="cursor:pointer">
                              ${item.member.name}
                          </td>
                          <td></td>
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

var table1 = $('#dataTable').dataTable( {
	 "columnDefs": [
			{ "width": "6%", "targets": 2 },
			 {
				'targets' : 2,
				//'searchable' : false,  
				//'orderable' : false,
				'render' : function(data, type, full, meta) {
					if (type === 'display') {
						var $span = $('<span></span>');

						$(
						'<div class="c1" style="float: left; width: 33%; color:black; cursor: pointer" ><i class="fa fa-trash" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
						.appendTo($span);
				 $(
						'<div class="c2" style="float: left; width: 33%; color:black; cursor: pointer" ><i class="fa fa-check" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
						.appendTo($span);
				 $(
					'<div class="c3" style="float: left; width: 33%; color:black; cursor: pointer" ><i class="fa fa-times" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
					.appendTo($span);
						
						
						return $span.html();
					}
					return data;
				}
			}
			],
	
			 'drawCallback' : function(settings) {

					//$('#computingtable tr:last .c2').remove();

					// Remove previous binding before adding it
					$('.c1').unbind('click');
					$('.c2').unbind('click');
					$('.c3').unbind('click');


					/*	$('.c5').unbind('mouseover');
						$('.c5').unbind('mouseleave'); */

					// 마우스 올리면 색깔 변경
					$('.c1').mouseover(color);
					$('.c2').mouseover(color);
					$('.c3').mouseover(color);


					// 마우스 떠나면 원래 색으로
					$('.c1').mouseleave(colorOff);
					$('.c2').mouseleave(colorOff);
					$('.c3').mouseleave(colorOff);
		

					$('.c1').click(my_delete);
					$('.c2').click(my_pass);
					$('.c3').click(my_fail);
					
	
				},
			
        
} );

$(document).ready( function () {
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
});

function color() {
	$(this).css("color", '#2C81B7');
}

function colorOff() {
	$(this).css("color", 'black');
}

function clicked(a)
{
  var sendData = {  "tr_uid" :a ,"searchText" : "null","where" : "bookmark"};      //$(this).closest('tr').children().attr('name')  };

  console.log(sendData);
 //#.uid이고
  $.ajax({
    type : "POST",
    url : "/find_Detail",
    data : sendData,
    success: function (data) {


      console.log(data);

      swal(a + " 번째 지원자를 선택하셨습니다.", "detail 페이지로 이동합니다!", "info")
              .then((value) => {

        location.href="detailreal?data_a="+data;
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



function my_delete()
{
  var tr_uid= $(this).closest('tr').find('td')[0].getAttribute("name");
  console.log(tr_uid+"ASdsad");
  var temp = $(this);
	swal({
		  title: "정말로 즐겨찾기에서 삭제하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  /* ok 버튼 누르면 삭제 진행할 것임
			  이 주석 위치에서 그 지원자에 해당하는 record를 db에서 즐겨찾기 해제*/
            var sendData = { "uid" : tr_uid ,"where" : "bookmark" };


            $.ajax({
              type : "POST",
              url : "/find_Delete",
              data : sendData,
              success: function (data) {
                alert(data);
              }
            });
            $(this).closest('tr').remove();
			  swal("삭제가 완료되었습니다.","" ,"success")
				.then((value) => {  
					 
					/*  밑에 새로고침 기능은 넣어놨음.
					  */

				});
		  } else {
		    swal("삭제를 취소하셨습니다.");
		  }
		});
}

function my_pass()
{

  var tr_uid= $(this).closest('tr').find('td')[0].getAttribute("name");
  console.log("pass : " + tr_uid);
	swal({
		  title: "정말로 합격하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willPass) => {
		  if (willPass) {
            var sendData = { "uid" :tr_uid,"where" : "bookmark"
            };

            $.ajax({
              type : "POST",
              url : "/find_congratulation",
              data : sendData,
              success: function (data) {
                alert(data);
              }
            });
             //#.합격 완료? 그럼 즐겨찾기에서 제거
            $(this).closest('tr').remove();
			  swal("합격처리가 완료되었습니다.","" ,"success")
				.then((value) => {  
					 /* 여기에 합격하는 기능 넣으세요 */
					/*  밑에 새로고침 기능은 넣어놨음.
					  */
					//window.location.reload();
				});
		  } else {
		    swal("작업을 취소하셨습니다.");
		  }
		});
}

function my_fail()
{
  var tr_uid= $(this).closest('tr').find('td')[0].getAttribute("name");
	swal({
		  title: "정말로 불합격하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willFail) => {
		  if (willFail) {

            var sendData = { "uid" : tr_uid,"where" : "bookmark"
            };

            $.ajax({
              type : "POST",
              url : "/find_getout",
              data : sendData,
              success: function (data) {
                alert(data);
              }
            });
            $(this).closest('tr').remove();
			  swal("불합격처리가 완료되었습니다.","" ,"success")
				.then((value) => {  
					 /* 여기에불합격하는 기능 넣으세요 */
					/*  밑에 새로고침 기능은 넣어놨음.
					  */
					window.location.reload();
				});
		  } else {
		    swal("작업을 취소하셨습니다.");
		  }
		});
}
</script>
