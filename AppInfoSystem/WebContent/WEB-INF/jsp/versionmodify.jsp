<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

	
	<h4>修改APP最新版本信息</h4>
	<hr>
	<h3>历史版本列表</h3>
	<hr>
	<div class="col-sm-12">
                        <div class="card-box table-responsive">      
                          <table id="datatable-keytable" class="table table-striped table-bordered">
                            <thead>
                              <tr>
                                 <th width="15%">软件名称</th>
                    <th width="10%">版本号</th>
                    <th width="15%">版本大小(单位:M)</th>
                    <th width="10%">发布状态</th>
                    <th width="40%">APK文件下载</th>
                    <th width="10%">最新更新时间</th>
                              </tr>
                            </thead>


                <tbody>
                   <c:forEach var="version1" items="${versionList }" varStatus="status">
					<tr>
						<td>
						<span>${version1.softwareName }</span>
						</td>
						<td>
						<span>${version1.versionNo }</span>
						</td>
						<td>
						<span>${version1.versionSize}</span>
						</td>
						<td>
						<span>${version1.valueName}</span>
						</td>
						<td>
						<span>${version1.downloadLink}</span>
						</td>
						<td>
						<span><fmt:formatDate value="${version1.modifyDate}"/></span>
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
                		<h3>修改最新版本信息</h3>
              		</div>
                    <hr>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="versionmodifyForm" class="form-horizontal form-label-left"
                    	enctype="multipart/form-data" >

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionNo">版本号: <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<input type="hidden" name="id" id="id" value="${version.id }"> 
                          <input type="text" id="versionNo" name="versionNo" 
                          class="form-control col-md-7 col-xs-12" disabled="disabled" value="${version.versionNo }" >
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionSize">版本大小: <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="versionSize" name="versionSize" required="required" )"
                           class="form-control col-md-7 col-xs-12" placeholder="请输入版本大小,单位为Mb" value="${version.versionSize }"  >
                           <font color="red" class="show"></font>
                        </div>
                      </div>               
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">发布状态</label>
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
                          required="required" type="text"  placeholder="请输入的相关信息" value="${version.versionInfo }">
                        </div>
                      </div>
                    <div class="form-group">    	   
                    	 <label for="a-apkLocPath" class="control-label col-md-3 col-sm-3 col-xs-12">apk文件：</label>
 						<div class="col-md-6 col-sm-6 col-xs-12">
 						${version.downloadLink}&nbsp;下载&nbsp;删除     
                    	</div>
                	</div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">                         
                          <input type="submit" name="add" id="add1" value="保存" >
                          <input type="button" id="back1" name="back" value="返回" >
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
    <script type="text/javascript">
    function getPage(totalPageNo,id){
		$(".right_col").html("");
		
		$(".right_col").load("${pageContext.request.contextPath }/version/modify",
				"totalPageNo="+totalPageNo+"&id="+id);
	}	

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
    		$("#versionmodifyForm").submit(function(){
    			var param=new FormData(document.getElementById("versionmodifyForm"));
				$.ajax({
					url:"${pageContext.request.contextPath }/version/domodify",
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
    })
    </script>
	
	