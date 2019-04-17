<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面 >> 信息查看</span>
        </div>
        <div class="providerAdd">
          <s:form id="providerForm" name="providerForm" method="post" action="${pageContext.request.contextPath }/provider/update" modelAttribute="provider">
            <s:hidden path="id"/>
              <div>
                  <label for="proCode">供应商编码：</label>
                  <s:input path="procode" readonly="true"/>
              </div>
              <div>
                  <label for="proName">供应商名称：</label>
                 <s:input path="proname" readonly="true"/>
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="proContact">联系人：</label>
                  <s:input path="procontact" readonly="true"/>
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="proPhone">联系电话：</label>
                  <s:input path="prophone" readonly="true"/>
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="proAddress">联系地址：</label>
                  <s:input path="proaddress" readonly="true"/>
              </div>
              
              <div>
                  <label for="proFax">传真：</label>
                  <s:input path="profax" readonly="true"/>
              </div>
              
              <div>
                  <label for="proDesc">描述：</label>
                  <s:textarea path="prodesc" readonly="true"/>
              </div>
              <div class="providerAddBtn">
                 <!--  <input type="submit" name="save" id="save" value="保存"> -->
				  <input type="button" id="back" name="back" onclick="javascript:window.history.back(-1);" value="返回"/>
              </div>
          </s:form>
      </div>
        <!-- <div class="providerView">
            <p><strong>供应商编码：</strong><span></span></p>
            <p><strong>供应商名称：</strong><span></span></p>
            <p><strong>联系人：</strong><span></span></p>
            <p><strong>联系电话：</strong><span></span></p>
            <p><strong>传真：</strong><span></span></p>
            <p><strong>描述：</strong><span></span></p>
			<div class="providerAddBtn">
            	<input type="button" id="back" name="back" onclick="javascript:window.history.back(-1);" value="返回"/>
            </div>
        </div> -->
    </div>
</section>
<%@include file="common/foot.jsp" %>
