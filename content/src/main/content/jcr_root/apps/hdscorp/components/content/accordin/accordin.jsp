<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>

<%@page import="com.hdscorp.cms.util.PathResolver"%>
<%@page import="com.day.cq.wcm.api.Page"%>
<%@ page import="org.apache.sling.api.resource.ResourceResolver,
					com.day.cq.wcm.commons.WCMUtils,
					com.day.cq.wcm.api.components.Toolbar"%>


<div id="accord-overview" class="accordion-level">
	<div class="accordion-menu-container">
		<div class="accordion-menu hidden-sm hidden-md hidden-lg">
			Overview <span class="icon-accordion-closed"></span> <span
				class="icon-accordion-opened"></span>
		</div>
	</div>
	<div class="accordion-content">
		<div id="overview">
			<div class="business-specific clearfix">
				<div class="business-specific-container clearfix content-container">
					<div class="hidden-xs" style="position: relative;">
						<div class="navContain">
							<div class="stickNav-background">
								<div class="stickNav-container">
									<ul class="list-inline stickyNav">
										<li class="overview active"><a href="#overview">Managed Cloud ServicesS</a></li>
										<li class="features-benefits"><a href="#features-benefits">Advantages</a></li>
										<li class="resources"><a href="#resources">Resources</a></li>
										<li class="tech-specifications"><a href="#tech-specifications">Specifications</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




