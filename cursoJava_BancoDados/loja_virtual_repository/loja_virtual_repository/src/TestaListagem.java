import java.sql.*;

public class TestaListagem {
    public static void main(String[] args) throws SQLException {
        Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/loja_virtual?useTimezone=true&serverTimezone=UTC",
                "root",
                "root"
        );

        /* Statement faz as consultas SQLs */
        Statement stm = connection.createStatement();
        stm.execute("SELECT ID, NOME, DESCRICAO FROM PRODUTO"); // retorna um boolean

        /* ResultSet faz eu ter acesso aos dados */
        ResultSet rst = stm.getResultSet();

        // enquanto tiver mais uma linha ele fica repetindo no laco e mostrando os dados
        while (rst.next()) {
            int id = rst.getInt("ID");
            System.out.println(id);
            String nome = rst.getString("NOME");
            System.out.println(nome);
            String descricao = rst.getString("DESCRICAO");
            System.out.println(descricao);
        }

        connection.close(); // fecha conexao
    }
}
