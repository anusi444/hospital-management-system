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
    <title>Appointments</title>
    <style>
        body{font-family:Arial;background:#f7f9fc;margin:0}
        .container{width:1100px;margin:30px auto;background:#fff;padding:25px;border-radius:10px;box-shadow:0 4px 10px rgba(0,0,0,.15)}
        h2{text-align:center}
        form{display:grid;grid-template-columns:1fr 1fr 1fr 1fr 1fr auto;gap:10px;margin-bottom:25px}
        select,input,button{padding:10px}
        button{background:#1f3b57;color:white;border:none}
        table{width:100%;border-collapse:collapse}
        th,td{padding:10px;border:1px solid #ccc;text-align:center}
        th{background:#1f3b57;color:white}
        a{text-decoration:none;color:#1f3b57}
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
            <option value="<%= patient.getPatientId() %>"><%= patient.getName() %></option>
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
            <option value="<%= doctor.getDoctorId() %>"><%= doctor.getName() %></option>
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
            <td><a href="deleteAppointment?id=<%= appointment.getAppointmentId() %>">Cancel</a></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <br>
    <a href="receptionistDashboard.jsp">Back</a>
</div>
</body>
</html>