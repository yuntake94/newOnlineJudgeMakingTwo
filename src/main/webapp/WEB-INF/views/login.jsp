<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.vo.Member" %>

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

  <title>자소서 필터링 프로그램 - Login</title>

  <!-- Custom fonts for this template-->
  <link href="<%=cp%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=cp%>/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<!-- Bootstrap core JavaScript-->
<script src="<%=cp%>/resources/vendor/jquery/jquery.min.js"></script>
<script src="<%=cp%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<%=cp%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<%=cp%>/resources/js/sb-admin-2.min.js"></script>

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>







<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="form" method="POST" action="/login">
                    <div class="form-group">
                      <input type="email" name="memberEmail" class="form-control form-control-user" id="email" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <div class="form-group">
                      <input type="password" name="memberPw" class="form-control form-control-user" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    <button type="submit" id="login-button" class="btn btn-primary btn-user btn-block"  />  <!-- onclick="botton_click();">  -->
                      Login
                    </button>

                      <!--
                    <hr>
                    <a href="index" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="index" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>  -->
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" style="color:blue">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" onclick="Register_click()" style="color:blue">Create an Account!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>



</body>

<script type="text/javascript">
<c:if test="${isOk == 'false'}">

        swal("로그인에 실패하였습니다.", "아이디 또는 비밀번호를 확인하세요!","error");


</c:if>
<c:if test="${isOk == 'true'}">



        swal("로그인에 성공하였습니다.", "문제 리스트로 이동합니다!","success");
        location.href="problemlist";






</c:if>

function Register_click()
{

    swal("회원가입", "회원가입으로 이동합니다.", "info")
        .then((value) => {

        location.href="register";
});



}


	// ID , PW 설정
	/*if ( document.getElementById("exampleInputEmail").value == 'admin' && document.getElementById("exampleInputPassword").value == 'admin')
	{

        swal("로그인에 성공하였습니다.", "대시보드로 이동합니다!", "success")
            .then((value) => {
            location.href="index";
    });

	}
	else
	{
		swal("로그인에 실패하였습니다.", "아이디 또는 비밀번호를 확인하세요!", "error");

	}*/


</script>
