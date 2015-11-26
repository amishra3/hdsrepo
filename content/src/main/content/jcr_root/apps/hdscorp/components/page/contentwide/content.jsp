<%@include file="/apps/foundation/global.jsp"%>



<div id="content-outer-wrapper">

<nav class="homepage-nav hide">

</nav>

	<div id="skrollr-body">

        <c:if test="${pageProperties.personalizationEnabled}">

            <cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext" />            

        </c:if>

        <cq:include path="par" resourceType="foundation/components/parsys" />

	</div>

  </div>
