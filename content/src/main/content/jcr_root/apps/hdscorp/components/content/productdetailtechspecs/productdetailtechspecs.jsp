<%@page session="false"%>
<%@include file="/apps/foundation/global.jsp"%>


<div class="col-sm-12">
	<div id="no-more-tables">
		<table
			class="table-bordered table-striped table-condensed cf specs-table">
			<tbody>

				<c:forEach var="items" items="${properties.techspecdata}" varStatus="status">
					<c:set var="listItem" value="${fn:split(items,'|')}" />
					<c:set var="rowHeading" value="${fn:trim(listItem[0])}" />
					<c:set var="columnContent" value="${fn:trim(listItem[1])}" />
					<c:set var="columns" value="${fn:trim(listItem[2])}" />

					<tr>
						<th class="tech-specs-pro-name" data-title="${rowHeading}">${rowHeading}</th>

						<c:set var="columnItems" value="${fn:split(columnContent,',')}" />
						<c:forEach var="columnItem" items="${columnItems}" varStatus="columnstatus">
							<td>
								<div class="product-specs clearfix">
									<!-- <div class="pro-type">G200</div>-->
									<div class="pro-category">${columnItem}</div>
								</div>
							</td>

						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>