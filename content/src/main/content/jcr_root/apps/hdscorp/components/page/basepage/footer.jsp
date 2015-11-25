<%--  
  <footer.jsp>
  ==============================================================================
  Section which includes branded footer area and global footer links.
  ==============================================================================
--%>
<%@include file="/apps/foundation/global.jsp"%>
<c:set var="pageTemplate" value="<%=currentPage.getProperties().get("cq:template")%>" />
<footer>
   <!--  <cq:include path="'<%=currentDesign.getPath()%>'/jcr:content/global/columncontrol" resourceType="hdscorp/components/content/footerwrapper" />-->
</footer>

<cq:includeClientLib js="hdscorp.custom.clientlibs"/>
<cq:include path="cloudservices" resourceType="cq/cloudserviceconfigs/components/servicecomponents"/> 
