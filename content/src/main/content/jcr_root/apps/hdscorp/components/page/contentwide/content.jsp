<%@include file="/apps/foundation/global.jsp"%>




<!-- Header Starts Here -->

<!-- Header Ends Here -->

<div style="clear: both;"></div>

<div class="contentarea">

	<c:if test="${pageProperties.personalizationEnabled}">
	
		<cq:include path="clientcontext"
			resourceType="cq/personalization/components/clientcontext" />
	
	</c:if>
	

	<cq:include path="par" resourceType="foundation/components/parsys" />

</div>