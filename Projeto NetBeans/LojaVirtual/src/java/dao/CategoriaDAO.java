
package dao;

import model.Categoria;
import util.ConectaDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    public boolean inserir(Categoria categoria) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement()) {
            String sql = "INSERT INTO categoria (id, nome) VALUES (" + categoria.getId() + ", '" + categoria.getNome() + "')";
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir categoria: " + ex.getMessage());
            return false;
        }
    }

    public boolean atualizar(Categoria categoria) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "UPDATE categoria SET nome='" + categoria.getNome() + "' WHERE id=" + categoria.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar categoria: " + ex.getMessage());
            return false;
        }
    }

    public boolean excluir(Categoria categoria) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "DELETE FROM categoria WHERE id=" + categoria.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir categoria: " + ex.getMessage());
            return false;
        }
    }

    public List consultar() throws ClassNotFoundException {
        List lista = new ArrayList<>();
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM categoria");
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                lista.add(c);
            }
            return lista.isEmpty() ? null : lista;
            
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex.getMessage());
            return null;
        }
    }
}

