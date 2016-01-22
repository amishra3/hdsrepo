package com.hdscorp.cms.restservice;

import com.hdscorp.cms.constants.ServiceConstants;
import com.hdscorp.cms.util.ServiceUtil;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import twitter4j.MediaEntity;
import twitter4j.Paging;
import twitter4j.ResponseList;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;

/**
 * This service is basically used for get all feed data from Twitter
 * 
 * @author venkataramana
 */
@Component(immediate = true)
@Service(value = TwitterWebService.class)
public class TwitterWebService extends GenericRestfulServiceInvokers {
	static final Logger log = LoggerFactory.getLogger(TwitterWebService.class);

	/**
	 * creates the Twitter instance using TwitterFactory
	 *
	 * @return {@link twitter instance}
	 */
	public Twitter getTwitterInstance() {
		log.info("[TwitterService]:getTwitterInstance method  Starting.");
		Twitter twitter = new TwitterFactory().getInstance();

		return twitter;
	}

	/**
	 * retrieves the twitter Response
	 * 
	 * @param consumerkey
	 * @param consumerSecret
	 * @param accessTokenKey
	 * @param accessTokenSecret
	 * @param postsLimit
	 * @return {@link string}
	 */
	public String getTwitterResponse(String consumerkey, String consumerSecret, String accessTokenKey,
			String accessTokenSecret, String postsLimit) {
		log.info("[TwitterService]:getTwitterResponse method  Starting.");
		Twitter twitter = getTwitterInstance();
		ResponseList<Status> twitterResponse = null;
		if (twitter != null) {
			twitter.setOAuthConsumer(consumerkey, consumerSecret);
			twitter.setOAuthAccessToken(new AccessToken(accessTokenKey, accessTokenSecret));

			try {

				twitterResponse = twitter.getUserTimeline(new Paging(1, Integer.parseInt(postsLimit)));
				log.info("twitter feed respones"+twitterResponse);
				return getTwitterFeedData(twitterResponse);
				
				
			} catch (Exception e) {
				log.error("[TwitterService]:getTwitterResponse  ", e.getMessage());				
			}
		}

		return null;
	}

	/**
	 * changing Twitter response to json response format
	 * 
	 * @param responseList
	 * @return {@link String}
	 */
	public String getTwitterFeedData(ResponseList<Status> responseList) {
		log.info("[TwitterService]:getTwitterFeedData method  Starting.");
		JSONArray feedList = new JSONArray();
		try {
			if (responseList != null && responseList.size() > 0) {
				for (Status status : responseList) {
					JSONObject twitterFeed = new JSONObject();
					twitterFeed.put(ServiceConstants.TWITTER_ID, status.getId());
					twitterFeed.put(ServiceConstants.TWITTER_POSTED_DATE,
							status.getCreatedAt());
					twitterFeed.put(ServiceConstants.TIME_DIFF_POSTDATE_CURRENTDATE,
							ServiceUtil.getFeedTimeDifference(status.getCreatedAt().toString()));
					twitterFeed.put(ServiceConstants.TWITTER_MESSAGE_TEXT, status.getText());
					MediaEntity[] media = status.getMediaEntities();
					for (MediaEntity mediaEntity : media) {
						twitterFeed.put(ServiceConstants.TWITTER_MEDIA_URL, mediaEntity.getMediaURL());

					}
					feedList.put(twitterFeed);

				}
			}

		} catch (Exception e) {
			log.error("[TwitterService]:getTwitterFeedData  ", e.getMessage());			
		}

		return feedList.toString();
	}

}