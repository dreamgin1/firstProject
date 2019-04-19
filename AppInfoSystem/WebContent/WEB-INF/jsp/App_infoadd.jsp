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
	<form id="appForm" name="appForm" method="post" action="javascript:;">                                    
           软件名称*<input type="text" name="softwareName" id="softwareName" value=""><br/>
    APK名称*<input type="text" name="APKName" id="APKName" value=""> <br/>
         支持ROM*<input type="text" name="supportROM" id="supportROM" value=""> <br/>
           界面语言*<input type="text" name="interfaceLanguage" id="interfaceLanguage" value=""> <br/>
           软件大小*<input type="text" name="softwareSize" id="softwareSize" value=""> <br/>
           下载次数*<input type="text" name="downloads" id="downloads" value=""> <br/>
           所属平台*<select name="flatformId" id="flatformId">
			<c:if test="${data_dictionariesList != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="data" items="${data_dictionariesList}">
						  <c:if test="${data.typeCode == 'APP_FLATFORM'}">
						   <option value="${data.valueId}">${data.valueName}</option>						  						   					   
						   </c:if>							     					   
						  </c:forEach>
					</c:if>
	        </select><br/>
	       
          一级分类 *<select name="categoryLevel1" id="categoryLevel1">
			<c:if test="${app_categoryList1 != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="cate1" items="${app_categoryList1}">
						   <option value="${cate1.id}" >${cate1.categoryName}</option>
						  </c:forEach>
					</c:if>
					</select><br/>
					
          二级分类*<select name="categoryLevel2" id="categoryLevel2">
			<c:if test="${app_categoryList2 != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="cate2" items="${app_categoryList2}">
						   <option <c:if test="${cate2.id == categoryLevel2Name }">selected="selected"</c:if>
						   value="${cate2.id}">${cate2.categoryName}</option>						   
						  </c:forEach>
					</c:if>
					</select><br/>
          三级分类*<select name="categoryLevel3" id="categoryLevel3">
			<c:if test="${app_categoryList3 != null }">
					<option value="0">--请选择--</option>
						 <c:forEach var="cate3" items="${app_categoryList3}">
						   <option <c:if test="${cate3.id == categoryLevel3Name }">selected="selected"</c:if>
						   value="${cate3.id}">${cate3.categoryName}</option>
						  </c:forEach>
					</c:if>
					</select><br/>
    APP状态* 待审核<input type="hidden" name="status" id="status" value=1> <br/>
           应用简介*<input type="text" name="appInfo" id="appInfo" value=""> <br/>
    LOGO图片*<input type="file" name="app_infos" id="logoPicPath"> <br/>				                                                        
           <input type="submit" name="add" id="add" value="添加" >					            
  
                    <!-- jQuery -->
<script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath }/statics/js/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath }/statics/js/nprogress.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${pageContext.request.contextPath }/statics/js/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/datepicker/daterangepicker.js"></script>
<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>
                    
</body>
<script type="text/javascript">
	$("#appForm").submit(function() {
		var appName1 = $("select[name='valueName']").val();
		alert(appName1);		
		var param = new FormData(document.getElementById("appForm"));
		$.ajax({				
			url:"${pageContext.request.contextPath }/zengqi/save",
			data:param,
			type:"POST",
			dataType:"html",
			cache:false,//缓存
			processData:false,//过程数据
			contentType:false,//内容类型
			async:false,//同步
			success:function(data){
				$(".right").html("");			
				$(".right").html(data);
			}
		})
	})
</script>
</html>

