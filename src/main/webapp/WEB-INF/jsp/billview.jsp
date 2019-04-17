<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>订单管理页面 >> 信息查看</span>
     </div>
      <div class="providerAdd">
     	<s:form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/bill/update" modelAttribute="bill">
            <s:hidden path="id" />
               <div>
                   <label for="billCode">订单编码：</label>
                   <s:input path="billcode" readonly="true"/> 
               </div>
               <div>
                   <label for="productName">商品名称：</label>
                   <s:input path="productname" readonly="true"/> 
				<font color="red"></font>
               </div>
               <div>
                   <label for="productUnit">商品单位：</label>
                   <s:input path="productunit" readonly="true"/>
				<font color="red"></font>
               </div>
               <div>
                   <label for="productCount">商品数量：</label>
                   <s:input path="productcount" readonly="true"/>
				<font color="red"></font>
               </div>
               <div>
                   <label for="totalPrice">总金额：</label>
                   <s:input path="totalprice" readonly="true"/>
				<font color="red"></font>
               </div>
               <div>
                   <label for="providerId">供应商：</label>                
				<s:select path="providerid" items="${proids }" itemValue="id" itemLabel="proname" readonly="true">
	        	</s:select>
				<font color="red"></font>
               </div>
               <div>
                   <label >是否付款：</label>
                   	<input value="${bill.ispayment==1?'未付款':'已付款' }" readonly="true"/>
               </div>
               <div class="providerAddBtn">
			     <input type="button" id="back" name="back" onclick="javascript:window.history.back(-1);" value="返回"/>
               </div>
           </s:form>
     
         <!-- <p><strong>订单编号：</strong><span></span></p>
         <p><strong>商品名称：</strong><span></span></p>
         <p><strong>商品单位：</strong><span></span></p>
         <p><strong>商品数量：</strong><span></span></p>
         <p><strong>总金额：</strong><span></span></p>
         <p><strong>供应商：</strong><span></span></p>
         <p><strong>是否付款：</strong><span></span>
		</p> -->		
     </div>
 </div>
</section>
<%@include file="common/foot.jsp" %>