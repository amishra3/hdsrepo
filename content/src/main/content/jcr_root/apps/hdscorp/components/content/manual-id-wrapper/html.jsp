<%@include file="/apps/responsive/business/global-business.jsp"%>

<c:set var="id" value="${properties.id}"/>
<c:choose>
    <c:when test="${not empty id}">
        <div id="${properties.id}"><cq:include path="wrapper-parsys" resourceType="foundation/components/parsys"/></div>
    </c:when>
    <c:otherwise>
        <cq:include path="wrapper-parsys" resourceType="foundation/components/parsys"/>
    </c:otherwise>
</c:choose>
<c:if test="${wcmMode == 'EDIT' || wcmMode == 'DESIGN'}">
    <cq:include path="end" resourceType="responsive/business/components/content/manual-id-wrapper/end" />
</c:if>
