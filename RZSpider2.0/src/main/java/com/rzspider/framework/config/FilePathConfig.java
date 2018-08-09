package com.rzspider.framework.config;

import java.io.File;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 读取文件路径相关配置
 * 
 * @author rico
 */
@Component
@ConfigurationProperties(prefix = "filepath")
public class FilePathConfig {
	/** 上传文件所在地 */
	private static String uploadPath;
	/** 上传缓存文件所在地 */
	private static String uploadCachePath;
	// 通用工具所在目录
	private static String uploadToolPath;
	// 通用游戏所在目录
	private static String uploadGamePath;
	/** 自定义爬虫所在地 */
	private static String customSpiderPath;
	// java编译器目录
	private static String javaCompilerPath;
	// jre目录
	private static String jreRunPath;
	// nodejs目录
	private static String nodeJSRunPath;
	// python目录
	private static String pythonRunPath;
	
	public static String getUploadCachePath() {
		return uploadCachePath;
	}

	public static void setUploadCachePath(String uploadCachePath) {
		FilePathConfig.uploadCachePath = uploadCachePath;
	}

	public static String getNodeJSRunPath() {
		return nodeJSRunPath;
	}

	public static void setNodeJSRunPath(String nodeJSRunPath) {
		FilePathConfig.nodeJSRunPath = nodeJSRunPath;
	}

	public static String getPythonRunPath() {
		return pythonRunPath;
	}

	public static void setPythonRunPath(String pythonRunPath) {
		FilePathConfig.pythonRunPath = pythonRunPath;
	}

	public static String getUploadGamePath() {
		return uploadGamePath;
	}

	public static void setUploadGamePath(String uploadGamePath) {
		FilePathConfig.uploadGamePath = uploadGamePath;
	}

	public static String getUploadToolPath() {
		return uploadToolPath;
	}

	public static void setUploadToolPath(String uploadToolPath) {
		FilePathConfig.uploadToolPath = uploadToolPath;
	}

	public static String getJreRunPath() {
		return jreRunPath;
	}

	public static void setJreRunPath(String jreRunPath) {
		FilePathConfig.jreRunPath = jreRunPath;
	}

	public static String getJavaCompilerPath() {
		return javaCompilerPath;
	}

	public static void setJavaCompilerPath(String javaCompilerPath) {
		FilePathConfig.javaCompilerPath = javaCompilerPath;
	}

	public static String getUploadPath() {
		return uploadPath;
	}

	public static String getCustomSpiderPath() {
		return customSpiderPath;
	}

	public static void setCustomSpiderPath(String customSpiderPath) {
		FilePathConfig.customSpiderPath = customSpiderPath;
	}

	public static void setUploadPath(String uploadPath) {
		FilePathConfig.uploadPath = uploadPath;
	}

}
