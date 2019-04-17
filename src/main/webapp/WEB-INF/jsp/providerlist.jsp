<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面</span>
        </div>
        <div class="search">
        	<form method="get" action="${pageContext.request.contextPath }/provider/providerlist">
				<!-- <input name="method" value="query" type="hidden"> -->
				
				<span>供应商联系人：</span>
				<input name="procontact" type="text" value="${procontact }">
				
				<span>供应商名称：</span>
				<input name="proname" type="text" value="${proname }">
				
				
				<input value="查 询" type="submit" id="searchbutton">
				<a href="${pageContext.request.contextPath }/provider/provideradd">添加供应商</a>
			</form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="20%">地址</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach items="${pageInfo.list }" var="pr">
				<tr>
					<td>
					<span>${pr.procode}</span>
					</td>
					<td>
					<span>${pr.proname}</span>
					</td>
					<td>
					<span>${pr.procontact}</span>
					</td>
					<td>
					<span>${pr.prophone}</span>
					</td>
					<td>
					<span>${pr.profax}</span>
					</td>
					<td>
					<span>
					${pr.proaddress}
					</span>
					</td>
					<td>
					<span><f:formatDate value="${pr.creationdate}" pattern="yyyy-MM-dd"/></span>
					</td>
					<td>
					<span><a class="viewProvider" href="${pageContext.request.contextPath }/provider/providerview?id=${pr.id}&flag=update"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyProvider" href="${pageContext.request.contextPath }/provider/providermodify?id=${pr.id}&flag=update"><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteProvider" href="${pageContext.request.contextPath }/provider/providerdel?id=${pr.id}"><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
        </table>
        <div class="page-bar">
			<ul class="page-num-ul clearfix">
				<li>共${pageInfo.total}条记录&nbsp;&nbsp; ${pageInfo.pageNum}/${pageInfo.pages}页</li>
					<a href="${pageContext.request.contextPath }/provider/providerlist?procontact=${procontact}&proname=${proname}">首页</a>
					<a href="${pageContext.request.contextPath }/provider/providerlist?n=${pageInfo.prePage}&procontact=${procontact}&proname=${proname}">上一页</a>
					<c:forEach items="${pageInfo.navigatepageNums}" var="num">
						<a href="${pageContext.request.contextPath }/provider/providerlist?n=${num}&procontact=${procontact}&proname=${proname}">${num}</a>
					</c:forEach>
					<a href="${pageContext.request.contextPath }/provider/providerlist?n=${pageInfo.nextPage}&procontact=${procontact}&proname=${proname}">下一页</a>
					<a href="${pageContext.request.contextPath }/provider/providerlist?n=${pageInfo.lastPage}&procontact=${procontact}&proname=${proname}">最后一页</a>
				&nbsp;&nbsp;
			</ul>
		<!--  <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
	     <button type="button" class="page-btn" onClick=''>GO</button>
		</span> -->
		</div> 
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>

<%@include file="common/foot.jsp" %>
