<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
           		<form method="get" action="${pageContext.request.contextPath }/user/userlist">
					 <span>用户名：</span>
					 <input name="username" class="input-text"	type="text" value="${username }">
					 <span>用户角色：</span>
					 <select name="rolename">
						   <option value="">--请选择--</option>
						   <c:forEach items="${roleNames }" var="rname">
						   		<option value="${rname}" <c:if test="${rolename==rname}">selected</c:if>>${rname}</option>
						   </c:forEach>
	        		</select>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="${pageContext.request.contextPath }/user/useradd">添加用户</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">用户角色</th>
                    <th width="10%">性别</th>
                    <th width="10%">生日</th>
                    <th width="10%">电话</th>
                    <th width="30%">操作</th>
                </tr>
                <c:forEach items="${pageInfo.list }" var="ur">
					<tr>
						<td>
						<span>${ur.usercode}</span>
						</td>
						<td>
						<span>${ur.username }</span>
						</td>
						<td>
							<span>${ur.rolename }</span>
						</td>
						<td>
							<span>${ur.gender==1?"男":"女" }</span>
						</td>
						<td>
						<span><f:formatDate value="${ur.birthday}" pattern="yyyy-MM-dd"/></span>
						</td>
						<td>
						<span>${ur.phone}</span>
						</td>
						
						<td>
						<span><a class="viewUser" href="${pageContext.request.contextPath }/user/userview?id=${ur.id}"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
						<span><a class="modifyUser" href="${pageContext.request.contextPath }/user/usermodify?id=${ur.id}&flag=update"><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteUser" href="${pageContext.request.contextPath }/user/userdel?id=${ur.id}"><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="page-bar">
			<ul class="page-num-ul clearfix">
				<li>共${pageInfo.total}条记录&nbsp;&nbsp; ${pageInfo.pageNum}/${pageInfo.pages}页</li>
					<a href="${pageContext.request.contextPath }/user/userlist?n=${pageInfo.firstPage}&username=${username}&rolename=${rolename}">首页</a>
					<a href="${pageContext.request.contextPath }/user/userlist?n=${pageInfo.prePage}&username=${username}&rolename=${rolename}">上一页</a>
					<c:forEach items="${pageInfo.navigatepageNums}" var="num">
						<a href="${pageContext.request.contextPath }/user/userlist?n=${num}&username=${username}&rolename=${rolename}">${num}</a>
					</c:forEach>
					<a href="${pageContext.request.contextPath }/user/userlist?n=${pageInfo.nextPage}&username=${username}&rolename=${rolename}">下一页</a>
					<a href="${pageContext.request.contextPath }/user/userlist?n=${pageInfo.lastPage}&username=${username}&rolename=${rolename}">最后一页</a>
				&nbsp;&nbsp;
			</ul>
		 <!-- <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
	     <button type="button" class="page-btn" onClick=''>GO</button>
		</span> -->
		</div> 
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="common/foot.jsp" %>
