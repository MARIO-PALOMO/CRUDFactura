package Interfaces;

import java.util.ArrayList;

public interface InterfaceGestion <T>{

    Boolean crear(T obj);

    Boolean modificar(T obj);

    Boolean eliminar(T obj);

    ArrayList<T> buscar();

    T buscarId(int id);

}
