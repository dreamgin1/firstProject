<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div style="line-height: 30px;color:blur;">
		<p style="font-size: 16px;">软件名称:<a style="color:red;">${app_info.softwareName }</a></p>
		<p style="font-size: 16px;">APK名称:<a style="color:red;">${app_info.APKName }</a></p>
		<p style="font-size: 16px;">支持ROM:<a style="color:red;">${app_info.supportROM }</a></p>
		<p style="font-size: 16px;">支持界面语言:<a style="color:red;">${app_info.interfaceLanguage }</a></p>
		<p style="font-size: 16px;">软件大小:<a style="color:red;">${app_info.softwareSize }</a></p>
		<p style="font-size: 16px;">下载次数:<a style="color:red;">${app_info.downloads }</a></p>		
		<p style="font-size: 16px;">所属平台:<a style="color:red;">${app_info.flatformName }</a></p>
		<p style="font-size: 16px;">所属分类(一级分类,二级分类,三级分类):<a style="color:red;">${app_info.categoryLevel1Name }>${app_info.categoryLevel2Name }>${app_info.categoryLevel3Name }</a></p>				
		<p style="font-size: 16px;">APP状态:<a style="color:red;">${app_info.statusName }</a></p>		
		<p style="font-size: 16px;">应用简介:<a style="color:red;">${app_info.appInfo }</a></p>		
		<a style="font-size: 16px;">LOGO图片:</a><img height="200px" width="200px" alt="组织机构" src="${pageContext.request.contextPath }/statics/uploadfiles/${app_info.logoPicPath }">
		<a class="go" href="javascript:;" >返回</a>
		<a class="del" href="javascript:;" id=${app_info.id }>删除</a>
	</div>
</body>
<script type="text/javascript">
		$(".go").click(function(){					
			$("div").html("");
			$("div").load("${pageContext.request.contextPath }/zengqi/getApp_info");
		});
	$(".del").click(function(){	
		var id=$(this).attr("id");
		alert(id);
		$("div").html("");
		$("div").load("${pageContext.request.contextPath }/zengqi/delete/"+id);
	});

</script>

</html>