/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Cliente;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Interfaces.InterfaceGestion;
import java.sql.ResultSet;

public class ModeloCliente extends ModeloConexion implements InterfaceGestion<Cliente> {

    @Override
    public Boolean crear(Cliente cli) {
        boolean msm;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("INSERT INTO `cliente` "
                    + "(`cli_nombre`, `cli_cedula`, `cli_direccion`, `cli_telefono`) "
                    + "VALUES (?, ?, ?, ?)");
            st.setString(1, cli.getNombreCliente());
            st.setString(2, cli.getCedulaCliente());
            st.setString(3, cli.getDireccionCliente());
            st.setString(4, cli.getTelefonoCliente());
            st.execute();
            msm = true;
        } catch (SQLException e) {
            msm = false;
            Logger.getLogger(ModeloCliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }
        return msm;
    }

    @Override
    public Boolean modificar(Cliente cli) {
        boolean msm;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("UPDATE `cliente` SET "
                    + "`cli_nombre` = ?, "
                    + "`cli_cedula` = ?, "
                    + "`cli_direccion` = ?, "
                    + "`cli_telefono` = ? "
                    + "WHERE (cli_id = ?);");
            st.setString(1, cli.getNombreCliente());
            st.setString(2, cli.getCedulaCliente());
            st.setString(3, cli.getDireccionCliente());
            st.setString(4, cli.getTelefonoCliente());
            st.setInt(5, cli.getIdCliente());
            st.execute();
            msm = true;
        } catch (SQLException e) {
            msm = false;
            Logger.getLogger(ModeloCliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }
        return msm;
    }

    @Override
    public Boolean eliminar(Cliente cli) {
        boolean msm;
        try {
            this.Conectar();
            PreparedStatement st = this.getCn().prepareStatement("DELETE FROM `cliente` WHERE (`cli_id`= ?)");
            st.setInt(1, cli.getIdCliente());
            st.execute();
            msm = true;
        } catch (SQLException e) {
            msm = false;
            Logger.getLogger(ModeloCliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }
        return msm;
    }

    @Override
    public ArrayList<Cliente> buscar() {
        ArrayList<Cliente> listaCliente = new ArrayList<>();
        Cliente cliente;

        try {
            this.Conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM cliente");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                cliente = new Cliente();

                cliente.setIdCliente(rs.getInt(1));
                cliente.setNombreCliente(rs.getString(2));
                cliente.setCedulaCliente(rs.getString(3));
                cliente.setDireccionCliente(rs.getString(4));
                cliente.setTelefonoCliente(rs.getString(5));

                listaCliente.add(cliente);

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloCliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }

        return listaCliente;
    }

    @Override
    public Cliente buscarId(int idCliente_) {

        Cliente cliente = null;

        try {
            this.Conectar();
            PreparedStatement pst = this.getCn().prepareCall("SELECT * FROM cliente WHERE cli_id = ?");
            pst.setInt(1, idCliente_);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                cliente = new Cliente();

                cliente.setIdCliente(rs.getInt(1));
                cliente.setNombreCliente(rs.getString(2));
                cliente.setCedulaCliente(rs.getString(3));
                cliente.setDireccionCliente(rs.getString(4));
                cliente.setTelefonoCliente(rs.getString(5));

            }

        } catch (SQLException e) {
            Logger.getLogger(ModeloCliente.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            this.Cerrar();
        }

        return cliente;
    }

}
