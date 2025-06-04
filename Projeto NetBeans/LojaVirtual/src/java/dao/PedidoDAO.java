
package dao;

import model.Pedido;
import model.Cliente;
import util.ConectaDB;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {

    public boolean inserir(Pedido p) throws ClassNotFoundException, SQLException {
    Connection conexao = null;
    Statement stmt = null;
    try {
        conexao = ConectaDB.conectar();
        stmt = conexao.createStatement();
        String sql = "INSERT INTO pedido (clienteId, data, total) VALUES (" +
                     p.getCliente().getId() + ", '" +
                     new java.sql.Date(p.getData().getTime()) + "', " +
                     p.getTotal() + ")";
        stmt.executeUpdate(sql);
        return true;
    } finally {
        if(stmt != null) stmt.close();
        if(conexao != null) conexao.close();
    }


}


    public boolean atualizar(Pedido p) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "UPDATE pedido SET clienteId=" + p.getCliente().getId() +
                         ", data='" + p.getData() +
                         "', total=" + p.getTotal() +
                         " WHERE id=" + p.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar pedido: " + ex.getMessage());
            return false;
        }
    }

    public boolean excluir(Pedido p) throws ClassNotFoundException {
        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
            String sql = "DELETE FROM pedido WHERE id=" + p.getId();
            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir pedido: " + ex.getMessage());
            return false;
        }
    }

    public List<Pedido> consultar() throws ClassNotFoundException {
    List<Pedido> lista = new ArrayList<>();
    String sql = "SELECT p.id, p.data, p.total, c.id AS cliente_id, c.nome AS cliente_nome " +
                 "FROM pedido p JOIN cliente c ON p.clienteId = c.id";

    try (Connection conexao = ConectaDB.conectar();
         PreparedStatement stmt = conexao.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            Pedido p = new Pedido();
            p.setId(rs.getInt("id"));
            p.setData(rs.getDate("data"));
            p.setTotal(rs.getDouble("total"));

            Cliente c = new Cliente();
            c.setId(rs.getInt("cliente_id"));
            c.setNome(rs.getString("cliente_nome"));
            p.setCliente(c);
            lista.add(p);
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
            cliente.setTelefone(rs.getString("telefone"));
            cliente.setEmail(rs.getString("email"));
        }
    } catch (SQLException ex) {
        System.out.println("Erro ao buscar cliente por ID: " + ex.getMessage());
    }
    return cliente;
}
    
    public Pedido consultarPorId(int id) throws ClassNotFoundException {
    Pedido pedido = null;
    String sql = "SELECT p.id, p.data, p.total, c.id AS cliente_id, c.nome AS cliente_nome " +
                 "FROM pedido p JOIN cliente c ON p.clienteId = c.id WHERE p.id = " + id;

    try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("cliente_id"));
            cliente.setNome(rs.getString("cliente_nome"));

            pedido = new Pedido();
            pedido.setId(rs.getInt("id"));
            pedido.setData(rs.getDate("data"));
            pedido.setTotal(rs.getDouble("total"));
            pedido.setCliente(cliente);
        }
    } catch (SQLException ex) {
        System.out.println("Erro ao consultar pedido por ID: " + ex.getMessage());
    }
    return pedido;
}

}

