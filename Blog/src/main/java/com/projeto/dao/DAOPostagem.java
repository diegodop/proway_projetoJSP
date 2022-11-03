package com.projeto.dao;

import com.projeto.entidades.Comentario;
import com.projeto.entidades.Postagem;
import com.projeto.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOPostagem {

    public static List<Postagem> postagens = new ArrayList<Postagem>();

    public static List<Postagem> consultarUltimasDez(){

        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM postagens ORDER BY id DESC LIMIT 10");
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                Postagem p = new Postagem();
                p.setId(rs.getInt("id"));
                p.setTitulo(rs.getString("titulo"));
                p.setTexto(rs.getString("texto"));
                p.setDatahora(rs.getTimestamp("datahora"));
                p.setIdUsuario(rs.getInt("usuarios_id"));
                lista.add(p);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public static List<Postagem> consultar(){

        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM postagens ORDER BY id DESC");
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                Postagem p = new Postagem();
                p.setId(rs.getInt("id"));
                p.setTitulo(rs.getString("titulo"));
                p.setTexto(rs.getString("texto"));
                p.setDatahora(rs.getTimestamp("datahora"));
                p.setIdUsuario(rs.getInt("usuarios_id"));
                lista.add(p);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public static Postagem consultarPost(int id){

        Connection con = Conexao.conectar();
        Postagem p = new Postagem();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM postagens WHERE id = " + id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                p.setId(rs.getInt("id"));
                p.setTitulo(rs.getString("titulo"));
                p.setTexto(rs.getString("texto"));
                p.setDatahora(rs.getTimestamp("datahora"));
                p.setIdUsuario(rs.getInt("usuarios_id"));
                return p;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return p;
    }

    public static String excluir(int id){
        Connection con = Conexao.conectar();
        String sql = "DELETE FROM postagens WHERE id = " + id;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Postagem excluída com sucesso.";
    }

    public static String salvar(Postagem postagem){
        Connection con = Conexao.conectar();
        String sql = "INSERT INTO postagens (titulo, texto, usuarios_id) VALUES (?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1,postagem.getTitulo());
            stm.setString(2,postagem.getTexto());
            stm.setInt(3,postagem.getIdUsuario());
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Postagem cadastrada com sucesso.";
    }

    public static String alterar(Postagem postagem){
        Connection con = Conexao.conectar();
        String sql = "UPDATE postagens SET titulo = ?, texto = ? WHERE id = " + postagem.getId();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1,postagem.getTitulo());
            stm.setString(2,postagem.getTexto());
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Postagem alterada com sucesso.";
    }

}
