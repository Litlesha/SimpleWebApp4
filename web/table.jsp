        <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 23.04.2024
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/teacher";
    String jdbcUser = "root";
    String jdbcPassword = "123456";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
        Statement stmt = conn.createStatement();
        ResultSet rsTeacher = stmt.executeQuery("SELECT * FROM teacher");

%>
<table border="1">
    <thead>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>id_department</th>
    </tr>
    </thead>
    <tbody>
    <%
        while (rsTeacher.next()) {
    %>
    <tr>
        <td><%=rsTeacher.getInt(1)%></td>
        <td><%=rsTeacher.getString(2)%></td>
        <td><%=rsTeacher.getString(3)%></td>
        <td><%=rsTeacher.getInt(4)%></td>
     
    </tr>
    <%
            }
            rsTeacher.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </tbody>
</table>
</body>
</html>
