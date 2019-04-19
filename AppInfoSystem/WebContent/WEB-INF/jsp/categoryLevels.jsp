<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="categoryLevel1" name="categoryLevels" method="post" action="javascript:;">    
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
		</form>
</body>
</html>