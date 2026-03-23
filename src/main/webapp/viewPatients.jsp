<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Patient> patientList = (List<Patient>) request.getAttribute("patientList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Patients</title>
    <style>
        body{font-family:Arial;background:#f7f9fc;margin:0}
        .container{width:950px;margin:40px auto;background:#fff;padding:25px;border-radius:10px;box-shadow:0 4px 10px rgba(0,0,0,.15)}
        table{width:100%;border-collapse:collapse}
        th,td{padding:10px;border:1px solid #ccc;text-align:center}
        th{background:#1f3b57;color:white}
        a{text-decoration:none;color:#1f3b57}
    </style>
</head>
<body>
<div class="container">
    <h2>Patients List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Disease</th>
            <th>Phone</th>
            <th>Action</th>
        </tr>
        <%
            if (patientList != null) {
                for (Patient patient : patientList) {
        %>
        <tr>
            <td><%= patient.getPatientId() %></td>
            <td><%= patient.getName() %></td>
            <td><%= patient.getAge() %></td>
            <td><%= patient.getGender() %></td>
            <td><%= patient.getDisease() %></td>
            <td><%= patient.getPhone() %></td>
            <td><a href="deletePatient?id=<%= patient.getPatientId() %>">Delete</a></td>
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