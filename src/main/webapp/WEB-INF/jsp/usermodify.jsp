<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
        <s:form  method="post" action="${pageContext.request.contextPath }/user/update" modelAttribute="user">
        <s:hidden path="id"/>
			 <div>
                    <label for="userName">用户名称：</label>
                    <s:input path="username"/>
					<font color="red"></font>
             </div>
			 <div>
                    <label >用户性别：</label>
                   	<s:radiobutton path="gender" value="1"/>男
                   	<s:radiobutton path="gender" value="2"/>女
             </div>
			 <div>
                    <label for="data">出生日期：</label>
					<s:input path="birthday" cssClass="Wdate" readonly="true" onclick="WdatePicker();"/>
                    <font color="red"></font>
              </div>
			
		       <div>
                    <label for="userphone">用户电话：</label>
                    <s:input path="phone"/>
                    <font color="red"></font>
               </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <s:input path="address"/>
                </div>
				<div>
                    <label >用户角色：</label>
                    <!-- 列出所有的角色分类 -->
					<s:select path="userrole" items="${rnids}" itemValue="id" itemLabel="rolename"></s:select>
        			<font color="red"></font>
                </div>
			 <div class="providerAddBtn">
                    <input type="submit" name="save" id="save" value="保存" /> 
                    <input type="button" id="back" name="back" onclick="javascript:window.history.back(-1);" value="返回"/>                 
                </div>
            </s:form>
        </div>
    </div>
</section>
<%@include file="common/foot.jsp" %>
