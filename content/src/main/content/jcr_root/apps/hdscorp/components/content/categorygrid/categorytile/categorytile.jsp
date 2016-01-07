<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>


<c:set var="categoryObj" value="${requestScope['categoryObj']}" />
												
<div class="col-sm-4 overRidePadding">
    <div class="section-product-col panel-box" style="height: 252px;">
        <div class="imageHolder"><img src="images/icon_cloud_pr.gif" alt="Cloud"></div>
        <h3 class="headline">${categoryObj.categoryTitle}</h3>
        <p>Turmoil has engulfed the Galactic Republic. The taxation of trade routes to outlying star. </p>
        <a href="javascript:void(0);" class="animateLink">SEE ALL <span aria-hidden="true" class="glyphicon glyphicon-menu-right animateIcon"></span></a>
    </div>
</div>
