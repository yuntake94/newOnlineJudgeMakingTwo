<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.vo.Member" %>
<%
	String cp = request.getContextPath();
	System.out.println(cp+"cp절대경로");
    request.setCharacterEncoding("UTF-8");


    Member user = (Member)session.getAttribute("login");
    System.out.println(user);
//String name = user.getMyinfo().getName();
String email = user.getEmail();
%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>자소서 필터링 프로그램</title>

  <!-- Custom fonts for this template-->
  <link href="<%=cp%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=cp%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
 
  <!-- Custom styles for this page -->
  <link href="<%=cp%>/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
  <!-- Search Highlight -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/plug-ins/1.10.19/features/searchHighlight/dataTables.searchHighlight.css"> 
  
  <!-- QuickView -->
   <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'> 
 <link rel="stylesheet" href="<%=cp%>/resources/js/quickview/css/reset.css"> <!-- CSS reset -->
 <link rel="stylesheet" href="<%=cp%>/resources/js/quickview/css/style.css"> <!-- Resource style -->
 <script src="<%=cp%>/resources/js/quickview/js/modernizr.js"></script> <!-- Modernizr -->

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
                      <th>해외경험</th>
                      <th>수상횟수</th>
                      <th>자격증</th>
                      <th>토익</th>
                      <th>인턴경험</th>
                      <th>Function</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>사진</th>
                      <th>이름</th>
                      <th>자기소개서</th>
                      <th>학점</th>
                      <th>해외경험</th>
                      <th>수상횟수</th>
                      <th>자격증</th>
                      <th>토익</th>
                      <th>인턴경험</th>
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
                      
							--%>



												<td style="cursor:pointer" onclick="clicked(${item.cid})" name="${item.cid}">

                                                    <img class="img-responsive" src="imgcode/${item.member.uid}" id="img${item.member.uid}" width="200" height="100 onclick="button_click();">


												</td>
												
												<td style="cursor:pointer">
                                                    ${item.member.name}

												</td>
										
												<td style="cursor:pointer" class="myButton" onclick=quickviewImage(${item.member.uid})>
                                                    ${item.textbox1.substring(0,150)}...


										
												<td style="cursor:pointer">
                                                    ${item.member.studentscore}

												</td>
												
												<td style="cursor:pointer">
                                                    ${item.member.overseanumber}

												</td>
												
												<td style="cursor:pointer">
                                                    ${item.member.competition}

												</td>
												
												<td style="cursor:pointer">
                                                    ${item.member.certificatenumber}

												</td>
												
												<td style="cursor:pointer">
                                                    ${item.member.toeicscore}

												</td>
												
												<td style="cursor:pointer">
                                                    ${item.member.internnumber}

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
          
       
          <!-- Quickview -->
		 <div class="cd-quick-view">
		<div class="cd-slider-wrapper" id="cd-quickview-image">
		<!--	 <ul class="cd-slider">
				 <li class="selected"><img src="<%=cp%>/resources/js/quickview/img/pic2.jpg"></li>
				<li><img src="<%=cp%>/resources/js/quickview/img/item-1.jpg" alt="Product 2"></li>
				<li><img src="<%=cp%>/resources/js/quickview/img/item-3.jpg" alt="Product 3"></li>
			</ul> cd-slider -->





			<ul class="cd-slider-navigation">
				<li><a class="cd-next" href="#0">Prev</a></li>
				<li><a class="cd-prev" href="#0">Next</a></li>
			</ul> <!-- cd-slider-navigation -->
		</div> <!-- cd-slider-wrapper -->


             <div class="cd-item-info">
                 <div class="row">
                     <h2 id="qv_name">Produt Title</h2>

                     <div style="margin-left: 40px">
                         <button class="btn btn-primary" onclick="goDetail();">이 지원자 자세히 보기</button>
                     </div>
                 </div>
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
      </div>
    </div>
  </div>
</div>
      </br>

		<!--	 <ul class="cd-item-action">
			 <li><button class="add-to-cart">버튼1</button></li>
				<li><button class="btn btn-primary" onclick="goDetail();">이 지원자 자세히 보기</button></li>	
			</ul>  cd-item-action -->
		</div> <!-- cd-item-info -->
		<a href="#0" class="cd-close">Close</a>
	</div> <!-- cd-quick-view --> 
	
	<!-- Quickview End -->
        
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
  <!-- <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>  -->
 
 <!-- Search Highlight --> 
 <script src="https://cdn.datatables.net/plug-ins/1.10.19/features/searchHighlight/dataTables.searchHighlight.min.js"></script>
 <script src="https://bartaz.github.io/sandbox.js/jquery.highlight.js"></script> 
 
 
 <!--QuickView -->

 <%-- <script src="<%=cp%>/resources/js/quickview/js/jquery-2.1.1.js"></script> --%>
 <script src="<%=cp%>/resources/js/quickview/js/velocity.min.js"></script>
 <script src="<%=cp%>/resources/js/quickview/js/main.js"></script> <!-- Resource jQuery -->
   
   
</body>

</html>

<script type="text/javascript">

    var content_result=null;
    var quickviewImage_flag=0;
    var quickviewclick_number=0;
	var table = $('#dataTable').dataTable( {
		searchHighlight: true,
		  "columnDefs": [
			{ "width": "12%", "targets": 0 },
			{ "width": "7%", "targets": 1 },
		    { "width": "5%", "targets": 3 },
		    { "width": "5%", "targets": 4 },
		    { "width": "5%", "targets": 5 },
		    { "width": "5%", "targets": 6 },
		    { "width": "5%", "targets": 7 },
		    { "width": "5%", "targets": 8 },
		    { "width": "3%", "targets": 9 },
		    {
				'targets' : 9,
				//'searchable' : false,  
				//'orderable' : false,
				'render' : function(data, type, full, meta) {
					if (type === 'display') {
						var $span = $('<span></span>');

						$(
								'<div class="c1" style="float: left; width: 50%; color:black; cursor: pointer" ><i class="fa fa-bookmark" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
								.appendTo($span);
						 $(
								'<div class="c2" style="float: left; width: 50%; color:black; cursor: pointer" ><i class="fa fa-check" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
								.appendTo($span);

                        $(
                            '<div class="c3" style="float: left; width: 33%; color:black; cursor: pointer" ><i class="fa fa-times" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
                            .appendTo($span);
						/*$(
								'<div class="c3" style="float: left; width: 25%; color:black; cursor: pointer" ><i class="fa fa-angle-double-up" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
								.appendTo($span);
						$(
								'<div class="c4" style="float: left; width: 25%; color:black; cursor: pointer" ><i class="fa fa-angle-double-down" style="font-size:24px; line-height : 32px; text-align:center;"></i></div>')
								.appendTo($span); */
						return $span.html();
					}
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


                  $('.c1').click(bookmark);
                  $('.c2').click(my_pass);
                  $('.c3').click(my_fail);
					
					/* c1이 왼쪽 bookmark 아이콘 있는 버튼 눌렀을때임. bookmark() 함수를 호출할거임.
					c2가 오른쪽 쓰레기통 아이콘, my_delete() 함수 호출할 것. */
					
				},
				
				/* "rowCallback": function( row, data, index ) {
				   
				        $('td', row).css('background-color', 'Gray');
				   
				} */
           
				
				
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
		
	table.on( 'draw', function () {
        var body = $( table.table().body() );
 
        body.unhighlight();
        body.highlight( table.search() );  
    } );

        $('#dataTable').on('search.dt', function() {
            var value = $('.dataTables_filter input').val();
        //   console.log(value); // <-- the value
            content_result= value;

        });

    });


function color() {
	$(this).css("color", '#2C81B7');
}

function colorOff() {
	$(this).css("color", 'black');
}

function quickviewImage(uid){
    quickviewclick_number+=1;
    var image_id= document.getElementById("cd-quickview-image");
    if(quickviewclick_number==1){
        var img = document.createElement("img");
        img.src="imgcode/" + uid;

        image_id.appendChild(img);
        quickviewImage_flag+=1;
    }
    else if(quickviewclick_number!=quickviewImage_flag){
        console.log("두번쨰부터 여기");
        image_id.innerText="";
   //     image_id.removeChild( image_id.firstChild);
        //$("cd-quickview-image:first-child").remove();
        //image_id.removeChild(image_id.firstChild);
        var img = document.createElement("img");
        img.src="imgcode/" + uid;
        img.width=300;
        img.height=400;


        image_id.appendChild(img);


    }



}

function clicked(a)
{

    var sendData = { "tr_uid" :a ,"searchText" : content_result,"detail" : "index"};      //$(this).closest('tr').children().attr('name')  };

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

                location.href="detailreal?data_a="+data+"&searchText="+content_result;
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

    function bookmark()
    {
        //var index = table1.row(row).index();

        var tr = $(this).closest('tr').index();;
        tr+=1;

        console.log(tr);

        swal({
            title: "즐겨찾기로 등록하시겠습니까?",
            text: "등록하시면 왼쪽 즐겨찾기 메뉴에서 확인하실 수 있습니다",
            icon: "info",
            buttons: true,
            // dangerMode: true,
        })
            .then((willAdd) => {
            if (willAdd) {
                /* ok 버튼 누르면 삭제 진행할 것임
                이 주석 위치에서 그 지원자에 해당하는 record를 db에서 즐겨찾기 해주면 됨.
                등록 완료해도 테이블이 동적으로 변하는게 아니니 새로고침 한번 해주면 잘 등록된 상태로 나올 것임.
                이건 뭐 즐겨찾기라서 추가한다고 변하는 것도 없으니 새로고침 안해도 될라나? 알아서 판단하시길
                */
                var sendData = { "tr_cid" : tr,
                };

                $.ajax({
                    type : "POST",
                    url : "/find_Like",
                    data : sendData,
                    success: function (data) {
                        alert(data);
                    }
                });

                swal("즐겨찾기 등록이 완료되었습니다.","" ,"success")
                    .then((value) => {

                    /*  밑에 새로고침 기능은 넣어놨음.
                      */
                    window.location.reload();
            });
            } else {
                swal("즐겨찾기 등록을 취소하셨습니다.");
    }
    });
    }

    function my_pass()
    {
        var tr = $(this).closest('tr').index();;
        tr+=1;

        swal({
            title: "정말로 합격하시겠습니까?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willPass) => {
            if (willPass) {

                var sendData = { "uid" : tr, "where" : "index"
                };

                $.ajax({
                    type : "POST",
                    url : "/find_congratulation",
                    data : sendData,
                    success: function (data) {
                        alert(data);
                    }
                });
                swal("합격처리가 완료되었습니다.","" ,"success")
                    .then((value) => {
                    /* 여기에 합격하는 기능 넣으세요 */
                    /*  밑에 새로고침 기능은 넣어놨음.
                      */
                    window.location.reload();
            });
            } else {
                swal("작업을 취소하셨습니다.");
    }
    });
    }

    function my_fail()
    {
        var tr = $(this).closest('tr').index();;
        tr+=1;
        console.log(tr+"tr : tr tr tr tr ");
        swal({
            title: "정말로 불합격하시겠습니까?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willFail) => {
            if (willFail) {
                var sendData = { "uid" : tr, "where" : "index"
                };

                $.ajax({
                    type : "POST",
                    url : "/find_getout",
                    data : sendData,
                    success: function (data) {
                        alert(data);
                    }
                });
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

    function goDetail()
    {
        var name =  $("#qv_name").html();

        var sendData = { "tr_uid" :name ,"where": "quickview"};
        console.log("저건?" + name);
        console.log("이건 ?"+sendData);

        $.ajax({
            type : "POST",
            url : "/find_Detail",
            data : sendData,
            success: function (data) {


                console.log(data);

                swal("지원자를 선택하셨습니다.", "detail 페이지로 이동합니다!", "info")
                    .then((value) => {
                    location.href="detailreal?data_a="+data+"&searchText="+content_result;
                //#.저장을 해두고 그걸 들고 쓰는 방식으로 하면 다른 detail을 만들어야함.




            });


            }
        });






    }



	
</script>

