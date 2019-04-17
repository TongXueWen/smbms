<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>订单管理页面 >> 订单修改页面</span>
        </div>
        <div class="providerAdd">
          <s:form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/bill/update" modelAttribute="bill">
               <s:hidden path="id"/>
                <div>
                    <label for="billCode">订单编码：</label>
                    <s:input path="billcode"/> 
                </div>
                <div>
                    <label for="productName">商品名称：</label>
                    <s:input path="productname"/> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productUnit">商品单位：</label>
                    <s:input path="productunit"/>
					<font color="red"></font>
                </div>
                <div>
                    <label for="productCount">商品数量：</label>
                    <s:input path="productcount"/>
					<font color="red"></font>
                </div>
                <div>
                    <label for="totalPrice">总金额：</label>
                    <s:input path="totalprice"/>
					<font color="red"></font>
                </div>
                <div>
                    <label for="providerId">供应商：</label>
                    <!-- <input type="hidden" value="" id="pid" /> -->
					<s:select path="providerid" items="${proids }" itemValue="id" itemLabel="proname">
		        	</s:select>
					<font color="red"></font>
                </div>
                <div>
                    <label >是否付款：</label>
						<s:radiobutton path="ispayment" value="1"/>未付款
                   	    <s:radiobutton path="ispayment" value="2"/>已付款
                </div>
                <div class="providerAddBtn">
                  <input type="submit" name="save" id="save" value="保存">
				  <input type="button" id="back" name="back" onclick="javascript:window.history.back(-1);" value="返回"/>
              	</div>
            </s:form>
        </div>
    </div>
</section>
<%@include file="common/foot.jsp" %>