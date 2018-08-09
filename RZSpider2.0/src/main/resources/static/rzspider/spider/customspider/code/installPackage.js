var prefix = ctx + "spider/customspider/code";
$("#form-pyjs-installPackage").validate({
	rules : {
		installPackageName : {
			required : true,
			minlength : 1,
			maxlength : 20
		}
	},
	messages : {},
	submitHandler : function(form) {
		installPackageSave();
	}
});

// 绑定监听事件
$(function() {
	$('#installPackageNameChoice').bind('change', function() {
		var installPackageName = $(this).val();
		if (installPackageName == 0) {
			installPackageName = '';
		}
		$("#installPackageName").val(installPackageName);
	});
});

function installPackageSave() {
	var customSpiderId = $("#customSpiderId").val();
	var childId = $("#childId").val();
	// 0是python，1是js
	var flag = $("#flag").val();
	// 库包名
	var installPackageName = $("#installPackageName").val();
	$.ajax({
		cache : true,
		type : "POST",
		url : prefix + "/installPackageSave",
		data : {
			"customSpiderId" : customSpiderId,
			"childId" : childId,
			"fileName" : installPackageName,
			"flag" : flag
		},
		async : true,
		error : function(request) {
			$.modalAlert("系统错误", modal_status.FAIL);
		},
		beforeSend : function() {
			// 禁用按钮防止重复提交
			document.getElementById("installPackageSave").setAttribute(
					"disabled", true);
			layer.msg("正在安装,请稍后……", {
				icon : 7,
				time : 0,
				shade : [ 0.1, '#fff' ]
			});
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("安装包库成功,正在刷新数据请稍后……", {
					icon : 1,
					time : 500,
					shade : [ 0.1, '#fff' ]
				}, function() {
					layer.closeAll('dialog');
					$.parentReload();
				});
			} else {
				$.modalAlert(data.msg, modal_status.FAIL);
			}
		},
	// // 完成后取消禁用
	// complete : function() {
	// document.getElementById("installPackageSave").removeAttribute(
	// "disabled");
	// console.log(23);
	// // 关闭提示窗
	// layer.closeAll('dialog');
	// $.parentReload();
	// }
	});
}