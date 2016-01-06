<%@page session="false"%>

<%@include file="/apps/foundation/global.jsp"%>

<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>


<c:set var="linkUrl" value="${properties.simplebannerbuttonurl}" />

<c:if test="${fn:startsWith(linkUrl,'/content/')}">
	<c:set var="linkUrl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("linkUrl").toString())%>" />
</c:if>

<c:set var="contentalignclass" value="${properties.contentalign?'floatright textrightalign':''}" />

<c:choose>
	<c:when test="${not empty properties.simplebannertitle}">
		<div class="product-hero-banner server-rack clearfix" style="background-image: url('${properties.simplebannermagePath}');">
          <div class="product-hero-container">
              <div class="col-lg-8 col-md-12 col-xs-12 overRideleft">
                  <h2 class="headline">${properties.simplebannertitle}</h2>
                  <p class="sub-text">${properties.simplebannersubtitle}</p>
                  <div class="btn-square-white request">
                      <a href="${linkUrl}" title="${properties.simpllebannerbuttonlabel}">${properties.simpllebannerbuttonlabel}</a>
                  </div>
              </div>
          </div>
		</div>
	</c:when>
	<c:otherwise>
		<wcmmode:edit>
			<p>
				<span class="cq-text-placeholder-ipe">Configure Product Category Banner </span>
			</p>
		</wcmmode:edit>
	</c:otherwise>
</c:choose>