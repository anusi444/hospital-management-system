package com.hospital.controller;

import com.hospital.dao.AppointmentDAO;
import com.hospital.model.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

    private final AppointmentDAO appointmentDAO = new AppointmentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Appointment appointment = new Appointment();
        appointment.setPatientId(Integer.parseInt(request.getParameter("patientId")));
        appointment.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
        appointment.setAppointmentDate(request.getParameter("appointmentDate"));
        appointment.setAppointmentTime(request.getParameter("appointmentTime"));
        appointment.setStatus(request.getParameter("status"));

        appointmentDAO.bookAppointment(appointment);
        response.sendRedirect("viewAppointments");
    }
}