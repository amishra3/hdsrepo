package com.hdscorp.cms.search;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jcr.Session;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.resource.ResourceResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.search.PredicateGroup;
import com.day.cq.search.Query;
import com.day.cq.search.QueryBuilder;
import com.day.cq.search.result.Hit;
import com.day.cq.search.result.SearchResult;
import com.hdscorp.cms.util.JcrUtilService;

@Component(immediate = true, metatype = true)
@Service(value = SearchServiceHelper.class)
@Properties({
		@Property(name = "service.pid", value = "com.hdscorp.cms.service.SearchServiceHelper", propertyPrivate = false),
		@Property(name = "service.description", value = "Search service", propertyPrivate = false),
		@Property(name = "service.vendor", value = "HDS Corp", propertyPrivate = false) })
public class SearchServiceHelper {

	@Reference
	private QueryBuilder queryBuilder;

	private static final Logger LOG = LoggerFactory.getLogger(SearchServiceHelper.class);

	public List<Hit> getTagBasedResuts(String[] paths, String[] tags,String template, String type) {

		long startTime = Calendar.getInstance().getTimeInMillis();
		Map<String, String> searchParams = new HashMap<String, String>();

		if (type != null && !type.isEmpty()) {
			searchParams.put("type", type);
		}

		searchParams.put("group.1_group.p.or", "true");
		int i = 0;
		for (String path : paths) {
			searchParams.put("group.1_group." + ++i + "_path", path);
		}

		searchParams.put("group.2_group.p.and", "true");
		searchParams.put("group.2_group.1_property","@jcr:content/metadata/cq:tags");
		int k = 0;
		for (String tag : tags) {
			searchParams.put("group.2_group.1_property." + ++k + "_value", tag);
		}

		if (template != null && !template.isEmpty()) {
			searchParams.put("group.2_group.2_property","@jcr:content/cq:template");
			searchParams.put("group.2_group.2_property.1_value", template);
		}

		searchParams.put("group.p.and", "true");
		searchParams.put("p.guesstotal", "true");
		searchParams.put("p.offset", "0");
		searchParams.put("p.limit", "10");
		//searchParams.put("p.limit", "-1");
		LOG.debug("before cretae query************"+ searchParams.toString());
		Query query = queryBuilder.createQuery(PredicateGroup.create(searchParams),JcrUtilService.getSession());
		SearchResult result = query.getResult();
		List<Hit> hits = result.getHits();
		LOG.debug("No of hits*******" + hits.size());
		long endTime = Calendar.getInstance().getTimeInMillis();
		long time = endTime - startTime;
		LOG.debug("Total time *************" + time / 1000);
		return hits;
	}

	
	
	public SearchResult getFullTextBasedResuts(String[] paths, String[] tags,String template, String type, String searchKeyword, boolean doPagination, String returnOffset, String returnLimit ,ResourceResolver resourceResolver) {

		Map<String, String> searchParams = new HashMap<String, String>();
		int groupCnt=1;
		
		
		if (type != null && !type.isEmpty()) {
			searchParams.put("type", type);
		}
		
		if (paths != null && paths.length>0) {
			searchParams.put("group."+groupCnt+"_group.p.or", "true");
			int i = 0;
			for (String path : paths) {
				searchParams.put("group."+groupCnt+"_group." + ++i + "_path", path);
			}
			groupCnt++;
		}
		
		if(tags!=null && tags.length>0){
			searchParams.put("group."+groupCnt+"_group.p.and", "true");
			searchParams.put("group."+groupCnt+"_group.1_property","@jcr:content/metadata/cq:tags");
			int k = 0;
			for (String tag : tags) {
				searchParams.put("group."+groupCnt+"_group.1_property." + ++k + "_value", tag);
			}
			groupCnt++;
		}

		
		if (template != null && !template.isEmpty()) {
			searchParams.put("group."+groupCnt+"_group.2_property","@jcr:content/cq:template");
			searchParams.put("group."+groupCnt+"_group.2_property.1_value", template);
			groupCnt++;
		}
			
		
		if(searchKeyword!=null){
			// combine this group with OR
			searchParams.put("group."+groupCnt+"_group.p.or", "true"); 
			searchParams.put("group."+groupCnt+"_group.1_fulltext", searchKeyword);
			searchParams.put("group."+groupCnt+"_group.1_fulltext.relPath", "jcr:content");
			searchParams.put("group."+groupCnt+"_group.2_fulltext", searchKeyword);
			searchParams.put("group."+groupCnt+"_group.2_fulltext.relPath", "jcr:content/@cq:tags");
			searchParams.put("group."+groupCnt+"_group.3_fulltext", searchKeyword);
			searchParams.put("group."+groupCnt+"_group.3_fulltext.relPath", "jcr:content/@jcr:title");
			searchParams.put("group."+groupCnt+"_group.4_fulltext", searchKeyword);
			searchParams.put("group."+groupCnt+"_group.4_fulltext.relPath", "jcr:content/@jcr:description");
		}
		
		searchParams.put("p.guesstotal", "false");
		
		if(doPagination){
			searchParams.put("p.offset", returnOffset);
			searchParams.put("p.limit", returnLimit);			
		}else{
			searchParams.put("p.limit", "-1");
		}
		
		LOG.debug("before cretae query************"+ searchParams.toString());
		Query query = queryBuilder.createQuery(PredicateGroup.create(searchParams),resourceResolver.adaptTo(Session.class));
		SearchResult results = query.getResult();
		return results;
	}
	
	
	
}
