<%--  
  <header.jsp>

  ==============================================================================
  
  JSP Script to generate universal header section of the page.
  
  ==============================================================================
--%>
<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page import="java.util.*, javax.jcr.Node, com.hdscorp.cms.util.JcrUtilService, com.hdscorp.cms.config.HdsCorpGlobalConfiguration" %>



<cq:include path="${currentDesign.path}/jcr:content/globalheader" resourceType="hdscorp/components/content/globalheader"/>