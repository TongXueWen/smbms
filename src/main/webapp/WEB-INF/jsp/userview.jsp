<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        
        <div class="providerView">
        			
           
            <input type="hidden" id="uid" value="<%=request.getParameter("id") %>" />
           
           <%--  <p><strong>用户名称：</strong><span></span></p>
            <p><strong>用户性别：</strong><span></span></p>
            <p><strong>出生日期：</strong><span></span></p>
            <p><strong>用户电话：</strong><span></span></p>
            <p><strong>用户地址：</strong><span></span></p>
            <p><strong>用户角色：</strong><span></span></p> --%>
          
			
         
        </div>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" onclick="javascript:window.history.back(-1);" value="返回"/>
        </div>
    </div>
</section>
<%@include file="common/foot.jsp" %>