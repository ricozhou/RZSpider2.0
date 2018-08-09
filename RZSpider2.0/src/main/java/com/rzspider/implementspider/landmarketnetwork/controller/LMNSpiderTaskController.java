package com.rzspider.implementspider.landmarketnetwork.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.rzspider.implementspider.landmarketnetwork.domain.LMNLandMessageDetail;
import com.rzspider.implementspider.landmarketnetwork.domain.LMNLandParams;
import com.rzspider.implementspider.landmarketnetwork.service.LMNSpiderTaskService;
import com.rzspider.implementspider.landmarketnetwork.utils.LMNLandCommonUtils;
import com.rzspider.project.spider.spidermanage.service.ISpiderListService;
import com.rzspider.project.spider.spidertask.mainwork.domain.StartSpiderInfo;

public class LMNSpiderTaskController {
	public LMNSpiderTaskService lMNSpiderTaskService = new LMNSpiderTaskService();
	public LMNLandCommonUtils lmnlcu = new LMNLandCommonUtils();

	// 正式执行任务
	// 只需要两个参数，一个是爬虫参数，一个是id用于插入数据
	public void LMNSpiderTaskController(LMNLandParams lMNLandParams, Integer taskInfoId)
			throws FailingHttpStatusCodeException, MalformedURLException, IOException {
		if (lMNLandParams == null) {
			return;
		}

		// 根据网址选择

		// 记录开始时间
		long startTime = System.currentTimeMillis();
		// 获取条数,页数
		int[] pageNum = new int[2];
		pageNum = lMNSpiderTaskService.getPageAndNum();
		if (pageNum == null) {
			return;
		}
		if (lMNLandParams.getEndPage() > pageNum[1]) {
			lMNLandParams.setEndPage(pageNum[1]);
		}
		if (pageNum[0] == 0) {
			// 没数据则返回
			return;
		}
		int num = lMNLandParams.getEndPage();
		int minNum = lMNLandParams.getStartPage();
		if (minNum < 1) {
			minNum = 1;
		}

		// 获取数据
		try {
			List<LMNLandMessageDetail> lMNLandMessageDetailList;
			List<String> jsonDataList;
			for (int i = minNum - 1; i < num; i++) {
				System.out.println("开始");
				lMNLandMessageDetailList = new ArrayList<LMNLandMessageDetail>();
				// 一页一页返回数据，list集合
				lMNSpiderTaskService.getLMNLandDetail(lMNLandParams, lMNLandMessageDetailList, i);
				// 转换成字符串
				jsonDataList = new ArrayList<String>();
				LMNLandCommonUtils.turnObjectToJsonString(lMNLandMessageDetailList, jsonDataList);
				// 存入数据库for循环一页一页插入
				//先插入完整数据
				lmnlcu.insertDataToDB(taskInfoId, jsonDataList, 2);
				//再插入筛选正常数据
				lmnlcu.insertDataToDB(taskInfoId, jsonDataList, 1);
				//筛选
				
				lMNLandMessageDetailList.clear();
				jsonDataList.clear();
			}
		} catch (Exception e) {
			e.printStackTrace();
			// //筛选List
			// //为防止意外，筛选前先存到缓存
			// jsls.writeExcelFile(jsls.createExcelFile(jsLandList),
			// "cacheFile\\JSLandcacheFile");
			// //筛选
			// jsls.checkJSLandList(jsLandList,jsLandParams);
			// // 创建Excel
			// XSSFWorkbook workbook = jsls.createExcelFile(jsLandList);
			// // 写入Excel
			// JSLandFileMessage jslfm = jsls.writeExcelFile(workbook,
			// jsLandParams.getFilePath());
			// jsLandList.clear();
			// workbook.close();
			// long endTime = System.currentTimeMillis();
			// rjslm.setJslfm(jslfm);
			// rjslm.setYNMessage("出了点小问题！未完全完成！");
			// rjslm.setYNsuccess("否");
			// rjslm.setDate(jslcu.turnHouseDate2(startTime, endTime));
			// return rjslm;
		} finally {
			// 任务标志保存

		}
		// 存入数据

		// 筛选数据再次存入，完成
	}

}
