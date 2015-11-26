<%--
  <headlibs.jsp>

  ==============================================================================

  Includes the scripts and css to be included in the head tag

  ==============================================================================

--%><%@ page session="false" %><%
%><%@include file="/apps/foundation/global.jsp"%>

<c:if test="${wcmMode eq editMode or wcmMode eq designMode}">
    <cq:includeClientLib categories="cq.widgets" />
</c:if>

<cq:includeClientLib css="hdscorp.custom.clientlibs"/>
<cq:includeClientLib js="hdscorp.custom.clientheadlibs"/>

