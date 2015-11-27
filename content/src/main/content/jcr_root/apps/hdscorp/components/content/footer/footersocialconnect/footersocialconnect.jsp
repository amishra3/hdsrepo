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
		<li class="facebook"><a class="gatrack"
			data-ga-track="Engagement||Social||FooterNav:SocialShare:Facebook:Activity_Exit"
			href="${properties.facebookpath}" target="_blank" title="Facebook"></a></li>
	</c:if>
	<c:if test="${properties.twitter}">
		<li class="twitter"><a class="gatrack"
			data-ga-track="Engagement||Social||FooterNav:SocialShare:Twitter:Activity_Exit"
			href="${properties.twitterpath}" target="_blank" title="Twitter"></a></li>
	</c:if>
	<c:if test="${properties.instagram}">
		<li class="instagram"><a class="gatrack"
			data-ga-track="Engagement||Social||FooterNav:SocialShare:Instagram:Activity_Exit"
			href="${properties.instagrampath}" target="_blank" title="Instagram"></a></li>
	</c:if>
	<c:if test="${properties.pinterest}">
		<li class="pinterest"><a class="gatrack"
			data-ga-track="Engagement||Social||FooterNav:SocialShare:Pinterest:Activity_Exit"
			href="${properties.pinterestpath}" target="_blank" title="Pinterest"></a></li>
	</c:if>
	<c:if test="${properties.youtube}">
		<li class="youtube"><a class="gatrack"
			data-ga-track="Engagement||Social||FooterNav:SocialShare:Youtube:Activity_Exit"
			href="${properties.youtubepath}" target="_blank" title="YouTube"></a></li>
	</c:if>
	<c:if test="${properties.foursquare}">
		<li class="foursquare"><a class="gatrack"
			data-ga-track="Engagement||Social||FooterNav:SocialShare:Foursquare:Activity_Exit"
			href="${properties.foursquarepath}" target="_blank"
			title="Foursquare"></a></li>
	</c:if>
</ul>

