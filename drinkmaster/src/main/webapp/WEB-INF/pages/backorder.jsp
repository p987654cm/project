<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
#orderform input:focus
{
	border-color:rgba(82, 168, 236, 0.8);
	outline:0;outline:thin dotted \9;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
	outline-style: none ;
	border-radius: 3px;
	padding: 14px 14px;
	font-family: "Microsoft soft";
	font-size: 14px;
	height: 25px;
	width: 350px;
}

#orderform input
{
 	outline-style: none ; 
    border: 1px solid #ccc;  
    border-radius: 3px; 
    padding: 14px 14px; 
    font-family: "Microsoft soft";
 	height: 25px; 
 	width: 350px; 
    outline: 0; 
/*     -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(0, 106, 255,.4); */
/*     box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(0, 106, 255,.4);  */
	font-size: 14px;
}


#orderform label {
	font-size: 16px;
}

 #orderform #orderStatus{ 
	height: 25px; 
	width: 150px;
	font-size: 16px;
 } 
 
 #orderform #ordersubmit{ 
 	height: 30px; 
 	width: 60px; 
 	font-size: 16px; 
   	vertical-align: middle; 
   	line-height: 30px; 
   	padding:0px 8px; 
   	border-radius: 2px; 
   	border-color: #007BFF;
 } 
 
  #orderform #closebutton{ 
 	height: 30px; 
 	width: 60px; 
 	font-size: 16px; 
   	vertical-align: middle; 
   	line-height: 30px; 
   	padding:0px 8px; 
   	border-radius: 2px; 
 } 
 
 

#orderform select{
	height: 20px;
	width: 80px;
	border-color: black;
	border-radius: 2px;
}

/* .material-icons{ */
/* size: large; */
/* } */

</style>

</head>
<body>

<br>
<p>
<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="">新增訂單</button></a>&emsp;
<a href="${contextRoot}/backend/order/findAll"><button type="button" class="btn btn-outline-dark btn-sm">訂單列表</button></a>&emsp;
<a href="${contextRoot}/backend/order/findStatus?sta=待付款"><button type="button" class="btn btn-outline-dark btn-sm">待付款</button></a>&emsp;
<a href="${contextRoot}/backend/order/findStatus?sta=待出貨"><button type="button" class="btn btn-outline-dark btn-sm">待出貨</button></a>&emsp;
<a href="${contextRoot}/backend/order/findStatus?sta=已出貨"><button type="button" class="btn btn-outline-dark btn-sm">已出貨</button></a>&emsp;
<a href="${contextRoot}/backend/order/findStatus?sta=已取消"><button type="button" class="btn btn-outline-dark btn-sm">已取消</button></a>&emsp;
</p>

<form action="${contextRoot}/backend/order/select" method="get">
		<div class="mb-3">
			<label for="select" class="form-label">搜尋</label> <input type="text"name="oid" id="select" placeholder="查詢編號" /> 

		<button type="submit" class="" style="border-color: gray;">查詢</button>
		<c:out value="查到 ${page.totalElements } 筆資料"></c:out>
		</div >
		
</form>		

<table class="table table-hover"style="width:100%;table-layout:fixed;">
  <thead>
    <tr>
      <th scope="col"><label class="control control--checkbox">
						<input type="checkbox" class="js-check-all" />
						<div class="control__indicator"></div>
	</label></th>
      <th scope="col">訂單編號</th>
<!--       <th scope="col">訂購人</th> -->
      <th scope="col">訂購人</th>
      <th scope="col" style="width: 170px;">訂單時間</th>
      <th scope="col">地址</th>
      <th scope="col">電話</th>
      <th scope="col">狀態</th>
      <th scope="col">總金額</th>
      <th scope="col">  </th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="orderBean" items="${page.content}">
    <tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${orderBean.orderId}'/>"
							style="margin-top: 20px;" />
							<div class="control__indicator"></div></label></td>
    
      <th scope="row"><c:out value="${orderBean.orderId}"/></th>
      <td><c:out value="${orderBean.userBean.userName}"/></td>
<%--       <td><c:out value="${orderBean.productId}"/></td> --%>
      <td><fmt:formatDate  value="${orderBean.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
      <td><c:out value="${orderBean.orderAddress}"/></td>
      <td><c:out value="${orderBean.orderPhone}"/></td>
      
      <c:choose>
			<c:when test="${orderBean.orderStatus=='已出貨'}">
			<td style="color: green;font-weight: bold;">
					<c:out value="已出貨" /></td>
						</c:when>
			<c:when test="${orderBean.orderStatus=='已取消'}">
			<td style="color: blue;font-weight: bold;">
					<c:out value="已取消" /></td>
						</c:when>
			<c:when test="${orderBean.orderStatus=='待付款'}">
			<td style="color: orange;font-weight: bold;">
					<c:out value="待付款" /></td>
						</c:when>			
						<c:otherwise>
			<td style="color: red;font-weight: bold;" test="${orderBean.orderStatus=='未出貨'}">
					<c:out value="待出貨" /></td>
						</c:otherwise>


						
					   </c:choose>  

      <td><c:out value="${orderBean.totalPrice}"/></td>
      <td><a href="${contextRoot}/backend/order/findAll"><i class="tiny material-icons">collections</i></a></td>
      <td>
      <a href="${contextRoot}/backend/order/edit?id=${orderBean.orderId}"><button class="btn btn-outline-primary btn-sm">編輯</button></a>
        <a onclick="return confirm('確定要刪除嗎?')"  href="${contextRoot}/backend/order/delete?id=${orderBean.orderId}"><button class="btn btn-outline-danger btn-sm">刪除</button></a></td>
      </tr>
    </c:forEach>
    
 
  </tbody>
  
</table>

<p>
    <button type="button" class="btn btn-warning btn-sm" >匯出Excel</button>&emsp;
</p>

<div class="row justify-content-center" style="font-size: x-large;">
  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
   <c:choose>
   <c:when test="${page.number!=pageNumber-1}">
   <a href="${contextRoot}/backend/order/findAll?o=${pageNumber}"> <c:out value="${pageNumber}" /> </a>
   </c:when>
   <c:otherwise>
   <c:out value="${pageNumber}"></c:out>
   </c:otherwise>
   </c:choose> 
   <c:if test="${pageNumber!= page.totalPages }">
    &thinsp;| &thinsp;
   </c:if>
   </c:forEach>
<%--    <canvas id="myChart" width="200" height="200"></canvas> --%>
   
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">新增訂單</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
  <div class="modal-body">
  <form:form id="orderform" class="form" method="post" action="${contextRoot}/backend/order/insert" modelAttribute="orderBean">
  <span><form:label path="createTime">訂單日期</form:label></span>
  <form:input path="createTime" /><br><br>
  <form:label path="storeId">店家編號</form:label>
  <form:input path="storeId" /><br><br>
  <form:label path="productId">產品編號</form:label>
  <form:input path="productId" /><br><br>
  <form:label path="userId">使用者編號</form:label>
  <form:input path="userId" /><br><br>
  <form:label path="orderAddress">地&emsp;&emsp;址</form:label>
  <form:input path="orderAddress" /><br><br>
  <form:label path="orderPhone">電&emsp;&emsp;話</form:label>
  <form:input path="orderPhone" /><br><br>
  <form:label path="orderStatus">狀&emsp;&emsp;態</form:label>
  <select id="orderStatus" path="orderStatus">
  <option value="-1">請選擇</option>
  <option value="待付款">待付款</option>
  <option value="待出貨">待出貨</option>
  <option value="已出貨">已出貨</option>
  <option value="已取消">已取消</option>
  </select>
  <form:hidden id="substatus" path="orderStatus" /><br><br>
  <form:label path="totalPrice">總&ensp;金&ensp;額</form:label>
  <form:input path="totalPrice" /><br>
  
 
  <br><br>
  <div class="row justify-content-center">
  <a href="${contextRoot}/backend/order/insert">
  <button type="submit" id="ordersubmit" class="btn btn-primary btn-sm"  name="submit"  onclick="return confirm('確定要新增嗎?')" >確認</button></a>&emsp;  
  
  <button type="button" id="closebutton" class="btn btn-outline-dark btn-sm" data-dismiss="modal" aria-label="Close" >取消</button>
  </div>
  </form:form>
      </div>
      
    </div>
  </div>
</div>

<script type="text/javascript">

// $(document).ready(function(){
	
// 	$ajax({
// 		type:"GET",
// 		url:'order/findStatus',
// 		contentType:'application/json',
// 		data: JSON.stringify(),
// 		success: function(data){
// 			console.log(data);
// 		},error: function(e){
// 			   console.log(e);
// 		   }
// 	})
// })



var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ['一月', '二月', '三月'],
    datasets: [{
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)'
      ],
      borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)'
      ],
      borderWidth: 1,
      label: '銷售業績(百萬)',
      data: [60, 49, 72]
    }]
  }
});



$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('新增訂單 ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})



$('#ordersubmit').click(function() {
  $('#orderform').submit();
});



$(function(){
	
$('#orderStatus').change(function(){
var valuesta = $('#orderStatus').val();
console.log(valuesta);
$('#substatus').val(valuesta);	
	
})	
	
});
</script>


</body>

</html>
<script src="<c:url value="/js/lib/popper.min.js"/>"></script>
<script src="<c:url value="/js/lib/main.js"/>"></script>

<jsp:include page="layout/footer.jsp" />