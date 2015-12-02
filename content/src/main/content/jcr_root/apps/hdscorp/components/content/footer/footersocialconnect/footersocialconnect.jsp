<%--
  footersocialconnect component.
  This component is used to display social connect icons in the global footer
--%>
<%

%><%@include file="/apps/foundation/global.jsp"%>
<%@page session="false"%>

<c:if test="${not empty properties.header}">
	<h4>${properties.header}</h4>
</c:if>
<ul class="social-icons">
	<c:if test="${properties.facebook}">
		<a href="${properties.facebookpath}"><span class="sprite icon-facebook-white"></span></a>
	</c:if>
	<c:if test="${properties.twitter}">
		<a href="${properties.twitterpath}"><span class="sprite icon-twitter-white"></span></a>		
	</c:if>
	<c:if test="${properties.googleplus}">
		<a href="${properties.googlepluspath}"><span class="sprite icon-gplus-white"></span></a>
	</c:if>
	<c:if test="${properties.youtube}">
		<a href="${properties.youtubepath}"><span class="sprite icon-youtube-white"></span></a>
	</c:if>
</ul>


<!-- 
	<a href="#"><span class="sprite icon-two-white"></span></a>
	<a href="#"><span class="sprite icon-group-white"></span></a>
 -->