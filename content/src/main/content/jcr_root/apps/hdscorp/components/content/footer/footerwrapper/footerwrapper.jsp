<%--

  footerwrapper component.

  Component to decide number of columns in footer

--%>
<%
%><%@include file="/apps/foundation/global.jsp"%>
<%
%><%@page session="false"%>

<c:set var="columns" value="<%=properties.get("columns")%>" />


<c:choose>
	<c:when test="${empty columns}">
            Please specify column split for footer links
        </c:when>
	<c:otherwise>
	
	
	
    	<div class="footer">
    	
       		
    		<div class="footer-gray col-xs-12 col-sm-12 col-md-12 col-lg-12">
    			<div class="footer-container content-container col-md-12">
    				<div class="nav-list-container">
	    				<c:forEach var="i" begin="1" end="${columns}" varStatus="status">
	    					<c:set var="path" value="brandedfooter_${i}" />
	    					<ul class="nav-list col-sm-6 col-md-3">
	    						<cq:include path="${currentDesign.path}/jcr:content/globalfooter/${path}" 
	    							resourceType="hdscorp/components/content/footer/globalfooter" />
	    					</ul>
	    				</c:forEach>

    				</div>
    	
    				<div class="social">
    					<a href="#"><span class="sprite icon-facebook-white"></span></a>
    					<a href="#"><span class="sprite icon-twitter-white"></span></a>
    					<a href="#"><span class="sprite icon-gplus-white"></span></a>
    					<a href="#"><span class="sprite icon-youtube-white"></span></a>
    					<a href="#"><span class="sprite icon-two-white"></span></a>
    					<a href="#"><span class="sprite icon-group-white"></span></a>
    				</div>
    				<a href="#" class="footer-logo"><span class="sprite hitachi-footer-logo"></span></a>
    			</div>
    		</div>
    		<div class="footer-white col-xs-12 col-sm-12 col-md-12 col-lg-12">
    			<div class="footer-container content-container col-md-12">
    				<cq:include path="${currentDesign.path}/jcr:content/globalfooter/corporatefooter"
								resourceType="hdscorp/components/content/footer/corporatefooter" />
    			
    			</div>
    		</div>
    	</div>	
	
	
	
	
		<!-- <div class="footer-wrapper">
			<nav id="footer-nav">
				<ul>

					<c:forEach var="i" begin="1" end="${columns}" varStatus="status">

						<li class="column-header"><c:set var="path"
								value="brandedfooter_${i}" /> <c:choose>
								<c:when test="${status.last}">
									<cq:include
										path="/etc/designs/hdscorp/jcr:content/global/globalfooter_${path}"
										resourceType="hdscorp/components/content/footer/footersocialconnect" />
								</c:when>
								<c:otherwise>
									<cq:include
										path="/etc/designs/hdscorp/jcr:content/global/globalfooter_${path}"
										resourceType="hdscorp/components/content/footer/globalfooter" />
								</c:otherwise>
							</c:choose></li>

					</c:forEach>

				</ul>
			</nav>
		</div>-->

	</c:otherwise>
</c:choose>
