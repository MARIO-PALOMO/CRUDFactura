/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModeloConexion {

    private Connection cn;
    private String host = "localhost";
    private String port = "3307";
    private String database = "factura";
    private String user = "root";
    private String password = "12345";

    public Connection getCn() {
        return cn;
    }

    public void setCn(Connection cn) {
        this.cn = cn;
    }

    public void Conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/" + database, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(ModeloConexion.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void Cerrar() {
        try {
            if (cn != null) {
                if (cn.isClosed() == false) {
                    cn.close();
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ModeloConexion.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
