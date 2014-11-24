package classes;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ldiez
 */
public class Paqtur {
    int codigo;
    String nombre;
    String descripcion;
    String horario;
    int precio;
    
    public int getCodigo() {
            return codigo;
    }
    public void setCodigo(int codigo) {
            this.codigo = codigo;
    }
    
    public String getNombre() {
            return nombre;
    }
    public void setNombre(String nombre) {
            this.nombre = nombre;
    }
    
    public String getDescripcion() {
            return descripcion;
    }
    public void setDescripcion(String descripcion) {
            this.descripcion = descripcion;
    }
    
    public String getHorario() {
            return horario;
    }
    public void setHorario(String horario) {
            this.horario = horario;
    }
    
    public double getPrecio() {
            return precio;
    }
    public void setPrecio(int precio) {
            this.precio = precio;
    }
}