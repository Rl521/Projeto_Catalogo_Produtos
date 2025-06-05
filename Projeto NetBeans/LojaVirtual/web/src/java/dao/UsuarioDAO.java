package dao;

import model.Usuario;
import util.ConectaDB;
import java.sql.*;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public boolean inserir(Usuario usuario) throws ClassNotFoundException {
        String sql = "INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?)";
        try (Connection conexao = ConectaDB.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, md5(usuario.getSenha()));
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir usuário: " + ex.getMessage());
            return false;
        }
    }

    public static String md5(String senha) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] array = md.digest(senha.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (byte b : array) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();
        } catch (Exception e) {
            return null;
        }
    }

    public Usuario autenticar(String email, String senha) throws ClassNotFoundException {
        String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
        try (Connection conexao = ConectaDB.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, md5(senha));
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                return usuario;
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao autenticar usuário: " + ex.getMessage());
        }
        return null;
    }

    public List<Usuario> consultar() throws ClassNotFoundException {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario ORDER BY nome";
        try (Connection conexao = ConectaDB.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                // Não inclua a senha por segurança
                lista.add(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar usuários: " + ex.getMessage());
        }
        return lista;
    }

    public boolean atualizar(Usuario usuario) throws ClassNotFoundException {
        String sql = "UPDATE usuario SET nome = ?, email = ? WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setInt(3, usuario.getId());
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar usuário: " + ex.getMessage());
            return false;
        }
    }

    public boolean excluir(Usuario usuario) throws ClassNotFoundException {
        String sql = "DELETE FROM usuario WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar();
            PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setInt(1, usuario.getId());
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir usuário: " + ex.getMessage());
            return false;
        }
    }
}