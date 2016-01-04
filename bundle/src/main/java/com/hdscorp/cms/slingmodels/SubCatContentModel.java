package com.hdscorp.cms.slingmodels;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.inject.Inject;
import javax.jcr.RepositoryException;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.models.annotations.Model;
import org.osgi.framework.Bundle;
import org.osgi.framework.BundleContext;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.ServiceReference;

import com.day.cq.search.result.Hit;
import com.day.cq.search.result.SearchResult;
import com.day.cq.wcm.api.Page;
import com.hdscorp.cms.dao.ProductNode;
import com.hdscorp.cms.search.SearchServiceHelper;
import com.hdscorp.cms.util.PageUtils;
import com.hdscorp.cms.util.PathResolver;

@Model(adaptables = Resource.class)
public class SubCatContentModel {

	@Inject
	private Page resourcePage;

	@Inject
	private ResourceResolver resourceResolver;	
	
	@Inject
	private String[] subcattags;
	
	private Collection<Hit> products;

	public String[] getSubcattags() {
		
		for (int i = 0; i < subcattags.length; i++) {
			System.out.println("-------------"+subcattags[i].toString());
		}
		
		return subcattags;
	}

	
	public List<ProductNode> getProducts() throws RepositoryException {
		
        Bundle bndl = FrameworkUtil.getBundle(com.hdscorp.cms.search.SearchServiceHelper.class);
        BundleContext bundleContext = bndl.getBundleContext();
        ServiceReference ref = bundleContext.getServiceReference(SearchServiceHelper.class.getName());
        SearchServiceHelper searchServiceHelper = (SearchServiceHelper) bundleContext.getService(ref);
		
		//SearchServiceHelper searchServiceHelper = sling.getService(com.hdscorp.cms.search.SearchServiceHelper.class);
		String paths[] = {"/content/hdscorp/en_us/productsandsolutions"};
		paths = null ;
		String tags[] = subcattags ;
		tags = null;
		String template= "/apps/hdscorp/templates/productdetail";
		//template = null;
		String type = "cq:Page";
		boolean doPagination = false;
		String returnOffset="0";
		String returnLimit="10";
		SearchResult result = searchServiceHelper.getFullTextBasedResuts(paths,null,template,type,null,doPagination,returnOffset,returnLimit,resourceResolver);
		
		List<Hit> hits = result.getHits();
		List<ProductNode> productList = new ArrayList<ProductNode>();
		
		for (Hit hit : hits) {
			ProductNode productNode = new ProductNode();
			Page reourcePage = hit.getResource().adaptTo(Page.class);
		    String pageTitle = reourcePage.getTitle();
		    String pagePath = reourcePage.getPath();
		    String pageDescription = reourcePage.getDescription();
		    String pageProductDescription = (String)reourcePage.getProperties().get("subtext");
		    if(pagePath.startsWith("/content")){
		    	pagePath=PathResolver.getShortURLPath(pagePath);
		    }
		    productNode.setProductTitle(pageTitle);
		    productNode.setProductDescription(pageProductDescription);
		    productNode.setProductPath(pagePath);
		    productList.add(productNode);
		}
		return productList;
	}
}
