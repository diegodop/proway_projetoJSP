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

public class DAOComentario {

    public static String salvar(Comentario comentario){
        Connection con = Conexao.conectar();
        String sql = "INSERT INTO comentarios (texto, postagens_id, usuarios_id) VALUES (?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1,comentario.getTexto());
            stm.setInt(2,comentario.getIdPostagem());
            stm.setInt(3,comentario.getIdUsuario());
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Registro inserido com sucesso.";
    }

    public static List<Comentario> listarComentariosAtivosPorPost(int idPostagem){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM comentarios WHERE ativo = 1 AND postagens_id = " + idPostagem);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Comentario c = new Comentario();
                c.setId(rs.getInt("id"));
                c.setTexto(rs.getString("texto"));
                c.setDatahora(rs.getTimestamp("datahora"));
                c.setIdPostagem(rs.getInt("postagens_id"));
                c.setIdUsuario(rs.getInt("usuarios_id"));
                lista.add(c);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public static List<Comentario> listarComentariosInativos(){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM comentarios WHERE ativo = 0");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Comentario c = new Comentario();
                c.setId(rs.getInt("id"));
                c.setTexto(rs.getString("texto"));
                c.setDatahora(rs.getTimestamp("datahora"));
                c.setIdPostagem(rs.getInt("postagens_id"));
                c.setIdUsuario(rs.getInt("usuarios_id"));
                lista.add(c);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public static String aprovar(int id){
        Connection con = Conexao.conectar();
        String sql = "UPDATE comentarios SET ativo = ? WHERE id = " + id;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setBoolean(1,true);
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Comentário aprovado com sucesso.";
    }

    public static String rejeitar(int id){
        Connection con = Conexao.conectar();
        String sql = "DELETE FROM comentarios WHERE id = " + id;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Comentário rejeitado com sucesso.";
    }
}
