/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author ldiez
 */
public class Turista {
    String nombres, apellidos, tipo_doc, nro_doc, nacionalidad;
    int edad;
    
    public String getNombres() {
            return nombres;
    }
    public void setNombres(String nombres) {
            this.nombres = nombres;
    }
    
    public String getApellidos() {
            return apellidos;
    }
    public void setApellidos(String apellidos) {
            this.apellidos = apellidos;
    }
    
    public String getTipodoc() {
            return tipo_doc;
    }
    public void setTipodoc(String tipo_doc) {
            this.tipo_doc = tipo_doc;
    }
    
    public String getNrodoc() {
            return nro_doc;
    }
    public void setNrodoc(String nro_doc) {
            this.nro_doc = nro_doc;
    }
    
    public String getNacionalidad() {
            return nacionalidad;
    }
    public void setNacionalidad(String nacionalidad) {
            this.nacionalidad = nacionalidad;
    }
    
    public int getEdad() {
            return edad;
    }
    public void setEdad(int edad) {
            this.edad = edad;
    }
}
