<%--
  Homepage Secondary Hero Banner component.
--%>

<%@page session="false"%>

<%@include file="/apps/foundation/global.jsp"%>

<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page import="com.hdscorp.cms.util.PageUtils"%>


<div class="cloud-storage">
	<div class="cloud-storage-container content-container col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="cloud-content col-sm-9 col-md-7 ${properties.secondarycontentalign?'floatright':''}">
			<h1>${properties.secondaryherotitlecontent}</h1>
			<h4>${properties.secondaryherosubtitlecontent}</h4>
				${properties.secondaryherocontent}
			<a href="${properties.secondarybuttonurl}" class="learn-more btn-square -red">${properties.secondarybuttonlabel}</a>
		</div>
		<div class="cloud-image col-md-5">
			<img src="/content/dam/hdscorp/en_us/homepage/banners/cloud-storage.jpg" alt="${properties.secondaryimagealttext}">
		</div>
	</div>
</div>