<%@page import="com.day.cq.wcm.api.Page"%>
<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>
<%@ include file="service.jsp" %>


	<c:forEach var="product" items="${productsList}" varStatus="loopcnt">
		<c:set var="productTitle" value="${product.productTitle}" />
		<c:set var="productInitialChar" value="${fn:substring(productTitle, 0,1)}" />
		<div class="product" data-sort="${productInitialChar}" style="display: block;">
			<h3><a href="${product.productPath}">${product.productTitle}</a></h3>
		    ${product.productDescription}
		    <a href="${product.productPath}" class="animateLink">View Product <span aria-hidden="true" class="glyphicon glyphicon-menu-right animateIcon"></span></a>
		 </div>
	</c:forEach>
 

