<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Doctor</title>
    <style>
        body{font-family:Arial;background:#eef2f7;margin:0}
        .box{width:450px;margin:60px auto;background:#fff;padding:30px;border-radius:10px;box-shadow:0 4px 10px rgba(0,0,0,.15)}
        h2{text-align:center}
        input,button{width:100%;padding:10px;margin:10px 0;box-sizing:border-box}
        button{background:#1f3b57;color:#fff;border:none}
        a{text-decoration:none}
    </style>
</head>
<body>
<div class="box">
    <h2>Add Doctor</h2>
    <form action="addDoctor" method="post">
        <input type="text" name="name" placeholder="Doctor Name" required>
        <input type="text" name="specialization" placeholder="Specialization" required>
        <input type="text" name="phone" placeholder="Phone" required>
        <input type="email" name="email" placeholder="Email" required>
        <button type="submit">Save Doctor</button>
    </form>
    <a href="adminDashboard.jsp">Back</a>
</div>
</body>
</html>