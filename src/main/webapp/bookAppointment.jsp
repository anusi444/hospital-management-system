<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Appointment" %>
<%@ page import="com.hospital.model.Patient" %>
<%@ page import="com.hospital.model.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("RECEPTIONIST")) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Appointment> appointmentList = (List<Appointment>) request.getAttribute("appointmentList");
    List<Patient> patientList = (List<Patient>) request.getAttribute("patientList");
    List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctorList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f4f6f9;
            margin:0;
            padding:0;
        }
        .container{
            width:1100px;
            margin:30px auto;
            background:white;
            padding:30px;
            border-radius:12px;
            box-shadow:0 4px 12px rgba(0,0,0,0.15);
        }
        h2{
            text-align:center;
            color:#1f3b57;
            margin-bottom:20px;
        }
        form{
            display:grid;
            grid-template-columns: 1fr 1fr 1fr 1fr 1fr auto;
            gap:10px;
            margin-bottom:30px;
        }
        select,input,button{
            padding:10px;
            border:1px solid #ccc;
            border-radius:6px;
            font-size:14px;
        }
        button{
            background:#1f3b57;
            color:white;
            border:none;
            cursor:pointer;
        }
        button:hover{
            background:#163047;
        }
        table{
            width:100%;
            border-collapse:collapse;
            margin-top:20px;
        }
        th,td{
            border:1px solid #ddd;
            padding:12px;
            text-align:center;
        }
        th{
            background:#1f3b57;
            color:white;
        }
        a{
            text-decoration:none;
            color:#1f3b57;
            font-weight:bold;
        }
        .back{
            display:inline-block;
            margin-top:20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Book Appointment</h2>

    <form action="bookAppointment" method="post">
        <select name="patientId" required>
            <option value="">Select Patient</option>
            <%
                if (patientList != null) {
                    for (Patient patient : patientList) {
            %>
            <option value="<%= patient.getPatientId() %>">
                <%= patient.getName() %>
            </option>
            <%
                    }
                }
            %>
        </select>

        <select name="doctorId" required>
            <option value="">Select Doctor</option>
            <%
                if (doctorList != null) {
                    for (Doctor doctor : doctorList) {
            %>
            <option value="<%= doctor.getDoctorId() %>">
                <%= doctor.getName() %>
            </option>
            <%
                    }
                }
            %>
        </select>

        <input type="date" name="appointmentDate" required>
        <input type="time" name="appointmentTime" required>
        <input type="text" name="status" value="Scheduled" required>
        <button type="submit">Book</button>
    </form>

    <h2>Appointments List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Patient</th>
            <th>Doctor</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            if (appointmentList != null) {
                for (Appointment appointment : appointmentList) {
        %>
        <tr>
            <td><%= appointment.getAppointmentId() %></td>
            <td><%= appointment.getPatientName() %></td>
            <td><%= appointment.getDoctorName() %></td>
            <td><%= appointment.getAppointmentDate() %></td>
            <td><%= appointment.getAppointmentTime() %></td>
            <td><%= appointment.getStatus() %></td>
            <td>
                <a href="deleteAppointment?id=<%= appointment.getAppointmentId() %>">Cancel</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <a class="back" href="receptionistDashboard.jsp">Back</a>
</div>

</body>
</html>