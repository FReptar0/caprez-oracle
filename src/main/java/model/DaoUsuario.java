package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario {

    Connection con;
    Conexion cn = new Conexion();

    PreparedStatement ps, ps2, ps3, ps4, ps5;
    ResultSet rs, rs2, rs3, rs4, rs5;
    int buscador, buscador4, buscador5;

    public int validar(String usuario, String contrasena) {
        String query= "SELECT COUNT(*) AS sesion FROM ADMINISTRADORES WHERE USER_ADMIN=? AND PASS_ADMIN=? AND ESTADO  = 1";
        String query2="UPDATE ADMINISTRADORES SET INTENTOS = 0 WHERE USER_ADMIN = ?"; /* Setteamos los intentos a 0 */
        String query3="UPDATE ADMINISTRADORES SET INTENTOS = INTENTOS + 1 WHERE USER_ADMIN = ?"; /* Sumamos 1 a los intentos */
        String query4="SELECT COUNT(*) FROM ADMINISTRADORES WHERE USER_ADMIN = ? AND INTENTOS >= 5"; /* Verificamos si los intentos son mayores o iguales a 3 */
        String query5= "SELECT COUNT(*) AS admin FROM ADMINISTRADORES WHERE USER_ADMIN=? AND PASS_ADMIN=? AND ESTADO= 1 AND ROL_ADMIN= 1";  /* Verificamos si es un superAdministrador */

        try{
            con=cn.getConnection();
            ps=con.prepareStatement(query);
            ps.setString(1, usuario);
            ps.setString(2, contrasena);
            rs=ps.executeQuery();

        while(rs.next()){
            buscador=rs.getInt("sesion");
        }
        int tipoAdmin=-1;
        if(buscador==1){ /* Admin normal */
            System.out.println("Usuario y contraseña correctos"); /* Si el usuario y contraseña son correctos, setteamos los intentos a 0 e iniciamos sesión*/
            System.out.println("condición de usuario normal complida, mucho ojo");
            ps2=con.prepareStatement(query2);
            ps2.setString(1, usuario);
            ps2.executeUpdate();
            /* ---- */

            ps5=con.prepareStatement(query5); /* Verificamos si es un superAdministrador */
            ps5.setString(1, usuario);
            ps5.setString(2, contrasena);
            rs5=ps5.executeQuery();
            while(rs5.next()){
                tipoAdmin = rs5.getInt("admin");
                buscador5=1;
            }
            if(tipoAdmin==1){ /* Si es un superAdministrador */
                System.out.println("Usuario y contraseña correctos de SuperAdministrador");
                return 6;
            }else{
                System.out.println("Usuario y contraseña correctos de adminisrtador");
                return 1;
            }

        }else{
            System.out.println("Usuario y/o contraseña incorrectos"); /* Si el usuario y/o contraseña son incorrectos, sumamos 1 a los intentos */
            ps3=con.prepareStatement(query3);
            ps3.setString(1, usuario);
            ps3.executeUpdate();
            ps4=con.prepareStatement(query4);
            ps4.setString(1, usuario);
            rs4=ps4.executeQuery();
            while(rs4.next()){
                buscador4=rs4.getInt(1);
            }
            if(buscador4==1){
                System.out.println("Usuario bloqueado"); /* Si los intentos son mayores o iguales a 3, bloqueamos el usuario */
                buscador4=5;
                return buscador4;
            }else{
                return buscador;
            }
        }
    } catch (SQLException e) {
        System.out.println("ERROR"+e);
        return buscador;
    }
    }

    public void bloquear(String usuario) {
        String query = "UPDATE ADMINISTRADORES SET ESTADO = 0 WHERE USER_ADMIN=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, usuario);

            ps.executeUpdate();
            System.out.println("Usuario bloqueado");
        } catch (SQLException e) {
            System.out.println("Algo salió mal al bloquear el usuario");
            System.out.println("ERROR" + e);
        }
    }
}