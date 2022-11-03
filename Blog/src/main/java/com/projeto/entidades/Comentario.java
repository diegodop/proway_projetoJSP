package com.projeto.entidades;

import java.util.Date;

public class Comentario {

    private int id;
    private String texto;
    private Date datahora;
    private boolean ativo;
    private int idPostagem;
    private int idUsuario;

    public Comentario() {
    }

    public Comentario(int id, String texto, Date datahora, boolean ativo, int idPostagem, int idUsuario) {
        this.id = id;
        this.texto = texto;
        this.datahora = datahora;
        this.ativo = ativo;
        this.idPostagem = idPostagem;
        this.idUsuario = idUsuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Date getDatahora() {
        return datahora;
    }

    public void setDatahora(Date datahora) {
        this.datahora = datahora;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    public int getIdPostagem() {
        return idPostagem;
    }

    public void setIdPostagem(int idPostagem) {
        this.idPostagem = idPostagem;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
