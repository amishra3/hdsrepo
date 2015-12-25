<%@include file="/apps/foundation/global.jsp"%>

<%@page import="com.hdscorp.cms.search.SearchServiceHelper"%>
<%@page import="com.day.cq.wcm.api.Page"%>
<%@page import="com.day.cq.search.result.SearchResult"%>
<%@page import="com.day.cq.search.result.Hit"%>
<%@page import="java.util.List"%>
<%
try{
	SearchServiceHelper searchServiceHelper = sling.getService(com.hdscorp.cms.search.SearchServiceHelper.class);
	String paths[] = {"/content/geometrixx-outdoors/en/men"};
	String tags[] = {"geometrixx-outdoors:gender/women","geometrixx-outdoors:season/winter"};
	String template= "/apps/geometrixx-outdoors/templates/page_product";
	template=null;
	String type = "cq:Page";
	boolean doPagination = false;
	String returnOffset="0";
	String returnLimit="10";
	SearchResult result = searchServiceHelper.getFullTextBasedResuts(paths,null,template,type,"test shirt",doPagination,returnOffset,returnLimit,resourceResolver);
	List<Hit> hits = result.getHits();
	pageContext.setAttribute("hits", hits);
	out.println("<BR><BR><BR><BR>");
	out.println("Execution Time *******" + result.getExecutionTime()+"<BR>");
	out.println("Total Matches *******" + result.getTotalMatches()+"<BR>");
	out.println("Query Statement *******" + result.getQueryStatement()+"<BR>");
	out.println("Filtering Predicates *******" + result.getFilteringPredicates()+"<BR>");
	out.println("<BR><BR><BR><BR>");
	
	for (Hit hit : hits) {
		
		Page reourcePage = hit.getResource().adaptTo(Page.class);
	    String pageTitle = reourcePage.getTitle();
	    String pagePath = reourcePage.getPath();
	    String pageDescription = reourcePage.getDescription();
	 
	    if (pageTitle!=null) {
	        pageTitle = pagePath.substring(pagePath.lastIndexOf('/') + 1, pagePath.length());
	    }
	    
	    out.println("<a href="+pagePath+" style='padding-left:5em;margin-bottom:5em;'>"+pageTitle+"</a>"+"<BR>");
	    if(pageDescription!=null){
	    	out.println(pageDescription+"<BR>");	
	    }
	    //out.println(hit.getExcerpt()+"<BR>");
	    
	}
	
	
	
}catch( Exception ex){
	System.out.println("+++++++++++++++IN ERROR BLOCK"+ex.getMessage());
}
%>


