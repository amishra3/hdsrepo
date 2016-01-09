<%@include file="/apps/foundation/global.jsp"%>
<%@page session="false"%>
<%@ taglib prefix="xss" uri="http://www.adobe.com/consulting/acs-aem-commons/xss" %>
<%@page import="com.hdscorp.cms.slingmodels.CategoryFacetsModel"%>

<sling:adaptTo adaptable="${resource}" adaptTo="com.hdscorp.cms.slingmodels.CategoryFacetsModel" var="model" />

<div class="col-md-3 product-listing">
	<ul id="asideLinks-product">
		<li class="active"><a href="javascript:void(0);" data-href="all-product-solutions.html"> all products &amp;solutions </a></li>

		<c:forEach items="${model.categories}" var="data" varStatus="status">

			<li>
				<a href="javascript:void(0);" data-href="storage.html"
					id="${xss:filterHTML(xssAPI,data['category-id'])}">
						${xss:filterHTML(xssAPI,data['display-title'])} <span
						class="icon-accordion-closed"></span> <span
						class="icon-accordion-opened"></span>
				</a>
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


