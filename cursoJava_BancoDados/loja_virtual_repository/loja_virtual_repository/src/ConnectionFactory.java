import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/*
* Nessa classe eu faco o encapsulamento da criacao de conexao do BD.
* */
public class ConnectionFactory {
    public Connection recuperarConexao() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:mysql://localhost/loja_virtual?useTimezone=true&serverTimezone=UTC",
                "root",
                "root"
        );
    }
}
