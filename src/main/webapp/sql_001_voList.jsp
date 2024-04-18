<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<!-- Controller -->
<%
	// 모델을 뷰한테 넘겨준다
 	ArrayList<Dept> deptList = DeptDAO.selectDeptList();
 	
	ArrayList<Emp> empList = EmpDAO.selectEmpList();
 	
 	ArrayList<HashMap<String, Object>> deptOnOffList 
	= DeptDAO.selectDeptOnOffList();
	
 	ArrayList<HashMap<String, Object>> empAndDeptList 
	= EmpDAO.selectEmpAndDeptList();
%>


<!-- View -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<style>
		.table-wrapper {
			display: flex; /* Flexbox를 사용하여 요소를 수평으로 배치 */
		}
		.table-container {
			flex: 1; /* 테이블 컨테이너가 자동으로 확장되도록 함 */
			margin-right: 10px; /* 테이블 간 간격을 조절 */
		}
	</style>
</head>
<body>
	<div class="table-wrapper">
		<div class="table-container">
			<h1>Dept List</h1>
			<table border="1">
				<tr>
					<td>deptNO</td>
					<td>dname</td>
					<td>loc</td>	
				</tr>
				<%
				for(Dept d : deptList){
					%>
						<tr>
							<td><%=d.deptNo%></td>
							<td><%=d.dname%></td>
							<td><%=d.loc%></td>				
						</tr>
					<%				
					}
				%>
			</table>
		</div>
		<div class="table-container">
			<h1>Emp List</h1>
			<table border="1">
				<tr>
					<td>emptNO</td>
					<td>ename</td>
					<td>sal</td>	
				</tr>
				<%
				for(Emp e : empList){
					%>
						<tr>
							<td><%=e.empNo%></td>
							<td><%=e.ename%></td>
							<td><%=e.sal%></td>				
						</tr>
					<%				
					}
				%>
			</table>
		</div>
 		<div class="table-container"> 	
			<h1>Dept + onOff List</h1>
			<table border="1">
				<tr>
					<th>deptNo</th>
					<th>dname</th>
					<th>loc</th>
					<th>onOff</th>
				</tr>
				<%
					// map단점 : 형변환이 필요 할 수도 있고 IDE자동완성기능을 사용할 수 없다
					for(HashMap<String, Object> don : deptOnOffList) {
				%>
						<tr>
							<td><%=(Integer)(don.get("deptNo"))%></td>
							<td><%=(String)(don.get("dname"))%></td>
							<td><%=(String)(don.get("loc"))%></td>
							<td><%=(String)(don.get("onOff"))%></td>
						</tr>
				<%		
					}
				%>
			</table>
		</div>
		<div class="table-container">
			<h1>Emp INNER JOIN Dept List</h1>
			<table border="1">
				<tr>
					<th>empNo</th>
					<th>ename</th>
					<th>deptNo</th>
					<th>dname</th>
				</tr>
				<%
					// map단점 : 형변환이 필요 할 수도 있고 IDE자동완성기능을 사용할 수 없다
					for(HashMap<String, Object> ed : empAndDeptList) {
				%>
						<tr>
							<td><%=(Integer)(ed.get("empNo"))%></td>
							<td><%=(String)(ed.get("ename"))%></td>
							<td><%=(Integer)(ed.get("deptNo"))%></td>
							<td><%=(String)(ed.get("dname"))%></td>
						</tr>
				<%		
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>