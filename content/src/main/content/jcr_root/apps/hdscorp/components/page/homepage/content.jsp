<%@include file="/apps/foundation/global.jsp"%>

<script src="https://use.typekit.net/pmh2hld.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>


	

	<cq:include path="herobannerpar" resourceType="hdscorp/components/content/banners/homeherobanner" />
	
	
	<cq:include path="secondarybannerpar" resourceType="hdscorp/components/content/banners/homepagesecondarybanner" />
	
	

	<cq:include path="hexsecondarybannerpar" resourceType="hdscorp/components/content/banners/hexagonbanner" />
	


	<!-- Secondary Hero Area #3 STARTS Here-->


    	


	<!-- Secondary Hero Area #3 ENDS Here-->
	
	<!-- Secondary Hero Area #4 STARTS Here-->
	
   	<div class="millennials col-xs-12 col-sm-12 col-md-12 col-lg-12">
   		<div class="millennials-container content-container col-md-12">
   			<div class="millennials-content">
   				<h1>Millennials love<br>working here</h1>
   				<h4>Every after fourth above is first.</h4>
   				<p>
   					This is body text. Pursued by the Empire's sinister agents, Princess Leia races home<br>aboard her starship, custodian of the stolen plans that can save her people and restore<br>freedom and peace to the galaxy. This is body text.
   				</p>
   				<a href="#" class="learn btn-square -white">Learn More</a>
   				<div class="return hidden-sm hidden-md hidden-lg">
   					<a href="#"><span class="sprite icon-arrow-up"></span><br>Return To Top</a>
   				</div>
   			</div>
   		</div>
   	</div>	
	
	
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
