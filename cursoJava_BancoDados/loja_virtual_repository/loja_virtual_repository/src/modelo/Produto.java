package modelo;

public class Produto {

    public Produto(String nome, String descricao) {
        this.nome = nome;
        this.descricao = descricao;
    }

    private int id;
    private String nome;
    private String descricao;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return String.format("O produto criado foi: %d, %s, %s", this.id, this.nome, this.descricao);
    }
}
