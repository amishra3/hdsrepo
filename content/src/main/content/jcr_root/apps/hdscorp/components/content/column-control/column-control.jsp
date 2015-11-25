<%@include file="/libs/foundation/global.jsp" %>

<c:if test="${requestScope['com.day.cq.wcm.api.WCMMode']=='EDIT'}">
    <cq:includeClientLib categories="acs-commons.columncontrol.widgets"/>
</c:if>

<cq:includeClientLib css="acs-commons.main,acs-commons.components"/>

<c:set var="columns" value="${properties.columns}"/>

<c:choose>
    <c:when test="${empty columns}">
         <c:if test="${requestScope['com.day.cq.wcm.api.WCMMode']=='EDIT'}">
            You need to specify the column widths.
        </c:if>
         
    </c:when>
    <c:otherwise>
        <c:forEach items="${columns}" var="column" varStatus="status">
            <div class="acs-commons-resp-colctrl-col acs-commons-resp-colctrl-col-${column}" >
                  <cq:include path="par${status.count}" resourceType="foundation/components/parsys" />
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>
