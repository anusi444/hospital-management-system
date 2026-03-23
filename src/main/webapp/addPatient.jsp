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
    <title>Add Patient</title>
    <style>
        body{font-family:Arial;background:#eef2f7;margin:0}
        .box{width:450px;margin:60px auto;background:#fff;padding:30px;border-radius:10px;box-shadow:0 4px 10px rgba(0,0,0,.15)}
        h2{text-align:center}
        input,select,button{width:100%;padding:10px;margin:10px 0;box-sizing:border-box}
        button{background:#1f3b57;color:#fff;border:none}
    </style>
</head>
<body>
<div class="box">
    <h2>Add Patient</h2>
    <form action="addPatient" method="post">
        <input type="text" name="name" placeholder="Patient Name" required>
        <input type="number" name="age" placeholder="Age" required>
        <select name="gender" required>
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
        </select>
        <input type="text" name="disease" placeholder="Disease" required>
        <input type="text" name="phone" placeholder="Phone" required>
        <button type="submit">Save Patient</button>
    </form>
    <a href="adminDashboard.jsp">Back</a>
</div>
</body>
</html>