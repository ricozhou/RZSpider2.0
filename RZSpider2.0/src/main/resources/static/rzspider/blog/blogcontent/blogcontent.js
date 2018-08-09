var prefix = ctx + "blog/blogcontent";

$(function() {
	var columns = [
			{
				checkbox : true
			},
			{
				field : 'cid',
				title : '文章ID'
			},
			{
				field : 'title',
				title : '标题',
				width : 320,
				formatter : function(value, row, index) {
					return '<a href="#" onclick="preview(\'' + row.cid
							+ '\')">' + row.title + '</a>';
				}

			},
			{
				field : 'type',
				title : '类型'
			},
			{
				field : 'categories',
				title : '分类'
			},
			{
				field : 'commentsNum',
				title : '评论数量'
			},
			{
				field : 'likeNum',
				title : '点赞数量'
			},
			{
				field : 'allowComment',
				title : '开启评论',
				align : 'center',
				formatter : function(value, row, index) {
					if (value == '0') {
						return '<span class="label label-primary">是</span>';
					} else if (value == '1') {
						return '<span class="label label-danger">否</span>';
					}
				}
			},
			{
				field : 'allowPing',
				title : '允许引用',
				align : 'center',
				formatter : function(value, row, index) {
					if (value == '0') {
						return '<span class="label label-primary">是</span>';
					} else if (value == '1') {
						return '<span class="label label-danger">否</span>';
					}
				}
			},
			{
				field : 'allowFeed',
				title : '允许订阅',
				align : 'center',
				formatter : function(value, row, index) {
					if (value == '0') {
						return '<span class="label label-primary">是</span>';
					} else if (value == '1') {
						return '<span class="label label-danger">否</span>';
					}
				}
			},
			{
				field : 'status',
				title : '状态',
				align : 'center',
				formatter : function(value, row, index) {
					if (value == '0') {
						return '<span class="label label-danger">草稿</span>';
					} else if (value == '1') {
						return '<span class="label label-primary">发布</span>';
					}
				}
			},
			{
				field : 'author',
				title : '作者'
			},
			{
				title : '操作',
				align : 'center',
				formatter : function(value, row, index) {
					var actions = [];
					actions
							.push('<a class="btn btn-success btn-xs '
									+ editFlag
									+ '" href="#" title="编辑" mce_href="#" onclick="edit(\''
									+ row.cid
									+ '\')"><i class="fa fa-edit"></i>编辑</a> ');
					actions.push('<a class="btn btn-warning btn-xs '
							+ removeFlag
							+ '" href="#" title="删除" onclick="remove(\''
							+ row.cid
							+ '\')"><i class="fa fa-remove"></i>删除</a>');
					actions
							.push('<a class="btn btn-success btn-xs " href="#" title="预览" onclick="preview(\''
									+ row.cid
									+ '\')"><i class="fa fa-rocket"></i>预览</a>');
					return actions.join('');
				}
			} ];
	var url = prefix + "/list";
	$.initTable(columns, url);
});

/* 文章内容-新增 */
function add() {
	var url = prefix + '/add';
	layer_showAuto2("新增文章内容", url);
}

/* 文章内容-修改 */
function edit(cid) {
	var url = prefix + '/edit/' + cid;
	layer_showAuto2("修改文章内容", url);
}

// 单条删除
function remove(id) {
	$.modalConfirm("确定要删除选中文章内容吗？", function() {
		_ajax(prefix + "/remove/" + id, "", "post");
	})
}

// 批量删除
function batchRemove() {
	var rows = $.getSelections("cid");
	if (rows.length == 0) {
		$.modalMsg("请选择要删除的数据", "warning");
		return;
	}
	$.modalConfirm("确认要删除选中的" + rows.length + "条数据吗?", function() {
		_ajax(prefix + '/batchRemove', {
			"ids" : rows
		}, "post");
	});
}

// 预览
function preview(id) {
	window.open("/rzblog/open/post/" + id);
	// window.location.href="/blog/open/post/"+id;
}