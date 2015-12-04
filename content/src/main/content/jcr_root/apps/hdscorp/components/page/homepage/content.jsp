<%@include file="/apps/foundation/global.jsp"%>

<script src="https://use.typekit.net/pmh2hld.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>


	

	<cq:include path="herobannerpar" resourceType="hdscorp/components/content/banners/homeherobanner" />
	
	
	<cq:include path="secondarybannerpar" resourceType="hdscorp/components/content/banners/homepagesecondarybanner" />
	

	<cq:include path="hexsecondarybannerpar" resourceType="hdscorp/components/content/banners/hexagonbanner" />
	

	<cq:include path="simplebannerpar" resourceType="hdscorp/components/content/banners/homesimplebanner" />

	
	<!-- CONTACT US PROMO STARTS Here-->
		
    	<div class="footer">
    		<div class="footer-blue col-xs-12 col-sm-12 col-md-12 col-lg-12">
    			<div class="footer-container content-container col-md-12">
    				<p class="talk">
    					TO TALK TO A REPRESENTATIVE, CALL <strong>1.888.234.5601</strong>
    				</p>
    				<div class="buttons">
    					<a href="#" class="information btn-square -white hidden-sm hidden-md hidden-lg">Get Information</a>
    					<a href="#" class="reseller">Find a Reseller<span class="sprite icon-caret-white hidden-xs"></span></a>
    					<a href="#" class="information btn-square -white hidden-xs">Get Information</a>
    				</div>
    			</div>
    		</div>
		</div>    	
		
		<!-- CONTACT US PROMO ENDS Here-->
		
		<!-- FOOTER STARTS Here-->
			
    <!-- FOOTER ENDS Here-->	
	
	
		<!-- Secondary Hero Area #4 ENDS Here-->	
	

		<c:if test="${pageProperties.personalizationEnabled}">

			<cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext" />

		</c:if>

		<cq:include path="par" resourceType="foundation/components/parsys" />
