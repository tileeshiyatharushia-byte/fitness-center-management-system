<%--
  Created by IntelliJ IDEA.
  User: ashen
  Date: 4/8/25
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Error</title></head>
<body>
<h2 style="color:red;">Error: <%= request.getParameter("message") %></h2>
<a href="addMember.jsp">Try Again</a>
</body>
</html>

