/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clases.Cliente;
import Controlador.ControladorCliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO LEGION
 */
public class ServletCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String tipo = request.getParameter("gestion");

        ControladorCliente controladorCliente = new ControladorCliente();
        Cliente cliente = new Cliente();

        int codigo = Integer.parseInt(request.getParameter("txtCodigoCliente"));
        String nombre = request.getParameter("txtNombreCliente");
        String cedula = request.getParameter("txtCedulaCliente");
        String direccion = request.getParameter("txtDireccionCliente");
        String telefono = request.getParameter("txtTelefonoCliente");

        cliente.setIdCliente(codigo);
        cliente.setNombreCliente(nombre);
        cliente.setCedulaCliente(cedula);
        cliente.setDireccionCliente(direccion);
        cliente.setTelefonoCliente(telefono);

        switch (tipo) {
            case "guardar":
                if (controladorCliente.crear(cliente) == true) {
                    response.getWriter().println("Cliente registrado exitosamente");
                } else {
                    response.sendError(1, "Error al Guardar Cliente");
                }
                break;
            case "modificar":
                if (controladorCliente.modificar(cliente) == true) {
                    response.getWriter().println("Cliente Modificado exitosamente");
                } else {
                    response.sendError(1, "Error al Modificar Cliente");
                }
                break;
            case "eliminar":
                if (controladorCliente.eliminar(cliente) == true) {
                    response.getWriter().println("Cliente Eliminado exitosamente");
                } else {
                    response.sendError(1, "Error al Eliminar Cliente");
                }
                break;

            case "buscar":
                String JSONCliente = "{"
                        + "  \"data\": [";
                PrintWriter out = response.getWriter();

                for (Cliente cliente_ : controladorCliente.buscar()) {

                    JSONCliente
                            += "["
                            + "\"" + cliente_.getIdCliente() + "\","
                            + "\"" + cliente_.getNombreCliente() + "\","
                            + "\"" + cliente_.getCedulaCliente() + "\","
                            + "\"" + cliente_.getDireccionCliente() + "\","
                            + "\"" + cliente_.getTelefonoCliente() + "\","
                            + "\"EDITAR\","
                            + "\"ELIMINAR\""
                            + "],";

                }

                if (JSONCliente.length() > 12) {
                    out.println(JSONCliente.substring(0, (JSONCliente.length() - 1)) + "]}");
                } else {
                    out.println(" {  \"data\": [[\" \",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"EDITAR\",\"ELIMINAR\"]]}");
                }
                break;
            default:
                break;
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
        processRequest(request, response);
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
        processRequest(request, response);
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
