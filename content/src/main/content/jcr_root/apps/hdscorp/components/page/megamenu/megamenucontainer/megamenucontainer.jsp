<%@include file="/apps/foundation/global.jsp"%>

<c:set var="topnavelementpath" value="${properties.topnavelementpath}"/>


<cq:include path="megamenu-parsys" resourceType="foundation/components/parsys"/>

<wcmmode:edit>
	<c:if test="${not empty topnavelementpath}">
		<p>
			<span class="cq-text-placeholder-ipe">Configure megamenu content here.</span>
		</p>
	</c:if>
    <cq:include path="end" resourceType="/apps/hdscorp/components/content/manual-id-wrapper/end" />
</wcmmode:edit>
