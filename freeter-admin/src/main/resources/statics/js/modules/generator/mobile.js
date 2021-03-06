$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'generator/mobile/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '品牌', name: 'brand', index: 'brand', width: 80 }, 			
			{ label: '型号', name: ' version', index: ' version', width: 80 }, 			
			{ label: '上市月份', name: 'listedyear', index: 'listedyear', width: 80 }, 			
			{ label: '', name: 'listingmonth', index: 'listingmonth', width: 80 }, 			
			{ label: '机身颜色', name: 'color', index: 'color', width: 80 }, 			
			{ label: '操作系统', name: 'operatingSystem', index: 'operating_system', width: 80 }, 			
			{ label: '屏幕', name: 'screen', index: 'screen', width: 80 }, 			
			{ label: '机身存储空间', name: 'rom', index: 'ROM', width: 80 }, 			
			{ label: '机身的运行内存', name: 'ram', index: 'RAM', width: 80 }, 			
			{ label: '屏幕分辨率', name: 'resolvingPower', index: 'resolving_power', width: 80 }, 			
			{ label: '机身重量', name: 'weight', index: 'weight', width: 80 }, 			
			{ label: '主芯片', name: 'cpu', index: 'CPU', width: 80 }, 			
			{ label: '其他', name: 'other', index: 'other', width: 80 }, 			
			{ label: '描述', name: 'described', index: 'described', width: 80 }, 			
			{ label: '像素', name: 'backCamera', index: 'back_camera', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		mobile: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.mobile = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.mobile.id == null ? "generator/mobile/save" : "generator/mobile/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.mobile),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "generator/mobile/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "generator/mobile/info/"+id, function(r){
                vm.mobile = r.mobile;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});