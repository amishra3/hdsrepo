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
		<div class="footer-wrapper">
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
		</div>
		<div class="copyright-wrapper">
			<cq:include
				path="/etc/designs/hdscorp/jcr:content/global/corporatefooter"
				resourceType="hdscorp/components/content/footer/corporatefooter" />
		</div>
	</c:otherwise>
</c:choose>
