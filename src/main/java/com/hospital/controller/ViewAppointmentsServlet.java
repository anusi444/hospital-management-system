package com.hospital.controller;

import com.hospital.dao.AppointmentDAO;
import com.hospital.dao.DoctorDAO;
import com.hospital.dao.PatientDAO;
import com.hospital.model.Appointment;
import com.hospital.model.Doctor;
import com.hospital.model.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewAppointments")
public class ViewAppointmentsServlet extends HttpServlet {

    private final AppointmentDAO appointmentDAO = new AppointmentDAO();
    private final PatientDAO patientDAO = new PatientDAO();
    private final DoctorDAO doctorDAO = new DoctorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Appointment> appointmentList = appointmentDAO.getAllAppointments();
        List<Patient> patientList = patientDAO.getAllPatients();
        List<Doctor> doctorList = doctorDAO.getAllDoctors();

        request.setAttribute("appointmentList", appointmentList);
        request.setAttribute("patientList", patientList);
        request.setAttribute("doctorList", doctorList);

        request.getRequestDispatcher("viewAppointments.jsp").forward(request, response);
    }
}