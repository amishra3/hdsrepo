/*
\ * ReplicatorProvider.java
 * 
 * Created on 02/06/2013 *
 * Copyright 2013, PANERA;  All Rights Reserved. *
 * This software is the confidential and proprietary information of
 * PANERA, ("Confidential Information"). You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with PANERA.
 * 
 */
package com.hdscorp.cms.util;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.replication.ReplicationActionType;
import com.day.cq.replication.ReplicationException;
import com.day.cq.replication.Replicator;
/**
 * Singleton
 * {@link ReplicatorProvider} Getting Replicator Service to activate/deactivate content paths 
 * @author skattu
 *
 */
public class ReplicatorProvider {
	
	private static final Logger LOG = LoggerFactory.getLogger(ReplicatorProvider.class);
	private static ReplicatorProvider SHARED_INSTANCE;
	private Replicator replicator;

	/** 
	 * Private constructor
	 */
	private ReplicatorProvider() {
		
	}
	/**
	 * return singleton instance of object
	 * @return
	 */
	public static ReplicatorProvider getInstance() {
		if(null == SHARED_INSTANCE) {
			synchronized (ReplicatorProvider.class) {
				if(null == SHARED_INSTANCE) {
                    SHARED_INSTANCE = new ReplicatorProvider();
				}
			}
		}
		return SHARED_INSTANCE;
	}
	public Replicator getReplicator() throws Exception {
		return this.replicator;
	}
	public void setReplicator(final Replicator replicator) {
        LOG.info("ReplicatorProvider::Setting Replicator for this invocation to " + replicator);
		this.replicator=replicator;
	}
	
	/**
	 * Used to activate the given path
	 * @param pagePath
	 */
	public void activatePage(final String pagePath){
        LOG.info("In ReplicatorProvider :: activatePage");
		try{
			if(null != this.replicator){
				if(StringUtils.isNotEmpty(pagePath)){
                    this.replicator.replicate(JcrUtilService.getSession(), ReplicationActionType.ACTIVATE, pagePath);
                    //LOG.info("Page Activated successfully :" + pagePath);
				}
			}
		} catch (ReplicationException e) {
            LOG.error("Replication exception: ", e);
        } catch (Exception e) {
            LOG.error("Error while activating page ::-", pagePath);
		}finally{
			JcrUtilService.logout();
		}
	}
	/**
	 * Used to deactivate the page
	 * @param pagePath
	 */
	public void deActivatePage(final String pagePath){
        LOG.info("In ReplicatorProvider :: deActivatePage");
		try{
			if(null != this.replicator){
				if(StringUtils.isNotEmpty(pagePath)){
                    this.replicator.replicate(JcrUtilService.getSession(), ReplicationActionType.DEACTIVATE, pagePath);
                    //LOG.info("Page Deactivated successfully :" + pagePath);
				}
			}
		} catch (ReplicationException e) {
            LOG.error("Replication exception: ", e);
        } catch (Exception e) {
            LOG.error("Error while deactivate page ::-", pagePath);
		}
	}

}
