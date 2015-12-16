<%@page session="false"%>

<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>

<c:set var="linkUrl" value="${properties.ctatargeturl}"/>
<c:if test="${fn:startsWith(linkUrl,'/content/')}">
	<c:set var="linkUrl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("linkUrl").toString())%>"/>
</c:if>
<div class="col-sm-6 col-no-pad">
	<div class="resources-all">
		<a href="${linkUrl}">${properties.ctalabel}<span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
	</div>
</div>