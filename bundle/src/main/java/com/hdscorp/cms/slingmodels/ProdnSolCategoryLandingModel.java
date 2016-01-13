package com.hdscorp.cms.slingmodels;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Optional;

import com.day.cq.wcm.api.Page;

@Model(adaptables = {SlingHttpServletRequest.class,  Resource.class})
public class ProdnSolCategoryLandingModel {

	@Inject
	private Page resourcePage;
	
	
	@Inject
	@Named("jcr:title")
	@Optional
	private String title;

	@Inject
	@Default(values = "H1")
	private String type;

	@Inject
	@Default(values = "No")
	private String underlinetitle;
	
	private String underLineClass = "";

	public String getTitle() {
		//SlingModelHelperService slingModelHelperService = (SlingModelHelperService)ViewHelperUtil.getService(com.hdscorp.cms.service.SlingModelHelperService.class);
		//System.out.println("------------------"+slingModelHelperService);
		return title;
	}

	public String getType() {
		return type;
	}

	public String getUnderLineClass() {
		if(underlinetitle.equalsIgnoreCase("Yes")){
			underLineClass= "titleunderline";
		}else{
			underLineClass= " ";
		}
		return underLineClass;
	}

}
