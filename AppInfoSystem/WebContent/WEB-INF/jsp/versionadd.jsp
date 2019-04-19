<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<meta http-equiv="Content-Type"                              content="multipart/form-data; charset=utf-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Bootstrap -->
   <%-- <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet"> --%>
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath }/statics/css/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="${pageContext.request.contextPath }/statics/css/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="${pageContext.request.contextPath }/statics/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="${pageContext.request.contextPath }/statics/css/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="${pageContext.request.contextPath }/statics/css/starrr.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/common.css" rel="stylesheet">
 <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/pageHelper.js"></script>
  <%--   <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css" /> --%>
   <%--  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/public.css" /> --%>

    <!-- Custom Theme Style -->
    <%-- <link href="${pageContext.request.contextPath }/statics/build/css/custom.min.css" rel="stylesheet"> --%>
    <h4>新增APP版本信息</h4>
    <hr>
	<h3>历史版本列表</h3>
	<hr>
	<%-- <div>
		   <table class="versionTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">软件名称</th>
                    <th width="10%">版本号</th>
                    <th width="10%">版本大小(单位:M)</th>
                    <th width="10%">发布状态</th>
                    <th width="40%">APK文件下载</th>
                    <th width="20%">最新更新时间</th>
                </tr>
                   <c:forEach var="version" items="${versionList }" varStatus="status">
					<tr>
						<td>
						<span>${version.softwareName }</span>
						</td>
						<td>
						<span>${version.versionNo }</span>
						</td>
						<td>
						<span>${version.versionSize}</span>
						</td>
						<td>
						<span>${version.valueName}</span>
						</td>
						<td>
							<span>${version.downloadLink}</span>
						</td>
						<td>
							<span>${version.modifyDate}</span>
						</td>
					</tr>
				</c:forEach>
			</table>
	</div> --%>
	
	<div class="col-sm-12">
                <div class="card-box table-responsive">
                 <table id="datatable-keytable" class="table table-striped table-bordered">
                  <thead>
                   <tr>
                    <th width="15%">软件名称</th>
                    <th width="10%">版本号</th>
                    <th width="15%">版本大小(单位:M)</th>
                    <th width="10%">发布状态</th>
                    <th width="30%">APK文件下载</th>
                    <th width="20%">最新更新时间</th>
                   </tr>
                  </thead>


                 <tbody>
                  <c:forEach var="version" items="${versionList }" varStatus="status">
					<tr>
						<td>
						<span>${version.softwareName }</span>
						</td>
						<td>
						<span>${version.versionNo }</span>
						</td>
						<td>
						<span>${version.versionSize}</span>
						</td>
						<td>
						<span>${version.valueName}</span>
						</td>
						<td>
							<span>${version.downloadLink}</span>
						</td>
						<td>
							<span><fmt:formatDate value="${version.modifyDate}"/></span>
						</td>
					</tr>
				</c:forEach>            
              </tbody>
            </table>
           
           </div>
          </div>
	 <div class="page">
            	
            </div>
	

                <div class="x_panel">
                  <div class="x_title">
                    <div class="title_left">
                		<h3>新增版本信息</h3>
              		</div>
                    <hr>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="versionaddForm" method="post" class="form-horizontal form-label-left"
                    	enctype="multipart/form-data">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionNo">版本号: <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<input type="hidden" name="appId" id="appId" value="${app_info.id }">
                          <input type="text" id="versionNo" name="versionNo" required="required" 
                          class="form-control col-md-7 col-xs-12"  placeholder="请输入版本号">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionSize">版本大小: <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="versionSize" name="versionSize" required="required" 
                           class="form-control col-md-7 col-xs-12" placeholder="请输入版本大小,单位为Mb" >
                           <font color="red" class="show"></font>
                        </div>
                      </div>               
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">发布状态:</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" >
                          <div id="publishStatus" class="btn-group" >
                            <label >
                              &nbsp; 预发布 &nbsp;
                            </label>      
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">版本简介:<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="versionInfo" name="versionInfo" class="date-picker form-control col-md-7 col-xs-12" 
                          required="required" type="text"  placeholder="请输入的相关信息">
                        </div>
                      </div>
                    <div class="form-group">    	
                    	<label for="a-apkLocPath" class="control-label col-md-3 col-sm-3 col-xs-12">apk文件：<span class="required">*</span></label>
                    	<div class="col-md-6 col-sm-6 col-xs-12">
                    	<input type="file" name="a-apkLocPath" id="a-apkLocPath" placeholder="未选择任何文件" required/> 
                    	</div>
                	</div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">                         
                          <input type="submit" name="add" id="add" value="保存" >
                          <input type="button" id="back" name="back" value="返回" >
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
             
	<script type="text/javascript">
		function getPage(totalPageNo,id){
			$(".right_col").html("");
			
			$(".right_col").load("${pageContext.request.contextPath }/version/add",
					"totalPageNo="+totalPageNo+"&id="+id);
		}	
	
		$("#add").click(function(){
			var param=new FormData(document.getElementById("versionaddForm"));
				$.ajax({
					url:"${pageContext.request.contextPath }/version/doadd",
					data:param,
					type:"POST",
					dataType:"html",
					cache:false,//缓存
					processData:false,//对数据处理
					contentType:false,//内容类别
					async:false,//同步
					success:function(data){
						$(".right_col").html("");
						$(".right_col").html(data);
					}
				})
		})
		$("#versionSize").blur(function(){
			var result=$(this).val();
			if(isNaN(result)){
				$("#versionSize").next().text("必须输入数字");
				$("#versionSize").val("");
			}else{
				$("#versionSize").next().text("");
			}
		})
		$(document).ready(function(){
			var appid=${appId};
			var totalPageNo=${pageUtil.totalPageNo};
			var totalPageCount=${pageUtil.totalPageCount};
			var str=pageHelper("getPage",totalPageNo,totalPageCount,appid);
			$(".page").html("");
			$(".page").html(str);
			$("#pageActivity").submit(function(){
				var appid=${appId};
				var totalPageNo=$("#pageActivity select").val();
				getPage(totalPageNo,appid);
			})
		})
	</script> 
	
	
	<%-- <h3>新增版本信息</h3>
	<hr>
	<form id="version-add" name="version-addForm" method="post" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/version/doadd" >
				<div>
				<input type="hidden" name="appId" id="appId" value="${app_info.id }">
				</div>
                <div>
                    <label for="versionNo">版本号：</label>
                    <input type="text" name="versionNo" id="versionNo" value="" placeholder="请输入版本号"
                     required> 
                </div>
                <div>
                    <label for="versionSize">版本大小：</label>
                    <input type="text" name="versionSize" id="versionSize" value="" 
                    	placeholder="请输入版本大小,单位为Mb" required> 
                </div>
                <div>
                    <label for="publishStatus">发布状态：预发布</label> 
                </div>
                <div>
                    <label for="versionInfo">版本简介：</label>
                    <input type="text" name="versionInfo" id="versionInfo" value="" placeholder="请输入的相关信息"
                     required>
                </div>
               <div>
                    <label for="a-apkLocPath">apk文件：</label>
                    <input type="file" name="a-apkLocPath" id="a-apkLocPath" placeholder="未选择任何文件" required/> 
                </div>
                <div class="versionAddBtn">
                    <input type="submit" name="add" id="add" value="保存" >
					<input type="button" id="back" name="back" value="返回" >
                </div>
                
            </form> --%>