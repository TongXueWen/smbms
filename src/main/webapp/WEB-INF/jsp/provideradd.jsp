<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面 >> 供应商添加页面</span>
        </div>
        <div class="providerAdd">
           <form id="providerForm" name="providerForm" method="post" action="${pageContext.request.contextPath }/provider/add">
                <div class="">
                    <label for="procode">供应商编码：</label>
                    <input type="text" name="procode" id="procode" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="proname">供应商名称：</label>
                   <input type="text" name="proname" id="proname" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="procontact">联系人：</label>
                    <input type="text" name="procontact" id="procontact" value=""> 
					<font color="red"></font>

                </div>
                <div>
                    <label for="prophone">联系电话：</label>
                    <input type="text" name="prophone" id="prophone" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="proaddress">联系地址：</label>
                    <input type="text" name="proaddress" id="proaddress" value=""> 
                </div>
                <div>
                    <label for="profax">传真：</label>
                    <input type="text" name="profax" id="profax" value=""> 
                </div>
                <div>
                    <label for="prodesc">描述：</label>
                    <input type="text" name="proDesc" id="proDesc" value=""> 
                </div>
                <div class="providerAddBtn">
                    <input type="submit" name="add" id="add" value="保存">
                    <input type="button" id="back" name="back" onclick="javascript:window.history.back(-1);" value="返回"/>	
                </div>
            </form>
     </div>
</div>
</section>
<%@include file="common/foot.jsp" %>