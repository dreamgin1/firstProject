<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="selectList">
	<form method="post" action="javascript:;">
	软件名称:<input type="text" name="softwareName" value="${softwareName }">
	APP状态:<select name="statusName">
			<c:if test="${data_dictionariesList != null }">
					<option value="0">--请选择--</option>
					
						 <c:forEach var="data" items="${data_dictionariesList}">
						 <c:if test="${data.typeCode == 'APP_STATUS'}">
						   <option <c:if test="${data.id == status }">selected="selected"</c:if> 
						   value="${data.valueId}">${data.valueName}</option>
						   </c:if>
						  </c:forEach>
						  
					</c:if>
	        </select>
	 所属平台:<select name="flatformName">
			<c:if test="${data_dictionariesList != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="data" items="${data_dictionariesList}">
						  <c:if test="${data.typeCode == 'APP_FLATFORM'}">
						   <option <c:if test="${data.id == flatformId }">selected="selected"</c:if>
						   value="${data.valueId}">${data.valueName}</option>
						   </c:if>
						  </c:forEach>
					</c:if>
	        </select>
	  一级分类:<select name="categoryLevel1Name">
			<c:if test="${app_categoryList1 != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="cate1" items="${app_categoryList1}">
						   <option value="${cate1.id}">${cate1.categoryName}</option>
						  </c:forEach>
					</c:if>
					</select>
	  二级分类:<select name="categoryLevel2Name">
			<c:if test="${app_categoryList2 != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="cate2" items="${app_categoryList2}">
						   <option value="${cate2.id}">${cate2.categoryName}</option>
						  </c:forEach>
					</c:if>
					</select>
	    三级分类:<select name="categoryLevel3Name">
			<c:if test="${app_categoryList3 != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="cate3" items="${app_categoryList3}">
						   <option value="${cate3.id}">${cate3.categoryName}</option>
						  </c:forEach>
					</c:if>
					</select>
	        <input	value="查 询" type="submit" id="applist"/>
	 </form>
	 <p>新增APP技术信息</p>
	 
	 <table cellpadding="0" cellspacing="0">	 
                <tr>
                    <th>软件名称</th>
                    <th>APK名称</th>
                    <th>软件大小(单位/M)</th>
                    <th>所属平台</th>
                    <th>所属分类(一级分类,二级分类,三级分类)</th>
                    <th>状态</th>
                    <th>下载次数</th>
                    <th>最新版本号</th>
                    <th>操作</th>
                </tr>
                   <c:forEach var="app_info" items="${app_infosList }" varStatus="status">                           
					<tr>						
						<td>
						<span>${app_info.softwareName}</span>
						</td>
						<td>
						<span>${app_info.APKName}</span>
						</td>
						<td>
						<span>${app_info.softwareSize}</span>
						</td>
						<td>					
						<span>${app_info.flatformName}</span>								
						</td>
						<td>
 						<span>${app_info.categoryLevel1Name}>${app_info.categoryLevel2Name}>${app_info.categoryLevel3Name}</span>
						<%-- <span>${categoryLevel3Name}>${categoryLevel2Name}>${categoryLevel1Name}</span> --%>
						</td>
						<td>
						<span>${app_info.statusName }</span>
						</td>
						<td>
						<span>${app_info.downloads}</span>
						</td>
						<td>
						<span>${app_info.versionNo}</span>
						</td>
						<td>
						<span><a class="del" href="javascript:;" Appid=${app_info.id }>点击删除</a></span>
						<span><a class="sel" href="javascript:;" Appid=${app_info.id }>点击查询</a></span>
						<span><a class="shenhe" href="javascript:;" Appid=${app_info.statusName }>点击修改</a></span>
						</td>																						
				</tr>				
				</c:forEach>
			</table>
		</div>
</body>
<script type="text/javascript">
$(document).ready(function(){	
	$("#applist").click(function(){
		var softwareName = $("input[name='softwareName']").val();
		var statusName = $("select[name='statusName']").val();	
		var flatformName = $("select[name='flatformName']").val();	
		var categoryLevel1Name = $("select[name='categoryLevel1Name']").val();			
		var categoryLevel2Name = $("select[name='categoryLevel2Name']").val();					
		var categoryLevel3Name = $("select[name='categoryLevel3Name']").val();
		alert(categoryLevel1Name);
		alert(softwareName+","+statusName+","+flatformName+","+categoryLevel1Name+","+categoryLevel2Name+","+categoryLevel3Name);
		$(".selectList").html("");
		$(".selectList").load("${pageContext.request.contextPath }/zengqi/getApp_info","softwareName="+softwareName+
		"&statusName="+statusName+"&flatformName="+flatformName+"&categoryLevel1Name="+categoryLevel1Name+
		"&categoryLevel2Name="+categoryLevel2Name+"&categoryLevel3Name="+categoryLevel3Name);

	});
	$(".del").click(function(){					
		var id=$(this).attr("Appid");	
		alert(id);
		$("body").load("${pageContext.request.contextPath }/zengqi/delete/"+id);
		alert(id);
	});
	
	$(".sel").click(function(){					
		var id=$(this).attr("Appid");
		alert(id);
		$("div").html("");
		$("div").load("${pageContext.request.contextPath }/zengqi/AppviewList/"+id);
	});
	
	$(".shenhe").click(function() {
		var str=$(this).attr("Appid");
		var str1 = "已上架";
		var str2 = "已下架";
		if(str==str1){
			alert("该APP应用的状态为:【已上架】,不能修改");
		} else if(str==str2){
			alert("该APP应用的状态为:【已下架】,不能修改");
		}
	});
});
		</script>
</html>