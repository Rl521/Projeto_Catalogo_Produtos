package model;

import java.util.Date;

public class Pedido {
    private int id;
    private Cliente cliente;
    private Date data;
    private double total;

    public Pedido() {
    }

    public Pedido(int id, Cliente cliente, Date data, double total) {
        this.id = id;
        this.cliente = cliente;
        this.data = data;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
