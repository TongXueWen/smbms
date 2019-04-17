$(function(){
	userview();	
})
 
 function userview(){
	var id=$("#uid").val();
	
 $.post("userselect",{"id":id},function(data){
	 if(data !=null){
		 if (data.gender == "1") {
			 var sex="男"
		 } else {
			 var sex="女"
		 }
		 	 
		 if (data.userrole == "1") {
			 var role="系统管理员"
		 } else if (data.userrole == "2") {
			 var role="经理"
		 } else {
			 var role="普通员工"
		 }
	 
		 $(".providerView").append(
				 "<p><strong>用户名称：</strong><span>"+ data.usercode +"</span></p>" +
		            "<p><strong>用户性别：</strong><span>"+ sex +"</span></p>" +
		            "<p><strong>出生日期：</strong><span>"+ data.birthday +"</span></p>" +
		            "<p><strong>用户电话：</strong><span>"+ data.phone +"</span></p>" +
		            "<p><strong>用户地址：</strong><span>"+ data.address +"</span></p>" +
		            "<p><strong>用户角色：</strong><span>"+ role +"</span></p><br/>"		 		 
		 )
	 }	 
 },"json")
}
 
