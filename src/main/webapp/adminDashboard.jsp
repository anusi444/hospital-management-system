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
    <title>Admin Dashboard</title>
    <style>
        body{font-family:Arial;background:#f4f6f8;margin:0}
        .container{width:700px;margin:60px auto;background:#fff;padding:30px;border-radius:12px;box-shadow:0 4px 12px rgba(0,0,0,.15)}
        h2{text-align:center;color:#1f3b57}
        .menu{display:grid;grid-template-columns:1fr 1fr;gap:15px;margin-top:25px}
        a{display:block;text-align:center;padding:15px;background:#1f3b57;color:white;text-decoration:none;border-radius:8px}
    </style>
</head>
<body>
<div class="container">
    <h2>Admin Dashboard</h2>
    <div class="menu">
        <a href="addDoctor.jsp">Add Doctor</a>
        <a href="viewDoctors">View Doctors</a>
        <a href="addPatient.jsp">Add Patient</a>
        <a href="viewPatients">View Patients</a>
        <a href="logout">Logout</a>
    </div>
</div>
</body>
</html>