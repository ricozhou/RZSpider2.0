var prefix = ctx + "tool/baseset/detailedit/musiclist"

$(function() {
	$('.bootstrap-table').bootstrapTable('refresh', queryParams);
	var columns = [
			{
				checkbox : true
			},
			{
				field : 'musicId',
				title : '歌曲id'
			},
			{
				field : 'title',
				title : '歌曲名'
			},
			{
				field : 'author',
				title : '歌手'
			},
			{
				field : 'url',
				title : '歌曲链接',
				align : 'center',
				formatter : function(value, row, index) {
					var link = value;
					return '<a  href="' + link + '" target="_Blank">' + value
							+ '</a>';
				}
			},
			{
				field : 'pic',
				title : '歌曲封面链接',
				align : 'center',
				formatter : function(value, row, index) {
					var link = value;
					if (link != null) {

						return '<a href="'
								+ link
								+ '" target="_Blank"><img width="50px" height="50px" src="'
								+ link
								+ '" onMouseOver="this.width=500;this.height=500;" onMouseOut="this.width=50; this.height=50"></img></a>';
					}

				}
			},
			{
				title : '操作',
				align : 'center',
				formatter : function(value, row, index) {
					var actions = [];
					actions
							.push('<a class="btn btn-success btn-xs" href="#" title="编辑" mce_href="#" onclick="edit(\''
									+ row.musicId
									+ '\')"><i class="fa fa-edit"></i>编辑</a> ');
					actions
							.push('<a class="btn btn-warning btn-xs " href="#" title="删除" onclick="remove(\''
									+ row.musicId
									+ '\')"><i class="fa fa-remove"></i>删除</a>');
					return actions.join('');
				}
			} ];
	var url = prefix + "/list";
	// 自定义参数查询
	$.initTableParams(columns, url, queryParams);
});

function queryParams(params) {
	return {
		// 传递参数查询参数
		pageSize : params.limit,
		pageNum : params.offset / params.limit + 1,
		searchValue : params.search,
		orderByColumn : params.sort,
		isAsc : params.order,
		basesetId : basesetId
	};
}

/* 歌曲-新增 */
function add() {
	var url = prefix + '/add/' + basesetId;
	layer_showAuto("新增歌曲", url);
}
/* 歌曲-其它设置 */
function otherSet() {
	var url = prefix + '/otherSet/' + basesetId;
	layer_showAuto("音乐其它设置", url);
}

/* 歌曲-批量新增 */
function batchAdd() {
	var url = prefix + '/batchAdd/' + basesetId;
	layer_showAuto2("批量新增歌曲", url);
}

/* 歌曲-修改 */
function edit(musicId) {
	var url = prefix + '/edit/' + musicId;
	layer_showAuto("修改歌曲", url);
}

// 单条删除
function remove(id) {
	$.modalConfirm("确定要删除选中歌曲吗？", function() {
		_ajax(prefix + "/remove/" + id, "", "post");
		$.refreshTable();
	})
}

// 批量删除
function batchRemove() {
	var rows = $.getSelections("musicId");
	if (rows.length == 0) {
		$.modalMsg("请选择要删除的数据", "warning");
		return;
	}
	$.modalConfirm("确认要删除选中的" + rows.length + "条数据吗?", function() {
		_ajax(prefix + '/batchRemove', {
			"ids" : rows
		}, "post");
		$.refreshTable();
	});
}
