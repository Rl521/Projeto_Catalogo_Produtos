
package dao;

import model.Fornecedor;
import util.ConectaDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FornecedorDAO {

    public boolean inserir(Fornecedor f) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "INSERT INTO fornecedor (id, nome, telefone, email) VALUES (" +
                         f.getId() + ", '" + f.getNome() + "', '" + f.getTelefone() + "', '" + f.getEmail() + "')";
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir fornecedor: " + ex.getMessage());
            return false;
        }
    }

    public boolean atualizar(Fornecedor f) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "UPDATE fornecedor SET nome='" + f.getNome() +
                         "', telefone='" + f.getTelefone() +
                         "', email='" + f.getEmail() +
                         "' WHERE id=" + f.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar fornecedor: " + ex.getMessage());
            return false;
        }
    }

    public boolean excluir(Fornecedor f) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "DELETE FROM fornecedor WHERE id=" + f.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir fornecedor: " + ex.getMessage());
            return false;
        }
    }

    public List<Fornecedor> consultar() throws ClassNotFoundException {
        List<Fornecedor> lista = new ArrayList<>();
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM fornecedor");
            while (rs.next()) {
                Fornecedor f = new Fornecedor();
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setTelefone(rs.getString("telefone"));
                f.setEmail(rs.getString("email"));
                lista.add(f);
            }
            return lista.isEmpty() ? null : lista;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex.getMessage());
            return null;
        }
    }
}

