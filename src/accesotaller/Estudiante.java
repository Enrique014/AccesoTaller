
package accesotaller;

public class Estudiante {
    private String carnet;
    private String contraseña;
    private String Nombre;
    
    public Estudiante(){
    }
    
    public Estudiante(String carnet, String contraseña, String Nombre) {
        this.carnet = carnet;
        this.contraseña = contraseña;
        this.Nombre = Nombre;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getCarnet() {
        return carnet;
    }

    public String getContraseña() {
        return contraseña;
    }

    public String getNombre() {
        return Nombre;
    }
    
    
    
}
