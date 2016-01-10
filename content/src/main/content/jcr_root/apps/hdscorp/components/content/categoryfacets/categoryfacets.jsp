<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.slingmodels.CategoryFacetsModel"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>

<sling:adaptTo adaptable="${resource}" adaptTo="com.hdscorp.cms.slingmodels.CategoryFacetsModel" var="model" />

<%
	String viewtype = "";
	String[] selectorArray = slingRequest.getRequestPathInfo().getSelectors();
	if (selectorArray != null && selectorArray.length > 0) {
		viewtype = selectorArray[0];
	}
	
	pageContext.setAttribute("selectorString", viewtype);
%>

<c:set var="contentrenderingpagepath" value="${requestScope['contentrenderingpagepath']}" />


<div class="col-md-3 product-listing">
	<ul id="asideLinks-product">
		<li class="active"><a href="javascript:void(0);" data-href="all-product-solutions.html"> all products &amp;solutions </a></li>

		<c:forEach items="${model.categories}" var="data" varStatus="status">

			<li>
				<c:set var="categorytags" value="${data['category-tag']}"/>
				<c:set var="categoryTargetURL" value="${contentrenderingpagepath}.${fn:replace(categorytags, '/', '|')}.html"/>
				<c:set var="categoryTargetURL" value="${fn:replace(categoryTargetURL, '\"', '')}"/>
				
				<c:if test="${selectorString==data['category-id']}">
					<c:set var="includetargetURL" value="${categoryTargetURL}" scope="request"/>
				</c:if>
				
				<a href="javascript:void(0);" data-href="${categoryTargetURL}" id="${xss:filterHTML(xssAPI,data['category-id'])}">
						${xss:filterHTML(xssAPI,data['display-title'])} <span
						class="icon-accordion-closed"></span> <span
						class="icon-accordion-opened"></span>
				</a>
				
			    <c:if test="${selectorString== xss:filterHTML(xssAPI,data['category-id'])}">
					<c:set var="includeURL" value="${subcat.subcatcontenturl}" />
					<c:set var="activeSubCatIndex" value="${status.index}" />			
				</c:if>
				
				
				<ul>
					<c:forEach items="${data['sub-category']}" var="subCategoryData" varStatus="counter">
					<li>
						<div class="checkbox">
							<input class="filters" type="checkbox" name="cbxFunction"
								id="${xss:filterHTML(xssAPI,subCategoryData['sub-category-ID'])}"
								value="${xss:filterHTML(xssAPI,subCategoryData['sub-category-tag'])}">
							
							<label for="cloudStorage" class="hds-icon"><span>${xss:filterHTML(xssAPI,subCategoryData['sub-category-title'])}</span></label>
						</div>
					</li>

					</c:forEach>
				</ul>
			</li>
		</c:forEach>

	</ul>
</div>


