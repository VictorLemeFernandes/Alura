package evitandoSQL_Injection;

import comandosSQL_no_Java.ConnectionFactory;

import java.sql.*;

public class TestaInsercaoComParametro {
    public static void main(String[] args) throws SQLException {
        ConnectionFactory factory = new ConnectionFactory();
        try(Connection connection = factory.recuperarConexao()) {

            connection.setAutoCommit(false);

            // com o stm dentro do () do try ele faz o .close automaticamente
            try (PreparedStatement stm = connection.prepareStatement("INSERT INTO PRODUTO (NOME, DESCRICAO) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {

                adicionarVariavel("SmartTV", "45 polegadas", stm);
                adicionarVariavel("Rádio", "Rádio de bateria", stm);

                connection.commit(); // quando as duas transacoes estiverem ok, ele completa a operacao
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("ROLLBACK EXECUTADO");
                connection.rollback();
            }
        }
    }

    private static void adicionarVariavel(String nome, String descricao, PreparedStatement stm) throws SQLException {
        stm.setString(1, nome);
        stm.setString(2, descricao);

        if (nome.equals("Rádio")) {
            throw new RuntimeException("Não foi possível adicionar o produto.");
        }

        stm.execute();

        try (ResultSet rst = stm.getGeneratedKeys()) {
            while (rst.next()) {
                int id = rst.getInt(1);
                System.out.println("O id criado foi: " + id);
            }
        }
    }
}
