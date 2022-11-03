package com.projeto.dao;

import com.projeto.entidades.Usuario;
import com.projeto.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOUsuario {

    public static Usuario localizarUsuario(int id){
        Connection con = Conexao.conectar();
        Usuario u = new Usuario();
        try {
            PreparedStatement stm = con.prepareStatement("select * from usuarios where id = " + id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setSenha(rs.getString("senha"));
                u.setModerador(rs.getBoolean("moderador"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return u;
    }

    public static Usuario localizarUsuarioPorEmail(String email){
        Connection con = Conexao.conectar();
        Usuario u = new Usuario();
        try {
            PreparedStatement stm = con.prepareStatement("select * from usuarios where email = '" + email + "'");
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setSenha(rs.getString("senha"));
                u.setModerador(rs.getBoolean("moderador"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return u;
    }

    public static boolean verificarEmailCadastrado(String email){
        Connection con = Conexao.conectar();
        Usuario u = new Usuario();
        try {
            PreparedStatement stm = con.prepareStatement("select * from usuarios where email = '" + email + "'");
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public static boolean salvar(Usuario usuario){
        Connection con = Conexao.conectar();
        String sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1,usuario.getNome());
            stm.setString(2,usuario.getEmail());
            stm.setString(3,usuario.getSenha());
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public static Usuario logar(String email, String senha){
        Connection con = Conexao.conectar();
        Usuario usuario = new Usuario();
        try {
            PreparedStatement stm = con.prepareStatement("select * from usuarios where email = ? and senha = ?");
            stm.setString(1,email);
            stm.setString(2,senha);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setModerador(rs.getBoolean("moderador"));
                return usuario;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
