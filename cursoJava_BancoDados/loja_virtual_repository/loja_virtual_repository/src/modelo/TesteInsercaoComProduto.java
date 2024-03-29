package modelo;

import comandosSQL_no_Java.ConnectionFactory;

import java.sql.*;

public class TesteInsercaoComProduto {
    public static void main(String[] args) throws SQLException {
        Produto comoda = new Produto("Comoda", "Comoda vertical");

        adicionaProduto(comoda);

        System.out.println(comoda);
    }

    private static void adicionaProduto(Produto comoda) throws SQLException {
        try(Connection connection = new ConnectionFactory().recuperarConexao()) {
            String sql = "INSERT INTO PRODUTO (NOME, DESCRICAO) VALUES (?, ?)";

            try(PreparedStatement pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                pstm.setString(1, comoda.getNome());
                pstm.setString(2, comoda.getDescricao());

                pstm.execute();

                try(ResultSet rst = pstm.getGeneratedKeys()) {
                    while(rst.next()) {
                        comoda.setId(rst.getInt(1));
                    }
                }
            }
        }
    }
}
