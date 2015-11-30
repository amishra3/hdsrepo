<%--
  globalheader component.
--%>

<%@page import="com.hdscorp.cms.dao.JCRDataAccessor"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page import="com.hdscorp.cms.util.PropertyResolver"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>
<%@page import="com.day.cq.wcm.api.WCMMode"%>
<%@page import="com.day.cq.wcm.api.PageFilter"%>
<%@page import="org.apache.sling.api.resource.ValueMap"%>
<%@ page import="java.util.Iterator"%>
<%@page import="javax.servlet.jsp.PageContext"%>


<%@include file="/apps/foundation/global.jsp"%>

<c:set var="childPages" value="<%=PageUtils.getChildPages(properties.get("rootPath", ""),resourceResolver)%>" />
<c:set var="childs" value="<%=PageUtils.getChildPages(properties.get("rootPath", ""),resourceResolver)%>" />
<%
JCRDataAccessor dataAccessor = new JCRDataAccessor(pageContext);
String seacrhpageUrl=properties.get("searchpathurl",String.class);
if(seacrhpageUrl!=null){
   String shortseacrhUrl=PathResolver.getShortURLPath(seacrhpageUrl);
   pageContext.setAttribute("shortseacrhUrl", shortseacrhUrl);
}

%>

<c:set var="hdsgloballink" value="${properties.hdsglobalPath}"/>
<c:set var="hdsCommunityLink" value="${properties.hdsCommunityPath}" />
<c:if test="${not empty hdsgloballink}">
    <c:choose>
    <c:when test="${fn:startsWith(hdsgloballink, '/content')}">
		<c:set var="hdsgloballink" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("hdsgloballink").toString())%>" />
    </c:when>
    <c:otherwise>
        <c:set var="hdsgloballink" value="${hdsgloballink}"/>
    </c:otherwise>
    </c:choose>
</c:if>

<c:if test="${not empty hdsCommunityLink}">
     <c:choose>
     <c:when test="${fn:startsWith(hdsCommunityLink, '/content')}">
		<c:set var="hdsCommunityLink" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("hdsCommunityLink").toString())%>" />
    </c:when>
    <c:otherwise>
        <c:set var="hdsCommunityLink" value="${hdsCommunityLink}"/>
    </c:otherwise>
    </c:choose>
</c:if>

<c:set var="hdscommunitylinktarget" value="_self"/>
<c:if test="${properties.hdscommunitylinktype eq 'true'}">
	<c:set var="hdscommunitylinktarget" value="_blank"/>
</c:if>

<c:set var="hdsgloballinktarget" value="_self"/>
<c:if test="${properties.hdsgloballinktype eq 'true'}">
	<c:set var="hdsgloballinktarget" value="_blank"/>
</c:if>



<!-- HEADER STARTS -->

	<div class="header">
		<div
			class="header-container content-container col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<span class="hitachi-logo hidden-xs hidden-sm"></span> <span
				class="hitachi-logo-mobile hidden-md hidden-lg"></span>
			<div class="navigation hidden-xs hidden-sm">
				<ul>
					<li><a href="${hdsgloballink}" x-cq-linkchecker="skip" target="${hdsgloballinktarget}"><span class="icon nav-globe"></span>
							${properties.hdsglobaltext}</a></li>
					<li><a href="${hdsCommunityLink}" x-cq-linkchecker="skip" target="${hdscommunitylinktarget}"><span class="icon nav-community"></span>
							${properties.hdscommunitytext}</a></li>
					<li class="search"><input type="text"
						placeholder="${properties.searchboxtext}"><span class="icon nav-search"></span>
					</li>
				</ul>
			</div>
			<div class="navigation-mobile hidden-md hidden-lg">
				<div class="search-mobile">
					<span class="sprite icon-search-mobile"></span>
				</div>
				<select>
					<option>USA</option>
				</select>
			</div>
		</div>
		<div class="sub-navigation-container">
			<div class="sub-navigation">
				<h5 class="col-md-3">${properties.topnanhdstext}</h5>
				<ul class="col-xs-12 col-sm-12">
					<c:forEach var="childPage" items="${childPages}" varStatus="count">
						<c:if test="${childPage.hideInNav != true}">
							<c:set var="pagepath" value="${childPage.path}/jcr:content"/>
			                <c:set var="pageprops" value="<%=dataAccessor.getResource(pageContext.getAttribute("pagepath").toString())%>" />
		                    <c:set var="subtext" value="${pageprops.subtext}" />
		                    <c:choose>
		   			 			<c:when test="${not empty childPage.navigationTitle}">
		         		 			<li class="col-xs-4 col-sm-4 "><a href="${childPage.path}.html">${childPage.navigationTitle}</a></li>
		             			</c:when> 
					     	  	<c:otherwise>
									<li class="col-xs-4 col-sm-4 "><a href="${childPage.path}.html">${childPage.title}</a></li>
				         		</c:otherwise>  
	   			 			</c:choose> 	                    
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
<!-- HEADER ENDS HERE -->