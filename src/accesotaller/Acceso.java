package accesotaller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Acceso {

    static Conexion cn;

    public static void Guardar(Estudiante estudiante, int[] idHorario) throws SQLException, ClassNotFoundException {

        cn = new Conexion();
        PreparedStatement query = null;

        cn.st.executeUpdate("INSERT INTO Estudiante VALUES ('" + estudiante.getCarnet() + "', '" + estudiante.getNombre() + "', '" + estudiante.getContraseña() + "')");

        for (int i = 0; i < idHorario.length; i++) {
            if (idHorario[i] == 0) {

            } else {

                cn.st.executeUpdate("INSERT INTO HorariosEstudiante VALUES('" + estudiante.getCarnet()
                        + "', '" + idHorario[i] + "')");

            }
        }
    }

    public static String ObtenerContraseña(String carnet) throws SQLException, ClassNotFoundException {

        cn = new Conexion();
        ResultSet rs = cn.st.executeQuery("SELECT Contraseña FROM Estudiante WHERE Carnet = '" + carnet + "'");

        while (rs.next()) {
            return rs.getString("Contraseña");
        }

        return "";
    }

    public static int Count() throws SQLException, ClassNotFoundException {
        cn = new Conexion();

        ResultSet rs = cn.st.executeQuery("SELECT COUNT(*) FROM Ingresos");
        while (rs.next()) {
            return rs.getInt(1);
        }

        return 0;

    }

    public static void Ingresar(String carnet, int id) throws SQLException, ClassNotFoundException {
        cn = new Conexion();

        cn.st.executeUpdate("INSERT INTO Ingresos VALUES ('" + carnet + "', '" + id + "', CURDATE())");

    }

    public static ArrayList<ArrayList<Object>> BuscarCarnet(String Carnet) throws SQLException, ClassNotFoundException {
        ArrayList<ArrayList<Object>> lista = new ArrayList<>();
        ArrayList<Object> lista2 = new ArrayList<>();
        cn = new Conexion();
        ResultSet rs = cn.st.executeQuery("SELECT Estudiante.Carnet, Estudiante.Nombre, Horario.HoraEntrada, Horario.HoraSalida, Ingresos.Fecha,\n"
                + "ELT(WEEKDAY(Ingresos.Fecha)+1, 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo') AS Dia\n"
                + "FROM Estudiante, Horario, Ingresos, HorariosEstudiante \n"
                + "WHERE '" + Carnet + "' = Ingresos.Carnet \n"
                + "AND HorariosEstudiante.Carnet = '" + Carnet + "' \n"
                + "AND Estudiante.Carnet = '" + Carnet + "' \n"
                + "AND Horario.idHorario = HorariosEstudiante.idHorario");
        while (rs.next()) {
            for (int i = 1; i < 7; i++) {
                lista2.add(rs.getObject(i));
            }
            lista.add(lista2);
        }
        return lista;
    }
}
