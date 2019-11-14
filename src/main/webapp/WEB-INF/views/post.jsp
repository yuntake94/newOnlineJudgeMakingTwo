
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>

<jsp:include page="body.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <%--<jsp:include page="header.jsp"/>--%>
</head>
<body>

<%--�α��� �Ǿ��ִ� ���� ������ ����--%>


<div class="card gedf-card">

    <div class="card-header">
    </div>
    <div class="card-body">
        <form id="uploadForm" enctype="multipart/form-data" method="POST" action="/pentode/upload.do">


            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                    <div class="form-group">
                        <label class="sr-only" for="message">board</label>
                        <textarea name="content" class="form-control" id="message" rows="3" placeholder="Keyword"></textarea>
                        <label for="file1">���� ù ��°</label> <div><input type="file" id="file1" name="file" required="required" /></div>

                    </div>
                    <div class="btn-group">
                        <input type="submit" value="���ε�" class="btn btn-primary">
                    </div>
                </div>
            </div>
        </form>
        <div><button id="btn-upload">���� ���ε�</button></div>


    </div>
</div>
<script type="text/javascript"> //<![CDATA[
 $(function() {
     $("#btn-upload").on("click", function()
     { var form = new FormData(document.getElementById('uploadForm'));
     $.ajax({ url: "/pentode/upload.do",
      data: form,
         dataType: 'json',
         processData: false,
         contentType: false,
         type: 'POST',
         success: function (response)
         {
             alert("success");
             console.log(response);
             },
         error: function (jqXHR)
         { alert(jqXHR.responseText);
         }
     });
     });
 }); //]]> </script>




</body>
</html>
