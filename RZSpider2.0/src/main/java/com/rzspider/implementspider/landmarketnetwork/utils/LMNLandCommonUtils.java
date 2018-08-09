package com.rzspider.implementspider.landmarketnetwork.utils;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.rzspider.common.utils.spring.SpringUtils;
import com.rzspider.implementspider.landmarketnetwork.domain.LMNLandMessageDetail;
import com.rzspider.implementspider.landmarketnetwork.domain.LMNLandParams;
import com.rzspider.project.common.spiderdata.domain.Spiderdata;
import com.rzspider.project.common.spiderdata.service.ISpiderdataService;
import com.rzspider.project.common.spiderdata.service.SpiderdataServiceImpl;

public class LMNLandCommonUtils {

	// 对象转json
	public static void turnObjectToJsonString(List<LMNLandMessageDetail> lMNLandMessageDetailList,
			List<String> jsonDataList) throws JsonProcessingException {
		if (lMNLandMessageDetailList != null && lMNLandMessageDetailList.size() > 1) {
			// jackson核心处理类
			ObjectMapper mapper = new ObjectMapper();
			for (LMNLandMessageDetail smnmd : lMNLandMessageDetailList) {
				// LMNLandMessageDetail类转JSON,加入集合
				jsonDataList.add(mapper.writeValueAsString(smnmd));
			}
		}

	}

	// 插入数据
	public void insertDataToDB(Integer taskInfoId, List<String> jsonDataList, int flag) {
		//实例化非常重要，线程里无法直接使用注解
		ISpiderdataService spiderDataService = (ISpiderdataService) SpringUtils.getBean(ISpiderdataService.class);
		Spiderdata sd = new Spiderdata();
		if (jsonDataList != null && jsonDataList.size() > 1) {
			// 爬虫任务详情id
			sd.setTaskInfoId(taskInfoId);
			// 标志
			sd.setTaskFlag(flag);
			for (String jsonData : jsonDataList) {
				// 主要数据
				sd.setJsonData(jsonData);
				spiderDataService.saveData(sd);
			}
		}
	}
}
