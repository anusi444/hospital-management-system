<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctorList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Doctors</title>
    <style>
        body{font-family:Arial;background:#f7f9fc;margin:0}
        .container{width:900px;margin:40px auto;background:#fff;padding:25px;border-radius:10px;box-shadow:0 4px 10px rgba(0,0,0,.15)}
        table{width:100%;border-collapse:collapse}
        th,td{padding:10px;border:1px solid #ccc;text-align:center}
        th{background:#1f3b57;color:white}
        a{text-decoration:none;color:#1f3b57}
    </style>
</head>
<body>
<div class="container">
    <h2>Doctors List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Specialization</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        <%
            if (doctorList != null) {
                for (Doctor doctor : doctorList) {
        %>
        <tr>
            <td><%= doctor.getDoctorId() %></td>
            <td><%= doctor.getName() %></td>
            <td><%= doctor.getSpecialization() %></td>
            <td><%= doctor.getPhone() %></td>
            <td><%= doctor.getEmail() %></td>
            <td><a href="deleteDoctor?id=<%= doctor.getDoctorId() %>">Delete</a></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <br>
    <a href="adminDashboard.jsp">Back</a>
</div>
</body>
</html>