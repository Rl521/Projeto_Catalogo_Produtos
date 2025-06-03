package dao;
import model.Produto;
import model.Categoria;
import model.Fornecedor;
import util.ConectaDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {

    public boolean inserir(Produto p) throws ClassNotFoundException {
        String sql = "INSERT INTO produto (nome, descricao, preco, quantidade, categoriaId, fornecedorId) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getDescricao());
            stmt.setDouble(3, p.getPreco());
            stmt.setInt(4, p.getQuantidade());
            stmt.setInt(5, p.getCategoria().getId());
            stmt.setInt(6, p.getFornecedor().getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir produto: " + ex.getMessage());
            return false;
        }
    }

    public boolean atualizar(Produto p) throws ClassNotFoundException {
        String sql = "UPDATE produto SET nome = ?, descricao = ?, preco = ?, quantidade = ?, categoriaId = ?, fornecedorId = ? WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getDescricao());
            stmt.setDouble(3, p.getPreco());
            stmt.setInt(4, p.getQuantidade());
            stmt.setInt(5, p.getCategoria().getId());
            stmt.setInt(6, p.getFornecedor().getId());
            stmt.setInt(7, p.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar produto: " + ex.getMessage());
            return false;
        }
    }

    public boolean excluir(Produto p) throws ClassNotFoundException {
        String sql = "DELETE FROM produto WHERE id = ?";
        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setInt(1, p.getId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir produto: " + ex.getMessage());
            return false;
        }
    }

    public List<Produto> consultar() throws ClassNotFoundException {
        List<Produto> lista = new ArrayList<>();
        String sql = "SELECT * FROM produto";
        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));

                Categoria c = new Categoria();
                c.setId(rs.getInt("categoriaId"));
                p.setCategoria(c);

                Fornecedor f = new Fornecedor();
                f.setId(rs.getInt("fornecedorId"));
                p.setFornecedor(f);

                lista.add(p);
            }
            return lista.isEmpty() ? null : lista;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex.getMessage());
            return null;
        }
    }
}
