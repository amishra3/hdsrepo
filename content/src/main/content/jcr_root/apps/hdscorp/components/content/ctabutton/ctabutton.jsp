<%@page session="false"%>

<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>

<c:set var="linkUrl" value="${properties.ctatargeturl}"/>
<c:if test="${fn:startsWith(linkUrl,'/content/')}">
	<c:set var="linkUrl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("linkUrl").toString())%>"/>
</c:if>

<c:set var="editbarstyle" value="" />
<wcmmode:edit>
	<c:set var="editbarstyle" value="style='overflow:auto;'" />
</wcmmode:edit>

<div class="col-sm-6 col-no-pad ${editbarstyle}">
	<div class="resources-all cyancta">
		<a href="${linkUrl}">${properties.ctalabel}
		<c:if test="${empty properties.hidectaarrow}">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
		</c:if>	
	</div>
</div>