<!doctype html>

<head>
 <!-- CodeMirror -->
  <link rel="stylesheet" href="resources/codeMirror/codemirror.css">
<link rel="stylesheet" href="resources/codeMirror/lesser-dark.css">
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Orbitron&amp;text=Cppcheck" />
    <link rel="stylesheet" type="text/css" href="/site/css/pack.css" />
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
<script src="resources/codeMirror/codemirror.js"></script>

<script src="resources/codeMirror/javascript/javascript.js"></script>
<script src="resources/codeMirror/selection/active-line.js"></script>
<script src="resources/codeMirror/edit/matchbrackets.js"></script>
 <script src="resources/jquery/jquery.min.js"></script>
 
 
  <!-- SweetAlert -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
</head>

<body id="page-top"  oncopy="myF()" oncut="return false" onpaste="return false">

<article>
<h2>Theme Demo</h2>
    <script type="text/javascript">
        function checkCodeLength() {
            if (document.f.code.value.length > 30) {

                alert("code length exceeded");
                return false;
            }
            //alert(document.f.code.value); 되네
            alert("Is it possible");
            return true;
        }
    </script>
    <form action="/cgi-bin/democlient.cgi" name="f" onsubmit="return checkCodeLength();" method="post" target="_blank">
        <textarea id="code" name="code" >
void f()
{
    char *p;
    *p = 0;
}

}</textarea>
        <input type="submit" value="Check" />
    </form>


</body>


<script type="text/javascript">

var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
    lineNumbers: true,
    styleActiveLine: true,
    matchBrackets: true
  });
  
  editor.setOption("theme", "lesser-dark");
 
	 $(function(){
		  var failMessage = function(){
		      return swal("경고!", "붙여넣기는 금지합니다", "error"), false;
		  },
		  preventEvent = {
		   "keydown" : function(e) {
		     var keycode = function(e){ 
		             return ('which' in e ? e.which : e.keyCode) 
		         }(e),
		         ctrl_cv = (e.ctrlKey && (keycode == 118 || keycode == 86)),
		         shift_insert = (e.shiftKey && keycode == 45);
		         if (ctrl_cv || shift_insert){
		             return failMessage();
		         }
		   }
		   ,"mousedown" : function(e) {
		      var rightClick = (e.button == 2);
		        if(rightClick){
		           return failMessage();
		        }
		   }
		   ,"contextmenu" : function(e) {
		           return failMessage();
		   }
		 };
		$(document).bind(preventEvent);
		}()); 
		

	function myF()
	{
		return swal("경고!", "복사는 금지합니다", "error"), false;
	}
  
	function indentCheck()
	{
		var text = editor.getValue()
	    console.log(text);
	}
	

</script>