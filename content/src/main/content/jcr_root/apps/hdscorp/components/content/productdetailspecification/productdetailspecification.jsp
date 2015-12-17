<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>
<%@page import="com.hdscorp.cms.util.PathResolver"%>

<c:set var="downloadspectargeturl" value="${properties.downloadspectargeturl}" />
<c:if test="${fn:startsWith(downloadspectargeturl,'/content/')}">
	<c:set var="downloadspectargeturl" value="<%=PathResolver.getShortURLPath(pageContext.getAttribute("downloadspectargeturl").toString())%>" />
</c:if>


	<div class="spec-container container-fluid">
              <div class="spec-title hidden-xs">
                  ${properties.sectiontitle}
                  <div class="spec-download-pdf">
                    <p><a href="${downloadspectargeturl}" target="${properties.downloadspeclinkopeninnew?'_blank':'_self'}">${properties.downloadspeclinklabel}<span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span></a></p>
                  </div>
              </div>

			<!--TECH SPEC TABLE START--> 
            
              <div class="row">
			  		<cq:include path="techspecpar" resourceType="hdscorp/components/content/productdetailtechspecs" />
			  </div>
			<!--TECH SPEC TABLE END-->


              <div class="tbd-dl">
                  <p><a class="btn-square btn-square-white" href="${properties.downloadspecctatargeturl}" target="${properties.downloadspecctaopeninnew?'_blank':'_self'}">${properties.downloadspecctalabel}</a></p>
              </div>

              <!-- test -->
              <div class="vsp-soft-products">
                <div class="vsp-soft-products-title">Virtual Storage Platform Series Available Mainframe Software Products</div>
                <div class="accordion-level" id="accord-box1">
                    <div class="accordion-menu-container">
                        <div class="accordion-menu">
                            <div id="stickyNav-0" class="acc-label">Storage and Data Management: Operating System Products</div>
                            <span class="icon-accordion-closed"></span>
                            <span class="icon-accordion-opened"></span>
                        </div>
                    </div>
                    <div class="accordion-content">
                        <div id="box1">
                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>


                                    </div>
                                </div>
                            </div>

                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>
                                    </div>
                                </div>
                            </div>          
                      </div>
                  </div>                
                </div>
                
               <!--   <div class="accordion-level" id="accord-box2">
                    <div class="accordion-menu-container">
                        <div class="accordion-menu">
                            <div id="stickyNav-0" class="acc-label">Storage and Data Management: Data Mobility</div>
                            <span class="icon-accordion-closed"></span>
                            <span class="icon-accordion-opened"></span>
                        </div>
                    </div>
                    <div class="accordion-content">
                        <div id="box2">
                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>          
                    </div>
                </div>

                <div class="accordion-level" id="accord-box3">
                    <div class="accordion-menu-container">
                        <div class="accordion-menu">
                            <div id="stickyNav-0" class="acc-label">Data Protection: In-System Replication for Mainframe Products</div>
                            <span class="icon-accordion-closed"></span>
                            <span class="icon-accordion-opened"></span>
                        </div>
                    </div>
                    <div class="accordion-content">
                        <div id="box3">
                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>          
                    </div>
                </div>

              <div class="accordion-level" id="accord-box4">
                    <div class="accordion-menu-container">
                        <div class="accordion-menu">
                            <div id="stickyNav-0" class="acc-label">Data Protection: In-System Replication for Mainframe Products</div>
                            <span class="icon-accordion-closed"></span>
                            <span class="icon-accordion-opened"></span>
                        </div>
                    </div>
                    <div class="accordion-content">
                        <div id="box4">
                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>
                                    </div>
                                </div>
                            </div>

                            <div class="vsp-soft-products-details clearfix">
                                <div class="col-sm-4">                                
                                    <div class="product-name">Hitachi Storage Virtualization Operating System(SVOS) <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                    <div class="product-download">DOWNLOAD SOFTWARE <span aria-hidden="true" class="glyphicon glyphicon-new-window"></span></div>
                                    <div class="product-email">EMAIL SOFTWARE INFORMATION <span aria-hidden="true" class="glyphicon glyphicon-menu-right"></span></div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="product-desc">
                                      <div class="comment more">
                                        <p>SVOS offers system management and advanced storage system functions such as storage virtualization, thin provisioning, storage service-level controls and performance instrumentation across multiple storage platforms.</p>
                                        <p>For mainframe storage, SVOS includes Hitachi Device Manager, Hitachi Storage Navigator, Hitachi Dynamic Provisioning for Mainframe, Hitachi Universal Voume Manager, Hitachi Virtual Partition Manager, Hitachi Resource Partition Manager, Hitachi Data Retention Utility, performance monitor feature, volume shredder feature, LUN manager, Hitachi Volume Retention, cache residency manager for mainframe feature, RAIDCOMN, Java API, CCI, SMI=-S provider and SNMP agent.</p>
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>          
                    </div>
                </div>
 -->
            </div>

          </div>
          
