<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#oldpassword").blur(function(){
			var pwd = $(this).val();
			var id = $("#userid").val();
			$.post("${pageContext.request.contextPath }/user/isPwd",{"pwd":pwd,"id":id},function(result){
				if(result.flag==0){
					$("#oldpassword").next().html(result.msg).css("color","#0f0");
				}else{
					$("#oldpassword").next().html(result.msg).css("color","#f00");
				}
			},"json");
		})
		
		$("#rnewpassword").blur(function(){
			var newpwd = $("#newpassword").val();
			var rnewpwd = $("#rnewpassword").val();
			if (newpwd != '' && rnewpwd != '') {
				if (newpwd == rnewpwd) {
					$("#rnewpassword").next().html("密码一致！").css("color","#0f0");
				} else {
					$("#rnewpassword").next().html("密码不一致！").css("color","#f00");
				}
			} else {
				$("#rnewpassword").next().html("密码不能为空！").css("color","#f00");
			}
			
		})
			
	})
	
	function save() {
			var id = $("#userid").val();
			var userpassword = $("#rnewpassword").val();
			var newpwd = $("#newpassword").val();
			var rnewpwd = $("#rnewpassword").val();
			
			if (newpwd == rnewpwd) {
				$.post("${pageContext.request.contextPath }/user/pwdupdate",{"userpassword":userpassword,"id":id},function(result){
					if(result > 0){
						alert("密码修改成功，请重新登录！");
						window.location.href="http://localhost:8080/smbms/login.html";
						/* $(".info").next().html(result.msg).css("color","#0f0"); */
					}else{
						$(".info").next().html("修改失败").css("color","#f00");
					}
				},"json");
			} else {
				alert("密码不一致！请重新输入！");
			}
			
			
		}
</script>
<div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>密码修改页面</span>
            </div>
            <div class="providerAdd">
                <form id="userForm" name="userForm" method="post" action="">
                    <input type="hidden" id="userid" value="${user.id}">
                    <!--div的class 为error是验证错误，ok是验证成功-->
                    <div class="info">${message}</div>
                    <div class="">
                        <label for="oldPassword">旧密码：</label>
                        <input type="password" name="oldpassword" id="oldpassword" value=""> 
						<font color="red"></font>
                    </div>
                    <div>
                        <label for="newPassword">新密码：</label>
                        <input type="password" name="newpassword" id="newpassword" value=""> 
						<font color="red"></font>
                    </div>
                    <div>
                        <label for="reNewPassword">确认新密码：</label>
                        <input type="password" name="rnewpassword" id="rnewpassword" value=""> 
						<font color="red"></font>
                    </div>
                   
                </form>
                 	<div class="providerAddBtn">
                        <!--<a href="#">保存</a>-->
                        <input type="button" onclick="save()" name="save" id="save" value="保存" class="input-button">
                    </div>
                	
            </div>
        </div>
    </section>
<%@include file="common/foot.jsp" %>