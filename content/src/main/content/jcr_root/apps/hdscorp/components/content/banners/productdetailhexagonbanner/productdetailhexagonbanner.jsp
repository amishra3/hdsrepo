<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>

<c:set var="linkUrl" value="${properties.secondarylinkurl}" />

<c:if test="${fn:startsWith(linkUrl,'/content/')}">
	<c:set var="linkUrl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("linkUrl").toString())%>"/>
</c:if>

<c:set var="bannertype" value="${properties.type}" />
<c:set var="bannerbackgroundstyle" value="" />
<c:set var="hexagoniconstyle" value="" />

<c:if test = "${bannertype == 'customdamimage'}">
	<c:set var="bannerbackgroundstyle" value=" style='background-image: url(${properties.bannerbackgroundimage})''" />
</c:if>

<c:if test = "${bannertype == 'custombkgcolor'}">
	<c:set var="bannerbackgroundstyle" value=" style='background-color:&#35;${properties.colorbackgroundpicker}'" />
</c:if>


<c:if test = "${properties.hexagoniconpath != null}">
	<c:set var="hexagoniconstyle" value=" style='background-image: url(${properties.hexagoniconpath});background-position:0 0;''" />
</c:if>



<div class="${bannertype=='dark'?'specific-tech':'business-specific clearfix'}" ${bannerbackgroundstyle}>
   	<div class="business-specific-container clearfix content-container">
   		<div class="specific-benefit row">
   			<div class="content-container clearfix">
   				<div class="col-xs-12 col-md-8 ${properties.secondarycontentalign?'floatright':''}">
   					<h2>${properties.secondaryherotitlecontent}</h2>
   					<h4>${properties.secondaryherosubtitlecontent}</h4>
   						${properties.secondaryherocontent}
   				</div>
   				<div class="col-xs-12 col-md-4 hexContain">
   					<ul class="calculating-list">
   						<li class="hexagon-transformative hexagon">
   							<span class="sprite icon-advance-lt" ${hexagoniconstyle}></span>
   							<h4>${properties.hexagontitle}</h4>
   							<p>${properties.hexagoncontent}</p>
   							<a class="animateAnchor bottomPos text-center" href="${linkUrl}" target="${properties.secondaryurltargettype?'_blank':'_self'}">${properties.secondarylinklabel}<span class="glyphicon glyphicon-chevron-right animateIcon" aria-hidden="true"></span></a>
   						</li>
   					</ul>
   				</div>
   			</div>
   		</div>
   </div>
</div>