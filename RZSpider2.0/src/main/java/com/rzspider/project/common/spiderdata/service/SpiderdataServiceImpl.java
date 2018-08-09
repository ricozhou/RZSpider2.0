package com.rzspider.project.common.spiderdata.service;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ReflectionUtils;

import com.rzspider.common.constant.ScheduleConstants;
import com.rzspider.common.utils.StringUtils;
import com.rzspider.common.utils.spring.SpringUtils;
import com.rzspider.project.common.spiderdata.domain.Spiderdata;
import com.rzspider.project.common.spiderdata.mapper.SpiderdataMapper;
import com.rzspider.project.spider.spidertask.domain.Spidertask;
import com.rzspider.project.spider.spidertask.mainwork.domain.StartSpiderInfo;
import com.rzspider.project.spider.spidertask.mainwork.utils.InternalSpiderDataUtils;
import com.rzspider.project.spider.spidertask.service.ISpidertaskService;

/**
 * 爬虫数据详情 服务层实现
 * 
 * @author ricozhou
 * @date 2018-06-11
 */
@Service
public class SpiderdataServiceImpl implements ISpiderdataService {
	@Autowired
	private SpiderdataMapper dataMapper;
	@Autowired
	private ISpidertaskService spidertaskService;

	/**
	 * 查询爬虫数据详情信息
	 * 
	 * @param spiderDataId
	 *            爬虫数据详情ID
	 * @return 爬虫数据详情信息
	 */
	@Override
	public Spiderdata selectDataById(Integer spiderDataId) {
		return dataMapper.selectDataById(spiderDataId);
	}

	/**
	 * 查询爬虫数据详情列表
	 * 
	 * @param data
	 *            爬虫数据详情信息
	 * @return 爬虫数据详情集合
	 */
	@Override
	public List<Spiderdata> selectDataList(Spiderdata data) {
		return dataMapper.selectDataList(data);
	}

	/**
	 * 新增爬虫数据详情
	 * 
	 * @param data
	 *            爬虫数据详情信息
	 * @return 结果
	 */
	@Override
	public int insertData(Spiderdata data) {
		return dataMapper.insertData(data);
	}

	/**
	 * 修改爬虫数据详情
	 * 
	 * @param data
	 *            爬虫数据详情信息
	 * @return 结果
	 */
	@Override
	public int updateData(Spiderdata data) {
		return dataMapper.updateData(data);
	}

	/**
	 * 保存爬虫数据详情
	 * 
	 * @param data
	 *            爬虫数据详情信息
	 * @return 结果
	 */
	@Override
	public int saveData(Spiderdata data) {
		Integer spiderDataId = data.getSpiderdataId();
		int rows = 0;
		if (StringUtils.isNotNull(spiderDataId)) {
			rows = dataMapper.updateData(data);
		} else {
			rows = dataMapper.insertData(data);
		}
		return rows;
	}

	/**
	 * 删除爬虫数据详情信息
	 * 
	 * @param spiderDataId
	 *            爬虫数据详情ID
	 * @return 结果
	 */
	@Override
	public int deleteDataById(Integer spiderDataId) {
		return dataMapper.deleteDataById(spiderDataId);
	}

	/**
	 * 批量删除爬虫数据详情对象
	 * 
	 * @param spiderDataIds
	 *            需要删除的数据ID
	 * @return 结果
	 */
	@Override
	public int batchDeleteData(Integer[] spiderDataIds) {
		return dataMapper.batchDeleteData(spiderDataIds);
	}

	// 提前删除数据
	@Override
	public int deleteDataByTaskinfoId(Spiderdata spiderdata) {
		return dataMapper.deleteDataByTaskinfoId(spiderdata);
	}

	// 取数据
	@Override
	public List<Spiderdata> selectDataListByTaskInfoIdAndFlag(Spiderdata spiderdata) {
		return dataMapper.selectDataListByTaskInfoIdAndFlag(spiderdata);
	}

	// 分析数据，生成表格返回byte
	@Override
	public byte[] getSpiderDataToByte(List<Spiderdata> list, Integer taskId) {
		// 根据类型，反射执行对应的方法然后对应解析出表格并返回
		Spidertask spidertask = spidertaskService.selectSpidertaskById(taskId);
		StartSpiderInfo startSpiderInfo = new StartSpiderInfo();
		// 后台id
		startSpiderInfo.setSpiderBackId(spidertask.getSpiderBackId());
		// 内置的还是自定义
		startSpiderInfo.setCreateType(spidertask.getCreateType());
		// 语言类型
		// startSpiderInfo.setSpiderLanguageType(spidertask.getCustomSpiderType());
		// 详细参数
		startSpiderInfo.setSpiderParams(spidertask.getTaskParams());
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		XSSFWorkbook workbook = null;
		try {
			if (startSpiderInfo.getCreateType() == 0) {
				// 内置,反射对应的方法执行数据解析，因为数据是完全不同的，需要有针对性的方法来解析
				Method method = SpringUtils.getBean(ScheduleConstants.INTERNAL_SPIDER_DATA_BEAN_NAME).getClass()
						.getDeclaredMethod(ScheduleConstants.INTERNAL_SPIDER_DATA_METHOD_NAME + "_"
								+ startSpiderInfo.getSpiderBackId(), StartSpiderInfo.class,List.class);
				ReflectionUtils.makeAccessible(method);
				workbook = (XSSFWorkbook) method.invoke(
						SpringUtils.getBean(ScheduleConstants.INTERNAL_SPIDER_DATA_BEAN_NAME), startSpiderInfo, list);
			} else if (startSpiderInfo.getCreateType() == 1) {
				// 自定义
				Method method = SpringUtils.getBean(ScheduleConstants.CUSTOM_SPIDER_DATA_BEAN_NAME).getClass()
						.getDeclaredMethod(ScheduleConstants.CUSTOM_SPIDER_DATA_METHOD_NAME, StartSpiderInfo.class,List.class);
				ReflectionUtils.makeAccessible(method);
				workbook = (XSSFWorkbook) method.invoke(
						SpringUtils.getBean(ScheduleConstants.CUSTOM_SPIDER_DATA_BEAN_NAME), startSpiderInfo, list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// workbook写入输出流
		if (workbook != null) {
			InternalSpiderDataUtils.writeWBToStream(workbook, outputStream);
		}
		return outputStream.toByteArray();
	}

	//根据flag删除
	@Override
	public void deleteSpiderDataByFlag(Integer flag) {
		dataMapper.deleteSpiderDataByFlag(flag);
	}

}
