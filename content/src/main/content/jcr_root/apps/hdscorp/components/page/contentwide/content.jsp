<%@include file="/apps/foundation/global.jsp"%>



<div class="one-column">
	<!-- Header Starts Heere -->

	<cq:include path="${currentDesign.path}/jcr:content/globalheader" resourceType="hdscorp/components/content/globalheader"/>

	<!-- Header Ends Heere -->

        <c:if test="${pageProperties.personalizationEnabled}">

            <cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext" />            

        </c:if>

        <cq:include path="par" resourceType="foundation/components/parsys" />

</div>
