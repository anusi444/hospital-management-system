package com.hospital.controller;

import com.hospital.dao.PatientDAO;
import com.hospital.model.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {

    private final PatientDAO patientDAO = new PatientDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Patient patient = new Patient();
        patient.setName(request.getParameter("name"));
        patient.setAge(Integer.parseInt(request.getParameter("age")));
        patient.setGender(request.getParameter("gender"));
        patient.setDisease(request.getParameter("disease"));
        patient.setPhone(request.getParameter("phone"));

        patientDAO.addPatient(patient);
        response.sendRedirect("viewPatients");
    }
}