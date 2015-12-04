<%--
  Homepage Hero Banner component.
--%>

<%@page session="false"%>

<%@include file="/apps/foundation/global.jsp"%>

<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>


<c:choose>
	<c:when test="${not empty properties.hextitlecontent}">

		<c:set var="placardList" value="<%=PageUtils.convertMultiWidgetToList(properties,"placardTitle-placardcontent-placardIconPath")%>" />

    	<div class="calculating-success col-xs-12 col-sm-12 col-md-12 col-lg-12">
    		<div class="calculating-success-container content-container">
    			<h1>${properties.hextitlecontent}</h1>
    			<h4>${properties.hexsubtitlecontent}</h4>
					${properties.hexcontent}    	
    			<div class="explore hidden-sm hidden-md hidden-lg">
    				<a href="${properties.hexbuttonurl}" class="btn-square -white">${properties.hexbuttonlabel}</a>
    			</div>
    	
    			<ul class="calculating-list">
    			<c:forEach var="tabList" items="${tabList}">
						<c:set var="placardTitle" value="${placardList.placardTitle}" />
						<c:set var="placardIconPath" value="${placardList.placardIconPath}" />
						<c:set var="placardcontent" value="${placardList.placardcontent}" />
	    				<li class="hexagon-good hexagon270">
	    					<span class="sprite icon-light"></span>
	    					<h4>${placardTitle}</h4>
	    					${placardcontent}
	    				</li>
	    			<li class="hidden-xs">
    					<span class="sprite icon-plus"></span>
    				</li>
	    				
    			</c:forEach>
    			
    			
    			<!-- 
    				<li class="hexagon-good hexagon270">
    					<span class="sprite icon-light"></span>
    					<h4>Good ideas</h4>
    					<p>
    						Lorem ipsum dolor sit consecte<br>tur adipisicing elit, sed do<br>eiusmod tempor.
    					</p>
    				</li>
    				<li class="hidden-xs">
    					<span class="sprite icon-plus"></span>
    				</li>
    				<li class="hexagon-right hexagon270">
    					<span class="sprite icon-gear"></span>
    					<h4>Right tools</h4>
    					<p>
    						Lorem ipsum dolor sit consecte<br>tur adipisicing elit, sed do<br>eiusmod tempor.
    					</p>
    				</li>
    				<li class="hidden-xs">
    					<span class="sprite icon-minus"></span>
    				</li>
    				<li class="hexagon-transformative hexagon270">
    					<span class="sprite icon-layers"></span>
    					<h4>Transformative Business</h4>
    					<p>
    						Lorem ipsum dolor sit consecte<br>tur adipisicing elit, sed do<br>eiusmod tempor.
    					</p>
    				</li> -->
    			</ul>
    	
    			<div class="explore hidden-xs">
    				<a href="${properties.hexbuttonurl}" class="btn-square -white">${properties.hexbuttonlabel}</a>
    			</div>
    		</div>
    	</div>
    		
</c:when>
	<c:otherwise>
		<wcmmode:edit>
			<p>
				<span class="cq-text-placeholder-ipe">Configure Homepage Hexagon Hero Banner</span>
			</p>
		</wcmmode:edit>
	</c:otherwise>
</c:choose>    	