/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tania.projectogestaodejogos.servlets;

import com.tania.projectogestaodejogos.entidades.Jogo;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tania
 */
@WebServlet(name = "UpdateGameServlet", urlPatterns = {"/UpdateGameServlet"})
public class UpdateGameServlet extends HttpServlet {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("meuPU");

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateGameServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateGameServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // receber o id
        Long id = Long.parseLong(request.getParameter("id"));

        EntityManager em = emf.createEntityManager();

        //jogo pelo id
        Jogo jogo = em.find(Jogo.class, id);

        em.close();

        // enviar o jogo para o JSP de edição
        request.setAttribute("jogo", jogo);

        request.getRequestDispatcher("edit.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Long id = Long.parseLong(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        String estudio = request.getParameter("estudio");

        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();

        Jogo jogo = em.find(Jogo.class, id);

        if (jogo == null) {
            em.close();
            response.sendRedirect("DashboardServlet");
            return;
        }
        jogo.setNome(nome);
        jogo.setTipo(tipo);
        jogo.setEstudio(estudio);

        em.getTransaction().commit();
        em.close();

        response.sendRedirect("DashboardServlet?msg=editado");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
