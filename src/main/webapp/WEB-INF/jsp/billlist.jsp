<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>订单管理页面</span>
       </div>
       <div class="search">
       <form method="get" action="${pageContext.request.contextPath }/bill/billlist">
			<span>商品名称：</span>
			<input name="productname" type="text" value="${productname}">
		
			<span>供应商：</span>
			<select name="proname">
				   <option value="">--请选择--</option>
				   <c:forEach items="${proNames }" var="pronames">
				   		<option value="${pronames}" <c:if test="${proname==pronames}">selected</c:if>>${pronames}</option>
				   </c:forEach>
       		</select>
			 
			<span>是否付款：</span>
			<select name="ispayment">
				<option value="">--请选择--</option>
				<option value="1">未付款</option>
				<option value="2">已付款</option>
       		</select>
			
			 <input	value="查 询" type="submit" id="searchbutton">
			 <a href="${pageContext.request.contextPath }/bill/billadd">添加订单</a>
		</form>
		
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">订单编码</th>
              <th width="15%">供应商</th>
              <th width="15%">商品名称</th> 
              <th width="5%">商品单位</th>
              <th width="10%">商品单价</th>  
              <th width="10%">商品数量</th> 
               
              <th width="10%">订单金额</th>
              <th width="5%">是否付款</th>
              <th width="10%">创建时间</th>
              <th width="30%">操作</th>
          </tr>
          <c:forEach items="${pageInfo.list }" var="bill">
				<tr>
					<td>
					<span>${bill.billcode} </span>
					</td>
					
					<td>
					<span>${bill.proname}</span>
					</td>
					
					<td>
					<span>${bill.productname}</span>
					</td>
					
					<td>
					<span>${bill.productunit}</span>
					</td>
										
					<td>
					<span>${bill.totalprice/bill.productcount}￥</span>
					</td>
					
					<td>
					<span>${bill.productcount}</span>
					</td>
					
					<td>
					<span>${bill.totalprice}￥</span>
					</td>
					<td>
					<span>${bill.ispayment==1?"未付款":"已付款"}</span>
					</td>
					<td>
					<span><f:formatDate value="${bill.creationdate}" pattern="yyyy-MM-dd"/></span>
					</td>
					<td>
					<span><a class="viewBill" href="${pageContext.request.contextPath }/bill/billview?id=${bill.id}&flag=update"><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyBill" href="${pageContext.request.contextPath }/bill/billmodify?id=${bill.id}&flag=update"><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteBill" href="${pageContext.request.contextPath }/bill/billdel?id=${bill.id}"><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
				</c:forEach>
      </table>
      <div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${pageInfo.total}条记录&nbsp;&nbsp; ${pageInfo.pageNum}/${pageInfo.pages}页</li>
				<a href="${pageContext.request.contextPath }/bill/billlist?n=${pageInfo.firstPage}&productname=${productname}&proname=${proname}&ispayment=${ispayment}">首页</a>
				<a href="${pageContext.request.contextPath }/bill/billlist?n=${pageInfo.prePage}&productname=${productname}&proname=${proname}&ispayment=${ispayment}">上一页</a>
				<c:forEach items="${pageInfo.navigatepageNums}" var="num">
					<a href="${pageContext.request.contextPath }/bill/billlist?n=${num}&productname=${productname}&proname=${proname}&ispayment=${ispayment}">${num}</a>
				</c:forEach>
				<a href="${pageContext.request.contextPath }/bill/billlist?n=${pageInfo.nextPage}&productname=${productname}&proname=${proname}&ispayment=${ispayment}">下一页</a>
				<a href="${pageContext.request.contextPath }/bill/billlist?n=${pageInfo.lastPage}&productname=${productname}&proname=${proname}&ispayment=${ispayment}">最后一页</a>
			&nbsp;&nbsp;
		</ul>
	<!--  <span class="page-go-form"><label>跳转至</label>
     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
     <button type="button" class="page-btn" onClick=''>GO</button> 
	</span> -->
  </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>