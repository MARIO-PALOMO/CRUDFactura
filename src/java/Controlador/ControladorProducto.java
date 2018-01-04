/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Clases.Producto;
import Interfaces.InterfaceGestion;
import Modelo.ModeloProducto;
import java.util.ArrayList;

/**
 *
 * @author LENOVO LEGION
 */
public class ControladorProducto implements InterfaceGestion<Producto> {

    @Override
    public Boolean crear(Producto obj) {
        ModeloProducto modeloProducto = new ModeloProducto();
        return modeloProducto.crear(obj);
    }

    @Override
    public Boolean modificar(Producto obj) {
        ModeloProducto modeloProducto = new ModeloProducto();
        return modeloProducto.modificar(obj);
    }

    @Override
    public Boolean eliminar(Producto obj) {
        ModeloProducto modeloProducto = new ModeloProducto();
        return modeloProducto.eliminar(obj);
    }

    @Override
    public ArrayList<Producto> buscar() {
        ModeloProducto modeloProducto = new ModeloProducto();
        return modeloProducto.buscar();
    }

    @Override
    public Producto buscarId(int id) {
        ModeloProducto modeloProducto = new ModeloProducto();
        return modeloProducto.buscarId(id);
    }

}
