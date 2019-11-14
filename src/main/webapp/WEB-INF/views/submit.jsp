<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%@page import="java.util.*"%>
<%@ page import="com.team2.webservice.sprint1.vo.Member" %>
<%@ page import="javax.validation.constraints.Null" %>
<%
	String cp = request.getContextPath();
    request.setCharacterEncoding("UTF-8");

    request.setAttribute("member", session.getAttribute("login"));

    Member user = (Member)session.getAttribute("login");
    System.out.println(user);
    String name = user.getName();
    String email = user.getEmail();




    //int uid = user.getUid();
%>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="<%=cp%>/resources/css/submit_css.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->



<div class="container">
    <div class="row">
        <h2>삼성전자 입사지원서</h2>
        <p class="lead">
            This new pattern transforms Bootstrap's form fields into modern, fun and user-friendly experiences!<br />
            <small class="text-muted">Learn more about this pattern at <a href="http://bradfrostweb.com/blog/post/float-label-pattern/" target="blank">http://bradfrostweb.com/blog/post/float-label-pattern/</a></small>
        </p>

        <div class="alert alert-warning">
            <h4>빈칸 없이 작성해주세요</h4>
            작성하지 않은 내용에 대한 책임은 본인에게 있습니다.
        </div>

        <hr />

        <div class="row">
            <div class="col-sm-8">

                <h2 class="page-header">기본 사항</h2>
                <form role="form" method="POST" action="/submit_data" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile" name="image" accept="image/*">
                            <label class="custom-file-label" for="customFile">Upload image</label>
                        </div>
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">이름</label>
                        <input type="text" class="form-control" placeholder="이름" name="submit_name">
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">학점</label>
                        <input type="text" class="form-control" placeholder="학점(소수 둘째자리까지)" name="submit_studentscore">
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">토익점수</label>
                        <input type="text" class="form-control" placeholder="토익점수" name="submit_toeicscore">
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">자격증 갯수</label>
                        <input type="text" class="form-control" placeholder="자격증 갯수" name="submit_certificatenumber">
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">해외경험 횟수</label>
                        <input type="text" class="form-control" placeholder="해외경험 횟수" name="submit_overseanumber">
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">인턴경험 횟수</label>
                        <input type="text" class="form-control" placeholder="인턴경험 횟수" name="submit_internnumber">
                    </div>
                    <div class="form-group float-label-control">
                        <label for="">공모전 수상 횟수</label>
                        <input type="text" class="form-control" placeholder="공모전 수상 횟수" name="submit_competition">
                    </div>
    
               
					</hr>

                <h2 class="page-header">자기소개서</h2>
           
                <h3 class="page-header">질문1</h3>
                    <div class="form-group float-label-control">
                        <label for="">질문 1</label>
                        <textarea class="form-control" name="submit_textbox1" placeholder="500자 이내로 작성" rows="1" ></textarea>
                    </div>
                <h3 class="page-header">질문2</h3>
                    <div class="form-group float-label-control">
                        <label for="">질문 2</label>
                        <textarea class="form-control" name="submit_textbox2" placeholder="500자 이내로 작성" rows="1"></textarea>
                    </div>
                 <h3 class="page-header">질문3</h3>  
                    <div class="form-group float-label-control">
                        <label for="">질문 3</label>
                        <textarea class="form-control" name="submit_textbox3" placeholder="500자 이내로 작성" rows="1"></textarea>
                    </div>
                    <div class="btn-group">
                        <input type="submit" value="제출" class="btn btn-primary">
                    </div>
                </form>


            </div>
            <%-- <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            Features
                        </h3>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <li>Very customizable</li>
                            <li>Works with Bootstrap's native form examples</li>
                            <li>Uses CSS transitions for fallback browser support</li>
                            <li>Placeholder override for labels when fields are empty</li>
                            <li>Included authored jQuery plugin</li>
                            <li>Optional bottom label positioning with the <code>.label-bottom</code> utility</li>
                            <li>Works great with Chrome's AutoComplete</li>
                        </ul>
                    </div>
                </div>
            </div> --%>
        </div>
    </div>
</div>

<script type="text/javascript">
/* Float Label Pattern Plugin for Bootstrap 3.1.0 by Travis Wilson
**************************************************/



(function ($) {
    $.fn.floatLabels = function (options) {

        // Settings
        var self = this;
        var settings = $.extend({}, options);


        // Event Handlers
        function registerEventHandlers() {
            self.on('input keyup change', 'input, textarea', function () {
                actions.swapLabels(this);
            });
        }


        // Actions
        var actions = {
            initialize: function() {
                self.each(function () {
                    var $this = $(this);
                    var $label = $this.children('label');
                    var $field = $this.find('input,textarea').first();

                    if ($this.children().first().is('label')) {
                        $this.children().first().remove();
                        $this.append($label);
                    }

                    var placeholderText = ($field.attr('placeholder') && $field.attr('placeholder') != $label.text()) ? $field.attr('placeholder') : $label.text();

                    $label.data('placeholder-text', placeholderText);
                    $label.data('original-text', $label.text());

                    if ($field.val() == '') {
                        $field.addClass('empty')
                    }
                });
            },
            swapLabels: function (field) {
                var $field = $(field);
                var $label = $(field).siblings('label').first();
                var isEmpty = Boolean($field.val());

                if (isEmpty) {
                    $field.removeClass('empty');
                    $label.text($label.data('original-text'));
                }
                else {
                    $field.addClass('empty');
                    $label.text($label.data('placeholder-text'));
                }
            }
        }


        // Initialization
        function init() {
            registerEventHandlers();

            actions.initialize();
            self.each(function () {
                actions.swapLabels($(this).find('input,textarea').first());
            });
        }
        init();


        return this;
    };

    $(function () {
        $('.float-label-control').floatLabels();
    });
})(jQuery);
</script>