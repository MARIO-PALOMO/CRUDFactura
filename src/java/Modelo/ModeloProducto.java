/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Producto;
import Interfaces.InterfaceGestion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO LEGION
 */
public class ModeloProducto extends ModeloConexion implements InterfaceGestion<Producto> {

    @Override
    public Boolean crear(Producto pro) {

        boolean msm;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("INSERT INTO `producto` "
                    + "(`pro_nombre`, `pro_stock`, `pro_precio`) "
                    + "VALUES (?, ?, ?)");
            st.setString(1, pro.getNombreProducto());
            st.setInt(2, pro.getStockProducto());
            st.setDouble(3, pro.getPrecioProducto());
            st.execute();
            msm = true;
        } catch (SQLException e) {
            msm = false;
            Logger.getLogger(ModeloProducto.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }
        return msm;
    }

    @Override
    public Boolean modificar(Producto pro) {

        boolean msm;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("UPDATE `producto` SET "
                    + "`pro_nombre` = ?, "
                    + "`pro_stock` = ?, "
                    + "`pro_precio` = ? "
                    + "WHERE (pro_id = ?);");
            st.setString(1, pro.getNombreProducto());
            st.setInt(2, pro.getStockProducto());
            st.setDouble(3, pro.getPrecioProducto());
            st.setInt(4, pro.getIdProducto());
            st.execute();
            msm = true;
        } catch (SQLException e) {
            msm = false;
            Logger.getLogger(ModeloProducto.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }
        return msm;
    }

    @Override
    public Boolean eliminar(Producto pro) {
        boolean msm;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("DELETE FROM `producto` WHERE (`pro_id`= ?)");
            st.setInt(1, pro.getIdProducto());
            st.execute();
            msm = true;
        } catch (SQLException e) {
            msm = false;
            Logger.getLogger(ModeloProducto.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }
        return msm;
    }

    @Override
    public ArrayList<Producto> buscar() {
        ArrayList<Producto> listaProducto = new ArrayList<>();
        Producto producto;

        try {
            this.Conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM producto");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                producto = new Producto();

                producto.setIdProducto(rs.getInt(1));
                producto.setNombreProducto(rs.getString(2));
                producto.setStockProducto(rs.getInt(3));
                producto.setPrecioProducto(rs.getDouble(4));

                listaProducto.add(producto);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloCliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }

        return listaProducto;
    }

    @Override
    public Producto buscarId(int id) {
        Producto producto = null;

        try {
            this.Conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM producto WHERE pro_id = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                producto = new Producto();

                producto.setIdProducto(rs.getInt(1));
                producto.setNombreProducto(rs.getString(2));
                producto.setStockProducto(rs.getInt(3));
                producto.setPrecioProducto(rs.getDouble(4));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloCliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }

        return producto;
    }

}
