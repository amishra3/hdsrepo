package com.hdscorp.cms.config;

import java.util.Dictionary;
import java.util.Timer;

import org.apache.felix.scr.annotations.Activate;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Deactivate;
import org.apache.felix.scr.annotations.Modified;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.PropertyUnbounded;
import org.apache.felix.scr.annotations.Service;
import org.osgi.framework.Constants;
import org.osgi.service.component.ComponentContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hdscorp.cms.constants.GlobalConstants;
import com.hdscorp.cms.util.CacheInvalidator;


@Component(immediate = true, label = "HDS CORP Global Configuration", description = "HDS CORP Global Configuration", metatype = true)
@Properties({
		@Property(name = Constants.SERVICE_DESCRIPTION, value = "HDSGlobalConfig"),
		@Property(name = Constants.SERVICE_VENDOR, value = "panera") })
@Service(HdsCorpGlobalConfiguration.class)

public class HdsCorpGlobalConfiguration {

	private static final Logger LOG = LoggerFactory
			.getLogger(HdsCorpGlobalConfiguration.class);

	@Property(label = "Delivery Area MSA Codes", value = "1122", unbounded = PropertyUnbounded.ARRAY, description = "Delivery Area MSA Codes")
	public static final String CUSTOMER_DELIVERY_AREA_MSA_CODES = "panera.delivery.area.msa.codes";

	@Property(label = "Locations Update Interval", intValue =150, description = "Panera Store Locations Update Interval (Days)")
	public static final String PANERA_STORE_LOCATIONS_UPDATE_INTERVAL = "panera.store.locations.update.interval";

	@Property(label = "Webservers", value = "", unbounded = PropertyUnbounded.ARRAY, description = "Add Webserver( Fully Qualified Address starts with http or https")
	public static final String WEBSERVERS = "panera.web.servers.address";

	@Property(label = "Dispatcher Invalidate URI", value = "/dispatcher/invalidate.cache", description = "Dispatcher Invalidate URI")
	public static final String DISPACHER_URI = "panera.dispatcher.uri";

	@Property(label = "Error Page Path", value = "/content/panerabread/en_us/error-page", description = "Error Page Path")
	public static final String PANERA_ERROR_PATH = "panera.error.path";

	@Property(label = "Structured Content Root Path", value = "/content/panerabread/en_us/structureddata", description = "Structured Content Root Path")
	public static final String STRUCTURED_CONTENT_ROOT_PATH = "panera.structured.content.root.path";

	@Property(label = "FAQ Admin Root Page Path", value = "/content/panerabread/en_us/structureddata/faqadmin", description = "FAQ Admin Root Page Path")
	public static final String FAQ_ADMIN_PAGEPATH = "panera.faq.admin.pagepath";

	@Property(label = "FAQ's Tags Root Path", value = "/etc/tags/panerabread/faqs", description = "FAQ's Tags Root Path")
	public static final String FAQ_TAGS_ROOT_PATH = "panera.faq.tags.rootpath";

	@Property(label = "Article Detail Images DAM Path", value = "/content/dam/panerabread/article/articledetails", description = "150:150 size image Renditions will be generated in this path")
	public static final String ARTICLE_DETAILS_IMAGES_DAM_PATH = "articledetaildampath";

	@Property(label = "Synonym words File Location", value = "/apps/cq/search/content/suggest/synonyms/synonyms.txt", description = "File Location for search related synonyms words")
	public static final String SYNONYMS_FILE_LOCATION = "synonymfilelocation";

	@Property(label = "Stop words File Location", value = "/apps/cq/search/content/suggest/stopwords/en.txt", description = "File Location for search related stop words")
	public static final String STOPWORDS_FILE_LOCATION = "stopwordsfilelocation";
	
	@Property(label = "Facebook App ID", value = "172495462931268", description = "Face Book Application ID")
	public static final String FACE_BOOK_APP_ID = "fbAppId";
	
	@Property(label = "Google Analytics UA-AccountID", value = "UA-12177097-3", description = "UA-AccountID for Google Analytics")
	public static final String GA_ACCOUNTID = "gaaccountid";
	
	@Property(label = "Show Nutrition Table In Menu Item Pages", boolValue = false, description = "Select the checkbox to show nutrition table in Menu Item Detail Pages")
	public static final String SHOW_NUTRITION_TABLE = "showNutritionTable";

	@Property(label = "Punch Tab Key", value = "c31b538e86fc1f57f39951ae6570dd16", description = "Punch Tab Key")
	public static final String PUNCH_TAB_KEY = "punchTabKey";

	@Property(label = "PunchTab Client ID", value = "1279878208", description = "PunchTab Client ID")
	public static final String PUNCH_TAB_CLIENT_ID = "punchTabClientId";
	
	@Property(label = "PunchTab Secret Key", value = "b285141fc106330e52e793cac8f48a11", description = "PunchTab Secret Key")
	public static final String PUNCH_TAB_SECRET_KEY = "punchTabSecretKey";
	
	@Property(label = "PunchTab Publisher ID", value = "52620", description = "PunchTab Publisher ID")
	public static final String PUNCH_TAB_PUBLISHER_ID = "punchTabPublisherId";
	
	@Property(label = "PunchTab Mobile Page URL", value = "https://www.panerabread.com/en-us/challenge/m.html", description = "PunchTab Mobile Page URL")
	public static final String PUNCH_TAB_MOBILE_PAGE_URL = "punchTabMobilePageUrl";
	
	@Property(label = "Click To Load Mobile Page URL", value = "https://www.panerabread.com/en-us/mobile/loadrewards.html", description = "click to load mobile page URL")
	public static final String CLICK_TO_LOAD_MOBILE_URL = "clickToMobileUrl";
	
	@Property(label = "Unsubscribe Mobile Page URL", value = "https://www.panerabread.com/en-us/mobile/unsubscribe.html", description = "Unsubscribe Mobile Page URL")
	public static final String UNSUBSCRIBE_MOBILE_PAGE_URL = "unsubscribeMobileUrl";
	
	@Property(label = "Mobile navigation configuration", value = "/content/panerabread/en_us/structureddata/mobilenav", description = "Path for the mobile navigation configuration page ")
	public static final String MOBILE_NAV_PAGE_URL = "mobilenavconfigpage";
	
	
	@SuppressWarnings("rawtypes")
	private static Dictionary properties = null;

	private Timer storeLocationsUpdateTimer = null;

	@Activate
	protected void activate(ComponentContext componentContext) {
		LOG.info("Panera Global Configuration Service Activated method called");
		try {
			properties = componentContext.getProperties();
			scheduleTimer();
		} catch (Exception e) {
			LOG.error("Panera Global Configuration ::Error occured in activate method");
		}
	}

	@Modified
	protected void modified(ComponentContext context) {
		LOG.info("Panera Global Configuration : configuration updated");
		try {
			properties = context.getProperties();
			// Invalidate Cache for Delivery Zone Information (MSA Codes)
			if (CacheInvalidator.invalidateCache(
					GlobalConstants.DELIVERY_ZONE_INFO_SERVLET, false)) {
				LOG.info("Cache Invalidated successfully for page ::"
						+ GlobalConstants.DELIVERY_ZONE_INFO_SERVLET);
			} else {
				LOG.info("Error while invalidating Cache for requested URL ::"
						+ GlobalConstants.DELIVERY_ZONE_INFO_SERVLET);
			}
			scheduleTimer();
		} catch (Exception e) {
			LOG.error("Error while Updating configuration properties...");
		}
	}

	@Deactivate
	protected void deactivate(ComponentContext context) {
		LOG.info("Panera Global Configuration : deactivating service");
		try {
			if (!properties.isEmpty()) {
				properties = null;
			}
			if (storeLocationsUpdateTimer != null) {
				storeLocationsUpdateTimer.cancel();
				storeLocationsUpdateTimer.purge();
			}
		} catch (Exception e) {
			LOG.error("Error while deactivating service ...");
		}
	}

	/**
	 * Schedule Timer Task for Invalidating Cache
	 */
	private void scheduleTimer() {
		// Schedule Timer for Invalidating Panera locations servlet cache
		long timeInterval = (Integer) properties
				.get(PANERA_STORE_LOCATIONS_UPDATE_INTERVAL);
		LOG.info("Timer ::" + timeInterval);
		// Time Interval=NO OF DAYS * 1 DAY ( Milli Seconds)
		timeInterval = timeInterval * 86400000;
		//storeLocationsUpdateTimer = PaneraStoreLocationsUpdateTimer
			//	.scheduleTimer(timeInterval);
	}

	/**
	 * retrieve the property from the Component properties
	 * 
	 * @param propertyName
	 * @return {@link Object}
	 */
	public static Object getPropertyValue(String propertyName) {
		LOG.info("Panera Global Configuration : getPropertyValue ::"
				+ propertyName);
		try {
			Object object = properties.get(propertyName);
			if (null != object) {
				return object;
			}
		} catch (Exception e) {
			LOG.error("Error while getting property from componenet properties");
		}
		return null;
	}
}
