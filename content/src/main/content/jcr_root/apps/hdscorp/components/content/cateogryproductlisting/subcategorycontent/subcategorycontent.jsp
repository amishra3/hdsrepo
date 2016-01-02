<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>


<div class="category-heading hidden-xs hidden-sm">
	<h2>${properties.subcategorytitle}</h2>
</div>


<div class="category-desc">
	<p>${properties.subcategorytitlesubtext}</p>
</div>

<c:set var="linkUrl" value="${properties.subcatbuttonurl}" />

<c:if test="${fn:startsWith(linkUrl,'/content/')}">
	<c:set var="linkUrl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("linkUrl").toString())%>"/>
</c:if>


<div class="category-promotion clearfix">
     <div class="category-promo-img col-sm-5 hidden-xs ${not empty properties.subcatcontentalign?'floatright':''}">
         <img src="${properties.subcatimagePath}" alt="" title="" class="img-responsive">
     </div>
     <div class="category-promo-desc col-sm-7">
         <h2>${properties.subcategorybannertitle}</h2>
         <p>${properties.subcategorybanneresubtext}</p>
         <div class="btn-square-red learn-more-red-link">
             <a href="${linkUrl}" target="${not empty properties.subcatbuttonurltargettype?'_blank':'_self'}">${properties.subcatbuttonlabel}</a>
         </div>
     </div>
</div>