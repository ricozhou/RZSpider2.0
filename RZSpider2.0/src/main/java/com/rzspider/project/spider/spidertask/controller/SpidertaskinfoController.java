package com.rzspider.project.spider.spidertask.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rzspider.project.common.file.utilt.FileUtils;
import com.rzspider.project.common.spiderdata.domain.Spiderdata;
import com.rzspider.project.common.spiderdata.service.ISpiderdataService;
import com.rzspider.project.commontool.toolmanage.domain.Toolmanage;
import com.rzspider.project.spider.spidermanage.domain.SpiderList;
import com.rzspider.project.spider.spidermanage.domain.SpiderManage;
import com.rzspider.project.spider.spidermanage.service.ISpiderListService;
import com.rzspider.project.spider.spidermanage.service.ISpiderManageService;
import com.rzspider.project.spider.spidertask.domain.Spidertask;
import com.rzspider.project.spider.spidertask.domain.Spidertaskinfo;
import com.rzspider.project.spider.spidertask.mainwork.domain.StartSpiderInfo;
import com.rzspider.project.spider.spidertask.service.ISpidertaskService;
import com.rzspider.project.spider.spidertask.service.ISpidertaskinfoService;
import com.rzspider.project.spider.spidertask.utils.SpidertaskUtils;
import com.rzspider.common.constant.CommonSymbolicConstant;
import com.rzspider.common.constant.FileExtensionConstant;
import com.rzspider.common.constant.FileMessageConstant;
import com.rzspider.common.constant.project.SpiderConstant;
import com.rzspider.common.constant.project.SpiderMessageConstant;
import com.rzspider.common.utils.DateUtils;
import com.rzspider.common.utils.StringUtils;
import com.rzspider.common.utils.security.ShiroUtils;
import com.rzspider.framework.web.controller.BaseController;
import com.rzspider.framework.web.page.TableDataInfo;
import com.rzspider.framework.web.domain.Message;

/**
 * 爬虫任务运行记录详情 信息操作处理
 * 
 * @author ricozhou
 * @date 2018-06-05
 */
@Controller
@RequestMapping("/spider/spidertask/spidertaskinfo")
public class SpidertaskinfoController extends BaseController {
	private String prefix = "spider/spidertask/spidertaskinfo";

	@Autowired
	private ISpidertaskinfoService spidertaskinfoService;
	@Autowired
	private ISpidertaskService spidertaskService;
	@Autowired
	private ISpiderListService spiderListService;
	@Autowired
	private ISpiderdataService spiderdataService;
	@Autowired
	private ISpiderManageService spiderManageService;

	/**
	 * 查询爬虫任务运行记录详情列表
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:list")
	@GetMapping("/list")
	@ResponseBody
	public TableDataInfo list(Spidertaskinfo spidertaskinfo) {
		startPage();
		List<Spidertaskinfo> list = spidertaskinfoService.selectSpidertaskinfoList(spidertaskinfo);
		return getDataTable(list);
	}

	/**
	 * 删除爬虫任务运行记录详情
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:remove")
	@PostMapping("/remove/{taskInfoId}")
	@ResponseBody
	public Message remove(@PathVariable("taskInfoId") Integer taskInfoId) {
		// 判断是否在运行，运行则不能删除0是运行中，1是中止中，2是失效
		int status = spidertaskinfoService.checkSpidertaskinfoStatus(taskInfoId);
		if (status == 0) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_RUNNING_TO_STOP);
		} else if (status == -1) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_NO_EXIST);
		}

		if (spidertaskinfoService.deleteSpidertaskinfoById(taskInfoId) > 0) {
			return Message.success();
		}
		return Message.error();
	}

	/**
	 * 批量删除爬虫任务运行记录详情
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:batchRemove")
	@PostMapping("/batchRemove")
	@ResponseBody
	public Message remove(@RequestParam("ids[]") Integer[] taskInfoIds) {
		// 遍历查询是否存在正在运行的任务
		for (int i = 0; i < taskInfoIds.length; i++) {
			int status = spidertaskinfoService.checkSpidertaskinfoStatus(taskInfoIds[i]);
			if (status == 0) {
				return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_RUNNING_TO_STOP);
			} else if (status == -1) {
				return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_NO_EXIST);
			}
		}

		int rows = spidertaskinfoService.batchDeleteSpidertaskinfo(taskInfoIds);
		if (rows > 0) {
			return Message.success();
		}
		return Message.error();
	}

	/**
	 * 爬虫任务参数详情
	 */
	@GetMapping("/params/{taskInfoId}")
	public String params(@PathVariable("taskInfoId") Integer taskInfoId, Model model) {
		Spidertaskinfo spidertaskinfo = spidertaskinfoService.selectSpidertaskinfoById(taskInfoId);
		String taskParams = CommonSymbolicConstant.EMPTY_STRING;
		if (spidertaskinfo == null) {
			taskParams = SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_NO_EXIST;
		} else {
			taskParams = SpidertaskUtils.formatJson(StringUtils.getNotNullString(spidertaskinfo.getTaskParams()));
		}
		model.addAttribute("taskParams", taskParams);
		return prefix + "/params";
	}

	/**
	 * 爬虫任务详情任务启动
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:start")
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/start")
	@ResponseBody
	public Message start(Spidertaskinfo spidertaskinfo) {
		// 判断任务还是否存在
		Spidertaskinfo spidertaskinfo2 = spidertaskinfoService.selectSpidertaskinfoById(spidertaskinfo.getTaskInfoId());
		if (spidertaskinfo2 == null) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_NO_EXIST);
		}
		// 根据taskid查询后台id
		Spidertask spidertask = spidertaskService.selectSpidertaskById(spidertaskinfo2.getTaskId());

		// 从爬虫管理判断爬虫是否存在且是否可用
		if (spidertask == null) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDER_NO_EXIST);
		}
		// 从爬虫总目录判断爬虫是否存在且是否可用
		SpiderList spiderList = spiderListService.selectSpiderListBySpiderBackId(spidertask.getSpiderBackId());

		if (spiderList == null) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDER_NO_EXIST);
		}
		// 开始启动任务
		StartSpiderInfo startSpiderInfo = new StartSpiderInfo();
		// 后台id
		startSpiderInfo.setSpiderBackId(spiderList.getSpiderBackId());
		// 内置的还是自定义
		startSpiderInfo.setCreateType(spiderList.getCreateType());
		// 语言类型
		startSpiderInfo.setSpiderLanguageType(spiderList.getCustomSpiderType());
		// 详细参数
		startSpiderInfo.setSpiderParams(spidertaskinfo2.getTaskParams());
		startSpiderInfo.setTaskInfoId(spidertaskinfo2.getTaskInfoId());
		if ((spidertaskinfo2.getTaskStatus() == 1) && spidertaskinfoService.start(startSpiderInfo)
				&& (spidertaskinfoService.chanageSpidertaskinfoTaskStatus(spidertaskinfo2) > 0)) {
			return Message.success();
		}
		return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_START_FAILED);
	}

	/**
	 * 爬虫任务详情任务中止
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:stop")
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/stop")
	@ResponseBody
	public Message stop(Spidertaskinfo spidertaskinfo) {
		// 判断任务还是否存在
		Spidertaskinfo spidertaskinfo2 = spidertaskinfoService.selectSpidertaskinfoById(spidertaskinfo.getTaskInfoId());
		if (spidertaskinfo2 == null) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_NO_EXIST);
		}
		// 根据taskid查询后台id
		Spidertask spidertask = spidertaskService.selectSpidertaskById(spidertaskinfo2.getTaskId());

		// 从爬虫管理判断爬虫是否存在且是否可用
		if (spidertask == null) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDER_NO_EXIST);
		}
		// 从爬虫总目录判断爬虫是否存在且是否可用
		SpiderList spiderList = spiderListService.selectSpiderListBySpiderBackId(spidertask.getSpiderBackId());

		if (spiderList == null) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDER_NO_EXIST);
		}
		// 开始中止任务
		StartSpiderInfo startSpiderInfo = new StartSpiderInfo();
		// 后台id
		startSpiderInfo.setSpiderBackId(spiderList.getSpiderBackId());
		// 内置的还是自定义
		startSpiderInfo.setCreateType(spiderList.getCreateType());
		// 语言类型
		startSpiderInfo.setSpiderLanguageType(spiderList.getCustomSpiderType());
		// 详细参数
		startSpiderInfo.setSpiderParams(spidertaskinfo2.getTaskParams());
		startSpiderInfo.setTaskInfoId(spidertaskinfo2.getTaskInfoId());
		// 完成状态是部分完成
		spidertaskinfo2.setFinishStatus(1);
		if ((spidertaskinfo2.getTaskStatus() == 0) && spidertaskinfoService.stop(startSpiderInfo)) {
			// stop等方法中包含了操作数据库，不再需要操作数据库
			if(startSpiderInfo.getCreateType()==0){
				//内置的还得更新数据库
				spidertaskinfoService.chanageSpidertaskinfoTaskStatus2(spidertaskinfo2);
			}
			return Message.success();
		}
		return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_STOP_FAILED);
	}

	/**
	 * 批量启动
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:start")
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/batchStart")
	@ResponseBody
	public Message batchStart(@RequestParam("ids[]") Integer[] taskInfoIds) {
		// 遍历查询是否存在正在运行的任务
		for (Integer taskInfoId : taskInfoIds) {
			// 以下判断亦可调用单独启动的验证方法

			// 判断任务还是否存在
			Spidertaskinfo spidertaskinfo2 = spidertaskinfoService.selectSpidertaskinfoById(taskInfoId);
			// 先从总爬虫里查询
			SpiderManage spiderManage2 = spiderManageService.checkSpiderExist3(spidertaskinfo2.getTaskId());
			if (spiderManage2 == null || spiderManage2.getStatus() != 0) {
				continue;
			}
			// 再从爬虫管理中查询
			SpiderManage spiderManage = spiderManageService.checkSpiderExist2(spidertaskinfo2.getTaskId(),
					ShiroUtils.getLoginName());
			if (spiderManage == null || spiderManage.getStatus() != 0) {
				continue;
			}
			SpiderList spiderList = spiderListService
					.selectSpiderListBySpiderBackId(spiderManage.getSpiderBackId().intValue());

			// 开始启动任务
			StartSpiderInfo startSpiderInfo = new StartSpiderInfo();
			// 后台id
			startSpiderInfo.setSpiderBackId(spiderList.getSpiderBackId());
			// 内置的还是自定义
			startSpiderInfo.setCreateType(spiderList.getCreateType());
			// 语言类型
			startSpiderInfo.setSpiderLanguageType(spiderList.getCustomSpiderType());
			// 详细参数
			startSpiderInfo.setSpiderParams(spidertaskinfo2.getTaskParams());
			startSpiderInfo.setTaskInfoId(spidertaskinfo2.getTaskInfoId());
			if (!spidertaskinfoService.start(startSpiderInfo)
					|| (spidertaskinfoService.chanageSpidertaskinfoTaskStatus(spidertaskinfo2) < 1)) {
				continue;
			}

		}
		return Message.success(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_START_FINISHED);

	}

	/**
	 * 批量中止
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:stop")
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/batchStop")
	@ResponseBody
	public Message batchStop(@RequestParam("ids[]") Integer[] taskInfoIds) {
		// 遍历查询是否存在正在运行的任务
		for (Integer taskInfoId : taskInfoIds) {
			// 判断任务还是否存在
			Spidertaskinfo spidertaskinfo2 = spidertaskinfoService.selectSpidertaskinfoById(taskInfoId);
			if (spidertaskinfo2 == null) {
				continue;
			}
			if (spidertaskinfo2.getTaskStatus() != 0) {
				continue;
			}
			// 根据taskid查询后台id
			Spidertask spidertask = spidertaskService.selectSpidertaskById(spidertaskinfo2.getTaskId());

			// 从爬虫管理判断爬虫是否存在且是否可用
			if (spidertask == null) {
				continue;
			}
			// 从爬虫总目录判断爬虫是否存在且是否可用
			SpiderList spiderList = spiderListService.selectSpiderListBySpiderBackId(spidertask.getSpiderBackId());

			if (spiderList == null) {
				continue;
			}
			// 开始启动任务
			StartSpiderInfo startSpiderInfo = new StartSpiderInfo();
			// 后台id
			startSpiderInfo.setSpiderBackId(spiderList.getSpiderBackId());
			// 内置的还是自定义
			startSpiderInfo.setCreateType(spiderList.getCreateType());
			// 语言类型
			startSpiderInfo.setSpiderLanguageType(spiderList.getCustomSpiderType());
			// 详细参数
			startSpiderInfo.setSpiderParams(spidertaskinfo2.getTaskParams());
			startSpiderInfo.setTaskInfoId(spidertaskinfo2.getTaskInfoId());
			if (!spidertaskinfoService.stop(startSpiderInfo)
					|| (spidertaskinfoService.chanageSpidertaskinfoTaskStatus2(spidertaskinfo2) < 1)) {
				continue;
			}

		}
		return Message.success(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_STOP_FINISHED);

	}

	/**
	 * 校验爬虫数据是否存在
	 */
	@PostMapping("/checkData")
	@ResponseBody
	public Message checkData(@RequestParam("taskInfoId") Integer taskInfoId,
			@RequestParam("taskFlag") Integer taskFlag) {
		// 判断任务还是否存在
		Spidertaskinfo spidertaskinfo2 = spidertaskinfoService.selectSpidertaskinfoById(taskInfoId);
		if (spidertaskinfo2 == null) {
			return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_NO_EXIST);
		}
		// 不再进行其他判断，只要任务存在就可以下载
		// 再判断spider_data中是否有数据
		Spiderdata spiderdata = new Spiderdata();
		spiderdata.setTaskInfoId(spidertaskinfo2.getTaskInfoId());
		// 1表示正常数据，2是全部数据
		spiderdata.setTaskFlag(taskFlag);
		List<Spiderdata> list = spiderdataService.selectDataListByTaskInfoIdAndFlag(spiderdata);
		if (list != null && list.size() > 0) {
			return Message.success();
		}
		return Message.error(SpiderMessageConstant.SPIDER_MESSAGE_SPIDERTASK_NO_DATA);
	}

	/**
	 * 下载数据
	 */
	@RequiresPermissions("spider:spidertask:spidertaskinfo:downloadData")
	@GetMapping("/downloadData/{taskInfoId}/{taskFlag}")
	public void downloadData(HttpServletResponse response, @PathVariable("taskInfoId") Integer taskInfoId,
			@PathVariable("taskFlag") Integer taskFlag) throws IOException {
		response.reset();
		Spidertaskinfo spidertaskinfo2 = spidertaskinfoService.selectSpidertaskinfoById(taskInfoId);
		Spiderdata spiderdata = new Spiderdata();
		spiderdata.setTaskInfoId(taskInfoId);
		// 1表示正常数据,2是全部数据
		spiderdata.setTaskFlag(taskFlag);
		// 读取数据
		// 注意数据量太大的时候需另行处理
		// 更改数据库字段类型为json
		List<Spiderdata> list = spiderdataService.selectDataListByTaskInfoIdAndFlag(spiderdata);
		if (list == null || list.size() < 1) {
			return;
		}
		byte[] data = spiderdataService.getSpiderDataToByte(list, spidertaskinfo2.getTaskId());
		if (data == null) {
			return;
		}
		// 文件名：爬虫名称加任务名称加任务详情id加时间戳
		String filename = spidertaskinfo2.getSpiderName() + CommonSymbolicConstant.UNDERLINE
				+ spidertaskinfo2.getTaskName() + CommonSymbolicConstant.UNDERLINE + spidertaskinfo2.getTaskInfoId()
				+ CommonSymbolicConstant.UNDERLINE + DateUtils.format(new Date(), DateUtils.YYYYMMDDHHMMSS)
				+ FileExtensionConstant.FILE_EXTENSION_POINT_EXCEL_XLSX;
		// 处理中文乱码
		try {
			filename = FileUtils.getNewString(filename);
		} catch (Exception e) {
			e.printStackTrace();
			filename = SpiderConstant.SPIDER_KEYWORD_SPIDERDATA_FILE_PREFIX
					+ DateUtils.format(new Date(), DateUtils.YYYYMMDDHHMMSS)
					+ FileExtensionConstant.FILE_EXTENSION_POINT_EXCEL_XLSX;
		}

		response.setHeader(FileMessageConstant.FILE_CONTENT_DISPOSITION,
				FileMessageConstant.FILE_ATTACHMENT_FILENAME + filename);
		response.addHeader(FileMessageConstant.FILE_CONTENT_LENGTH, CommonSymbolicConstant.EMPTY_STRING + data.length);
		response.setContentType(FileMessageConstant.FILE_CONTENT_TYPE);

		IOUtils.write(data, response.getOutputStream());
		response.getOutputStream().close();
	}
}
