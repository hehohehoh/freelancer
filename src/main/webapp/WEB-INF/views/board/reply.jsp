<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a.button{ 
  background-color: #151757; 
    border: none;
    color: white;
    padding: 10px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
.button-area{
   padding-left:85%;
}
.replyList{
   background:white;
}
button.btn btn-default{
   background-color:#DDDDDD;
   color:black;
   border:none;
}
</style>
</head>
<script type="text/javascript">
var bno = '${read.bno}';

// replyInsertForm의 내용을 가져와서 변수 insertData에 담는다
$('[name=replyInsertBtn]').click(function(){  // 댓글 등록 버튼 클릭시
   var insertData = $('[name=replyInsertForm]').serialize(); 
   replyInsert(insertData);
});


//댓글 리스트
function replyList(){
    $.ajax({
       url : '${contextPath}/reply/list',
       type : 'get',
       data : {'bno':bno},
       success : function(data){
          var a = "";
          var free_id = "<c:out value='${free.free_id}' />"
          $.each(data, function(key, value){
             
            a += "<div style='background:#DDDDDD;color:black;border:none; margin-left:10%;'>"
             a += "<div class='replyInfo"+value.rno+"'>"+"&nbsp;&nbsp;"+value.writer + "&nbsp;&nbsp;"+value.regdate+"<br>";
             a += "<div style='background:#DDDDDD;color:black;border:none;' class='replyContent"+value.rno+"'> &nbsp;&nbsp;"+value.content ;
             a += "<div></div></div>";
             a += "</div></div><div class='button-area'>"
             
             if(free_id == value.writer){
               
                a += "&nbsp<a href='#reply' class='btton' stlye='background:#DDDDDD; border:none;' onclick='replyUpdate("+value.rno+",\""+value.content+"\");'><p style='color:#3366FF;float:left;'>수정</p></a>&nbsp";
                a += "<a href='#reply' class='btton' stlye='background:#DDDDDD; border:none;' onclick='replyDelete("+value.rno+");'><p style='color:#3366FF;float:left;'>&nbsp;&nbsp;삭제</p></a><br><br></div>";
             }
             a += "<br></div><hr style='margin-left:10%; margin-right:5%''><br>";
          });
          a += '</div><br>';
          $(".replyList").html(a);
          
          
          /* || free.free_id == \"admin\" */
       }
    });
}

//댓글 입력
function replyInsert(insertData){
   $.ajax({
      url : '${contextPath}/reply/insert',
      type : 'post',
      data : insertData,
      success : function(data){
         if(data == 1) {
            replyList();
            $('#replyContent').val('');
         }
      }
   });
}
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function replyUpdate(rno, content){
   $("a.btton").css("display","none");
   
   var a='';
     
    a += '<div class="input-group">';
    a += '<input type="text"  class="form-control" name="content_'+rno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn" style="margin-right:7%;"><button class="btn btn-default" type="button" onclick="replyUpdateProc('+rno+');"><p style="color:#3366FF">수정완료</p></button> </span>';
    a += '</div>';
    
    $('.replyContent'+rno).html(a);

}
//댓글 수정 ajax
function replyUpdateProc(rno){
   var updateContent = $('[name=content_'+rno+']').val();
   
   $.ajax({
      url : '${contextPath}/reply/update',
      type : 'post',
      data : {'content' : updateContent, 'rno' : rno},
      success : function(data){
         if(data == 1) replyList(bno);
      }
   });
}
//댓글 삭제
function replyDelete(rno){
   $.ajax({
      url : '${contextPath}/reply/delete/'+rno,
      type : 'post',
      success : function(data){
         if(data == 1) replyList(bno);
      }
   });
   
}

//read.jsp 실행시 댓글 리스트를 뿌린다
$(document).ready(function(){
      replyList();
});
</script>
</html>