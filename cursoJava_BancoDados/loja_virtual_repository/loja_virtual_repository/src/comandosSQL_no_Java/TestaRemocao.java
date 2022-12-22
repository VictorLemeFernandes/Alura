package comandosSQL_no_Java;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TestaRemocao {
    public static void main(String[] args) throws SQLException {
        ConnectionFactory factory = new ConnectionFactory();
        Connection conn = factory.recuperarConexao();

        Statement stm = conn.createStatement();
        stm.execute("DELETE FROM PRODUTO WHERE NOME = 'MOUSE'");

        int linhasApagadas = stm.getUpdateCount(); // mostra quantas linhas foram modificadas

        System.out.println("Quantidade de linhas que foram modificadas: " + linhasApagadas);
    }
}
