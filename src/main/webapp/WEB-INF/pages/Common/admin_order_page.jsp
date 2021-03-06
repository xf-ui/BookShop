<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/1/5
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/WEB-INF/pages/Common/head.jsp"/>
</head>
<body>
<center>
    <div class="container-fluid" style="margin: 50px">
        <div class="row">
            <ul class="pagination">

                <c:if test="${sessionScope.order.pageNum!=1}">
                    <li><a href="javascript:goNext(1)">首页</a></li>
                </c:if>

                <c:if test="${sessionScope.order.pageNum>1}">
                    <li><a href="javascript:goNext(${sessionScope.order.pageNum-1})">&laquo;</a></li>
                </c:if>


                <c:if test="${sessionScope.order.pageNum+2<=sessionScope.order.pages}">
                    <c:set var="startPage" value="${sessionScope.order.pageNum}"></c:set>
                </c:if>

                <c:if test="${sessionScope.order.pageNum+2>sessionScope.order.pages}">
                    <c:set value="${sessionScope.order.pages-2}" var="startPage"></c:set>
                </c:if>

                <c:if test="${sessionScope.order.pageNum+2<sessionScope.order.pages}">
                    <c:set var="endPage" value="${sessionScope.order.pageNum+2}"></c:set>
                </c:if>

                <c:if test="${sessionScope.order.pageNum+2>=sessionScope.order.pages}">
                    <c:set var="endPage" value="${sessionScope.order.pages}"></c:set>
                </c:if>

                <c:forEach begin="${startPage<=0?1:startPage}" end="${endPage}" var="v">

                    <c:if test="${sessionScope.order.pageNum == v}">
                        <li class="active disabled"><a>${v}</a></li>
                    </c:if>

                    <c:if test="${sessionScope.order.pageNum != v}">
                        <li><a href="javascript:goNext(${v})">${v}</a></li>
                    </c:if>

                </c:forEach>

                <c:if test="${sessionScope.order.pageNum<sessionScope.order.pages}">
                    <li><a href="javascript:void(0)" onclick="javascript:goNext(${sessionScope.order.pageNum+1});return false;">&raquo;</a></li>
                </c:if>

                <c:if test="${sessionScope.order.pageNum!=sessionScope.order.pages}">
                    <li><a href="javascript:goNext(${sessionScope.order.pages})">尾页</a></li>
                </c:if>

                <li class="disabled"><a>当前页${sessionScope.order.pageNum}/${sessionScope.order.pages}总页</a></li>

                <li><a style="padding: 0;border: 0"><input type="number" id="nub" class="form-control"></a></li>
                <li><button class="btn" onclick="jump()">跳转</button></li>

            </ul>
        </div>
    </div>
</center>

<script>
    function goNext(num){
        var value = $('#id_hidden').val();
        // $("#outer").load("/mvc/product/page_content",{pageNum:num,name:name,typeId:type_id})
        $("#other").load("/admin/item",{pageNum:num});
    }

    function jump() {
        var value = $('#id_hidden').val();
        var num = $("#nub").val();
        if (num < 1 || num > ${sessionScope.order.pages}){
            document.getElementById("nub").value="";
            alert("请输入1~${sessionScope.order.pages}的值")
        }else{
            $("#other").load("/admin/item",{pageNum:num});
        }
    }
</script>

</body>
</html>
