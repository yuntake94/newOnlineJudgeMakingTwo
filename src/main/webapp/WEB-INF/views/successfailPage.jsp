<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Home</title>
</head>

<body>
<h1>

</h1>

<P>  Data Sending....... </P>


<div class="row">

    <!-- Area Chart -->
    <div class="col-xl-12 col-lg-10">
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">자기소개서 Overview</h6>
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




            <c:forEach var="item" items="${textfileList}" step="1">
                <div class="card mb-4 py-3 border-bottom-primary">
                    <div class="card-body">


                        <c:choose>

                                <c:when test="${item.filed eq '1'}">
                                    <img class="img-responsive" src="imgcode/${item.uid}" width="200" height="100 onclick="button_click();">
                                    ${item.textbox1}

                                </c:when>
                                <c:otherwise>
                                    <img class="img-responsive" src="imgcode/${item.uid}" width="500" height="100 onclick="button_click();">
                                    ${item.textbox1}
                                </c:otherwise>




                        </c:choose>

                    </div>


                </div>
            </c:forEach>
        </div>
    </div>
</div>


</body>
</html>
