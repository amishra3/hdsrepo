<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>

<c:set var="subcatlist" value="<%=PageUtils.convertMultiWidgetToList(properties,"subcatdisplaylabel-subcatcontenturl-subcatid")%>" />
 												
<div class="col-md-3 category-listing">
	<ul id="asideLinks">
	
		<c:forEach var="subcat" items="${subcatlist}" varStatus="loopcnt">
			<c:set var="linkUrl" value="${subcat.subcatcontenturl}"/>
			<c:if test="${fn:startsWith(linkUrl,'/content/')}">
				<c:set var="linkUrl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("linkUrl").toString())%>"/>
			</c:if>	
			
			<li class="linkLeft ${loopcnt.index==0?'active':''}">
				<a href="javascript:void(0);"
					data-loadhtml="${linkUrl}"
					class="${loopcnt.index==0?'active':'dummyclass'}"> 
						${subcat.subcatdisplaylabel}
						<span class="icon-accordion-closed hidden-md hidden-lg"
						style="display: none;"></span> 
						<span class="icon-accordion-opened hidden-md hidden-lg"
						style="display: inline-block;"></span>
				</a>			
			
				<div class="MobileHolderWrapper"></div>
			</li>
		
		</c:forEach>	
			
	</ul>
</div>
