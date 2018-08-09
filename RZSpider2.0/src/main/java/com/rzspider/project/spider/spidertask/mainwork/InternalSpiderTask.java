package com.rzspider.project.spider.spidertask.mainwork;

import java.io.IOException;
import java.net.MalformedURLException;

import org.springframework.stereotype.Component;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.rzspider.common.utils.spring.SpringUtils;
import com.rzspider.implementspider.landmarketnetwork.controller.LMNSpiderTaskController;
import com.rzspider.project.common.spiderdata.domain.Spiderdata;
import com.rzspider.project.common.spiderdata.service.ISpiderdataService;
import com.rzspider.project.spider.spidertask.domain.Spidertaskinfo;
import com.rzspider.project.spider.spidertask.mainwork.domain.StartSpiderInfo;
import com.rzspider.project.spider.spidertask.mainwork.utils.InternalSpiderDataUtils;
import com.rzspider.project.spider.spidertask.mainwork.utils.SpiderTaskThreadUtils;
import com.rzspider.project.spider.spidertask.service.ISpidertaskinfoService;
import com.rzspider.project.spider.spidertask.utils.SpiderScheduleJob;
import com.rzspider.implementspider.landmarketnetwork.domain.LMNLandParams;

/**
 * 定时任务调度
 * 
 * @author ricozhou
 */
@Component("internalSpiderTask")
public class InternalSpiderTask {

	// 内置爬虫控制器
	public void startInternalSpider_10002(StartSpiderInfo startSpiderInfo)
			throws FailingHttpStatusCodeException, MalformedURLException, IOException {
		System.out.println(startSpiderInfo);
		// 解析出json变object参数
		LMNLandParams lMNLandParams = new LMNLandParams();
		lMNLandParams = (LMNLandParams) InternalSpiderDataUtils.jsonStringToObject(startSpiderInfo.getSpiderParams(),
				lMNLandParams);

		// 传入二个参数，一个是爬虫具体参数，一个是任务详情id以供插入数据库
		// 正式执行任务
		new LMNSpiderTaskController().LMNSpiderTaskController(lMNLandParams, startSpiderInfo.getTaskInfoId());

	}

}
