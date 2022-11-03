package com.projeto.entidades;

import java.sql.Timestamp;

public class Postagem  {

    private int id;
    private String titulo;
    private String texto;
    private Timestamp datahora;
    private int idUsuario;

    public Postagem() {
    }

    public Postagem(int id, String titulo, String texto, Timestamp datahora, int idUsuario) {
        this.id = id;
        this.titulo = titulo;
        this.texto = texto;
        this.datahora = datahora;
        this.idUsuario = idUsuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Timestamp getDatahora() {
        return datahora;
    }

    public void setDatahora(Timestamp datahora) {
        this.datahora = datahora;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
