<%--  
  <footer.jsp>
  ==============================================================================
  Section which includes branded footer area and global footer links.
  ==============================================================================
--%>
<%@include file="/apps/foundation/global.jsp"%>
<c:set var="pageTemplate" value="<%=currentPage.getProperties().get("cq:template")%>" />

    	
<cq:include path="${currentDesign.path}/jcr:content/globalfooter" resourceType="hdscorp/components/content/footer/footerwrapper"/>
    		

<cq:include path="cloudservices" resourceType="cq/cloudserviceconfigs/components/servicecomponents"/> 
