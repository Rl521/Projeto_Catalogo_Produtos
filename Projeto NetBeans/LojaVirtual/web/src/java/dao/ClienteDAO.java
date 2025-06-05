package dao;

import model.Cliente;
import util.ConectaDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    public boolean inserir(Cliente c) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "INSERT INTO cliente (id, nome, email, telefone) VALUES (" +
                         c.getId() + ", '" + c.getNome() + "', '" + c.getEmail() + "', '" + c.getTelefone() + "')";
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir cliente: " + ex.getMessage());
            return false;
        }
    }

    public boolean atualizar(Cliente c) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "UPDATE cliente SET nome='" + c.getNome() +
                         "', email='" + c.getEmail() +
                         "', telefone='" + c.getTelefone() +
                         "' WHERE id=" + c.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar cliente: " + ex.getMessage());
            return false;
        }
    }

    public boolean excluir(Cliente c) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "DELETE FROM cliente WHERE id=" + c.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir cliente: " + ex.getMessage());
            return false;
        }
    }

    public List<Cliente> consultar() throws ClassNotFoundException {
        List<Cliente> lista = new ArrayList<>();
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM cliente");
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setEmail(rs.getString("email"));
                c.setTelefone(rs.getString("telefone"));
                lista.add(c);
            }
            return lista.isEmpty() ? null : lista;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex.getMessage());
            return null;
        }
    }

    public Cliente buscarPorId(int id) throws ClassNotFoundException {
        Cliente cliente = null;
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM cliente WHERE id = " + id);
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setTelefone(rs.getString("telefone"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar cliente por ID: " + ex.getMessage());
        }
        return cliente;
    }
}