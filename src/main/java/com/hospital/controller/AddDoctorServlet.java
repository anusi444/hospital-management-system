package com.hospital.controller;

import com.hospital.dao.DoctorDAO;
import com.hospital.model.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addDoctor")
public class AddDoctorServlet extends HttpServlet {

    private final DoctorDAO doctorDAO = new DoctorDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Doctor doctor = new Doctor();
        doctor.setName(request.getParameter("name"));
        doctor.setSpecialization(request.getParameter("specialization"));
        doctor.setPhone(request.getParameter("phone"));
        doctor.setEmail(request.getParameter("email"));

        doctorDAO.addDoctor(doctor);
        response.sendRedirect("viewDoctors");
    }
}