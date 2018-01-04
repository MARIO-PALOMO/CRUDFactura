/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Cliente;
import Modelo.ModeloCliente;
import java.util.ArrayList;
import Interfaces.InterfaceGestion;

public class ControladorCliente implements InterfaceGestion<Cliente> {

    @Override
    public Boolean crear(Cliente obj) {
        ModeloCliente modeloCliente = new ModeloCliente();
        return modeloCliente.crear(obj);
    }

    @Override
    public Boolean modificar(Cliente obj) {
        ModeloCliente modeloCliente = new ModeloCliente();
        return modeloCliente.modificar(obj);
    }

    @Override
    public Boolean eliminar(Cliente obj) {
        ModeloCliente modeloCliente = new ModeloCliente();
        return modeloCliente.eliminar(obj);
    }

    @Override
    public ArrayList<Cliente> buscar() {
        ModeloCliente modeloCliente = new ModeloCliente();
        return modeloCliente.buscar();
    }

    @Override
    public Cliente buscarId(int id) {
        ModeloCliente modeloCliente = new ModeloCliente();
        return modeloCliente.buscarId(id);
    }

}
