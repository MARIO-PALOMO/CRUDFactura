/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clases.Cliente;
import Clases.Producto;
import Controlador.ControladorCliente;
import Controlador.ControladorProducto;
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
public class ServletProducto extends HttpServlet {

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

        String tipo = request.getParameter("gestion");

        ControladorProducto controladorProducto = new ControladorProducto();
        Producto producto = new Producto();

        int codigo = Integer.parseInt(request.getParameter("txtCodigoProducto"));
        String nombre = request.getParameter("txtNombreProducto");
        int stock = Integer.parseInt(request.getParameter("txtStockProducto"));
        double precio = Double.parseDouble(request.getParameter("txtPrecioProducto"));

        producto.setIdProducto(codigo);
        producto.setNombreProducto(nombre);
        producto.setStockProducto(stock);
        producto.setPrecioProducto(precio);

        switch (tipo) {
            case "guardar":
                if (controladorProducto.crear(producto) == true) {
                    response.getWriter().println("Producto registrado exitosamente");
                } else {
                    response.sendError(1, "Error al Guardar Producto");
                }
                break;
            case "modificar":
                if (controladorProducto.modificar(producto) == true) {
                    response.getWriter().println("Producto Modificado exitosamente");
                } else {
                    response.sendError(1, "Error al Modificar Producto");
                }
                break;
            case "eliminar":
                if (controladorProducto.eliminar(producto) == true) {
                    response.getWriter().println("Producto Eliminado exitosamente");
                } else {
                    response.sendError(1, "Error al Eliminar Producto");
                }
                break;
            case "buscar":

                String JSONCliente = "{"
                        + "  \"data\": [";
                PrintWriter out = response.getWriter();

                for (Producto producto_ : controladorProducto.buscar()) {

                    JSONCliente
                            += "["
                            + "\"" + producto_.getIdProducto() + "\","
                            + "\"" + producto_.getNombreProducto() + "\","
                            + "\"" + producto_.getStockProducto() + "\","
                            + "\"" + producto_.getPrecioProducto() + "\","
                            + "\"EDITAR\","
                            + "\"ELIMINAR\""
                            + "],";

                }

                if (JSONCliente.length() > 12) {
                    out.println(JSONCliente.substring(0, (JSONCliente.length() - 1)) + "]}");
                } else {
                    out.println(" {  \"data\": [[\" \",\"SIN REGISTROS\",\"SIN REGISTROS\",\"SIN REGISTROS\",\"EDITAR\",\"ELIMINAR\"]]}");
                }

                break;

            case "buscarListaPrincipal":

                String JSONProductoLista = "";
                PrintWriter outs = response.getWriter();

                for (Producto producto_ : controladorProducto.buscar()) {
                    JSONProductoLista
                            += "<div class=\"col-md-3\">\n"
                            + "                            <div class=\"ibox\">\n"
                            + "                                <div class=\"ibox-content product-box\">\n"
                            + "\n"
                            + "                                    <div class=\"product-imitation\">\n"
                            + "                                        <img src=\"../images/producto.png\" alt=\"PRODUCTO\" width=\"100%\" height=\"50%\"/>\n"
                            + "                                    </div>\n"
                            + "                                    <div class=\"product-desc\">\n"
                            + "                                        <span class=\"product-price\">\n"
                            + "                                            $" + producto_.getPrecioProducto() + "\n"
                            + "                                        </span>\n"
                            + "                                        <small class=\"text-muted\">Electronix</small>\n"
                            + "                                        <a href=\"#\" class=\"product-name\"> " + producto_.getNombreProducto() + "</a>\n"
                            + "                                        <div class=\"small m-t-xs\">\n"
                            + "                                            Descripcion del Producto.\n"
                            + "                                        </div>\n"
                            + "                                        <div class=\"m-t text-righ\">\n"
                            + "\n"
                            + "                                            <input type=\"checkbox\" id=\"" + producto_.getIdProducto() + "\" name=\"idProducto\" value=\"" + producto_.getNombreProducto() + "\"> Seleccionar Producto<br>\n"
                            + "                                        </div>\n"
                            + "                                    </div>\n"
                            + "                                </div>\n"
                            + "                            </div>\n"
                            + "                        </div>";

                }
                outs.println(JSONProductoLista);

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
