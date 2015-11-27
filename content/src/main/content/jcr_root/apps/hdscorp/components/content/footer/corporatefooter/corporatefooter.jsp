
<%--
  <corporatefooter.jsp>

  ==============================================================================

  corporatefooter component - This component displays the footer components.

  ==============================================================================

--%>

<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>

<c:set var="footerLinks" value="<%=properties.get("footer")%>" />
<c:set var="footersubtext" value="<%=properties.get("footersubtext")%>" />
<c:set var="copyrighttext" value="<%=properties.get("copyrighttext")%>" />

<div class="legal group">

		<c:choose>
			<c:when test="${not empty footerLinks}">
				<c:set var="corporateFooterLinks"
					value="<%=PageUtils.convertMultiWidgetToList(properties,
							"urlLabel-pageUrl")%>" />
                <span class="copyright">${copyrighttext}${footersubtext}</span>
				<c:forEach var="link" items="${corporateFooterLinks}"
					varStatus="loop">
		  <c:set var="linkUrl" value="${link.pageUrl}" />
              <c:choose>
    <c:when test="${fn:startsWith(linkUrl,'/content/')}">
                                <c:set var="linkUrl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("linkUrl").toString())%>"/>
                </c:when>
                <c:otherwise>
                                <c:set var="linkUrl" value="${linkUrl}"/>
    </c:otherwise>
</c:choose>
                <a href="${linkUrl}">${link.urlLabel}</a>

	</c:forEach>
	</c:when>
	<c:otherwise>
        <c:if test="${requestScope['com.day.cq.wcm.api.WCMMode']=='EDIT' || 
        requestScope['com.day.cq.wcm.api.WCMMode']=='DESIGN'}">
		<a>Please provide global footer links</a>
        </c:if>
	</c:otherwise>
	</c:choose>

</div>
