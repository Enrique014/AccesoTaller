
package accesotaller;

public class Horario {
    public int id;
    public String HoraEntrada;
    public String HoraSalida;
    

    public Horario(int id, String HoraEntrada, String HoraSalida, String Dia) {
        this.id = id;
        this.HoraEntrada = HoraEntrada;
        this.HoraSalida = HoraSalida;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoraEntrada() {
        return HoraEntrada;
    }

    public void setHoraEntrada(String HoraEntrada) {
        this.HoraEntrada = HoraEntrada;
    }

    public String getHoraSalida() {
        return HoraSalida;
    }

    public void setHoraSalida(String HoraSalida) {
        this.HoraSalida = HoraSalida;
    }

    
}
