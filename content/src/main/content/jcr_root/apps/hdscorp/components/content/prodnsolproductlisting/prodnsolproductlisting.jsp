<%@page session="false"%>

<%@include file="/apps/foundation/global.jsp"%>


            <!--Product Search Area-->
            <div class="product-search-area clearfix">
                <div class="content-container">
                    <div class="container-fluid">
                        <h2 class="sectionheading">${properties.prodnsolsectiontitle}</h2>
                        <div class="col-xs-12 col-md-10 col-md-offset-1">
                            <div id="custom-search-input">
                                <div class="pr-search">
                                    <input type="text" placeholder="${properties.searchboxdeafulttext}">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Container-Results container-fluid overRideRight">
                    	<c:set var="viewproductlabel" value="${properties.viewproductlabel}" scope="request"/>
                    	<c:set var="contentrenderingpagepath" value="${properties.contentrenderingpagepath}" scope="request"/>
                    	
                    	<c:if test="${empty properties.contentrenderingpagepath}">
                    		<c:set var="contentrenderingpagepath" value="/content/hdscorp/en_us/lookup/prodnsolcontent/prodnsolrenderer" scope="request"/>
                    	</c:if>
                    
                    	<cq:include path="subcategoryfilterpar" resourceType="hdscorp/components/content/categoryfacets" />
                        
                        
                        <div class="col-md-9" id="contentCatagory">
                            <div class="result-product">
                                <div class="category-heading hidden-xs hidden-sm">
                                    <h2></h2>
                                </div>
                                <div class="navLinks">
                                    <div class="countProducts">
                                    	<c:set var="resultcountmessagetext" value="<p>Showing <strong id='actualCount'></strong> of <strong id='TotalCount'></strong> products</p>"/>
                                    	<c:if test="${not empty properties.resultcountmessagetext}">
                                    		<c:set var="resultcountmessagetext" value="${properties.resultcountmessagetext}"/>
                                    	</c:if>
                                    	<c:out value='${resultcountmessagetext}' escapeXml="false"/>
                                    </div>
                                    <div class="toggleLinks hidden-xs hidden-sm">
                                        <a href="javascript:void(0)" data-tab="tab-1" class="tab current">${properties.displaysortlabel}</a>
                                        <a href="javascript:void(0)" data-tab="tab-2" class="tab">${properties.productatozsortlabel}</a>
                                    </div>
                                </div>
                                 <div class="headerSort">
                                        <ul class="sortAlpha">
	                                        <li><a href="javascript:void(0);" data-cat="all" class="current">ALL</a></li>
	                                        <c:set var="alphabet" value="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" />
	                                        <c:if test="${not empty properties.alphabetlist}">
	                                        	<c:set var="alphabet" value="${properties.alphabetlist}" />
	                                        </c:if>
											<c:forTokens var="letter" items="${alphabet}" delims=",">
											    <li><a href="javascript:void(0);" data-cat="${letter}">${letter}</a></li>
											</c:forTokens>
                                        </ul>
                                    </div>  
                                <div id="tab-1" class="tab-content current">
                                    <div class="category-products-listing" id="loadCatagoryContent">
                                    
                                    <!-- Content Populated Here -->
                                    <c:set var="includetargetURL" value="${requestScope['includetargetURL']}" />
                                    <c:if test="${not empty includetargetURL}">
                                   		<sling:include path="${includetargetURL}" />
                                    </c:if>
                                    </div>
                                    <div class="btn-square-red load-more-link" id="loadMoreBtn" style="display:none;">
                                        <a href="javascript:void(0);" title="${properties.loadmorelabel}">${properties.loadmorelabel}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.Product Search Area-->