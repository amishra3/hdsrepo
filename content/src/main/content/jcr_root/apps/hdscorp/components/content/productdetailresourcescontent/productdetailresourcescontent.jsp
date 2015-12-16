<%@page session="false"%>

<%@include file="/apps/foundation/global.jsp"%>


<div class="resources-container container-fluid">

	<c:if test="${not empty properties.sectiontitle}">
		<div class="resources-title hidden-xs">${properties.sectiontitle}</div>
	</c:if>

	<div class="row row-no-margin">
		<cq:include path="columnresourcecontentpar" resourceType="hdscorp/components/content/column-control" />
	</div>


	<!-- row start -->
	<div class="row row-reduce-half">
		<cq:include path="resourctatpar" resourceType="hdscorp/components/content/column-control" />
		
		
		
<!-- 		<div class="col-sm-6 col-no-pad">
			<div class="resources-all">
				<a href="javascript:void(0);">See all related resources <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
			</div>
		</div>
		<div class="col-sm-6 col-no-pad">
			<div class="resources-support">
				<a href="javascript:void(0);">Customer &amp; login for support
					resources <span class="glyphicon glyphicon-chevron-right"
					aria-hidden="true"></span>
				</a>
			</div>
		</div>
 -->		
		
	</div>
	<!-- row end -->
</div>