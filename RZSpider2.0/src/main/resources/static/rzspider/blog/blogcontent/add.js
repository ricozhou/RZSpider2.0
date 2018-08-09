//加载文本编辑器
$().ready(function() {
	$('.summernote').summernote({
		height : '220px',
		lang : 'zh-CN',
		callbacks : {
			onImageUpload : function(files, editor, $editable) {
				sendFile(files);
			}
		}
	});
});
// 表单验证
$("#form-blogcontent-add").validate({
	rules : {
		title : {
			required : true,
			maxlength : 50
		},
		author : {
			required : true,
			maxlength : 20
		}
	},
	messages : {
		"title" : {
			maxlength : '最长50字'
		},
		"author" : {
			maxlength : "最长20字",
		},
	},
	submitHandler : function(form) {
		//1是发布，0是草稿
		add(1);
	}
})

function add(status) {
	//1是发布，0是草稿
	// 标题
	var title = $("#title").val();
	if (title.length<1 || title.length > 20) {
		$.modalAlert("标题不能为空且字数不能超过50", modal_status.FAIL);
		return;
	}
	// 作者
	var author = $("#author").val();
	if (author.length<1 || author.length > 20) {
		$.modalAlert("作者不能为空且字数不能超过20", modal_status.FAIL);
		return;
	}
	// 类型
	var categories = $("#categories").val();
	// 内容
	var content = $("#content_sn").summernote('code');
	if (content == "<p><br></p>" || content.length > 30000) {
		$.modalAlert("文章不能为空且字数不能超过两万", modal_status.FAIL);
		return;
	}
	// 是否开启评论
	var allowComment = $("#allow_comment").is(':checked') == true ? 0 : 1;
	// 是否允许订阅
	var allowFeed = $("#status").is(':checked') == true ? 0 : 1;
	// 是否允许引用
	var allowPing = $("#ping").is(':checked') == true ? 0 : 1;
	$.ajax({
		cache : true,
		type : "POST",
		url : ctx + "blog/blogcontent/save",
		data : {
			"status" : status,
			"title" : title,
			"author" : author,
			"categories" : categories,
			"content" : content,
			"allowComment" : allowComment,
			"allowFeed" : allowFeed,
			"allowPing" : allowPing
		},
		async : false,
		error : function(request) {
			$.modalAlert("系统错误", modal_status.FAIL);
		},
		success : function(data) {
			if (data.code == 0) {
				layer.msg("新增文章成功,正在刷新数据请稍后……", {
					icon : 1,
					time : 500,
					shade : [ 0.1, '#fff' ]
				}, function() {
					$.parentReload();
				});
			} else {
				$.modalAlert(data.msg, modal_status.FAIL);
			}

		}
	});
}
