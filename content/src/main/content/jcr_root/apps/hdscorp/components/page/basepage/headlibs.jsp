<%--
  <headlibs.jsp>

  ==============================================================================

  Includes the scripts and css to be included in the head tag

  ==============================================================================

--%><%@ page session="false" %><%
%><%@include file="/apps/foundation/global.jsp"%>

<c:if test="${ requestScope['com.day.cq.wcm.api.WCMMode']=='EDIT' || 
            requestScope['com.day.cq.wcm.api.WCMMode']=='DESIGN'}">
              <cq:includeClientLib categories ="hdscorp.widgets"/>
 </c:if>
<cq:includeClientLib css="hdscorp.custom.clientlibs"/>
<cq:includeClientLib js="hdscorp.custom.clientheadlibs"/>

