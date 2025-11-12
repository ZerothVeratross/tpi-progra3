using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    
    public class DaoMedico
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaMedicos(string legajo, string nombre, string apellido, string dia, string especialidad)
        {
            string consulta = "SELECT m.Nro_Legajo_M AS Legajo, m.Dni_M AS DNI, m.Nombre_M AS Nombre, m.Apellido_M AS Apellido, " +
                "m.Sexo_M AS Sexo, m.Nacionalidad_M AS Nacionalidad, m.Fecha_Nacimiento_M AS Nacimiento, m.Direccion_M AS Direccion, " +
                "l.Descripcion_L AS Localidad, p.Descripcion_P AS Provincia, m.Correo_Electronico_M AS Correo, m.Telefono_M AS Telefono, " +
                "e.Descripcion_E AS Especialidad " +
                "FROM MEDICOS m INNER JOIN LOCALIDADES l ON m.Id_Localidad_M = l.Id_Localidad " +
                "INNER JOIN PROVINCIAS p ON p.Id_Provincia = l.Id_Provincia_L " +
                "INNER JOIN ESPECIALIDADES e ON m.Id_Especialidad_M = e.ID_Especialidad " +
                "LEFT JOIN HORARIO_MEDICOS h ON m.Nro_Legajo_M = h.Nro_Legajo_HM " +
                "WHERE ";
            DataTable tabla = new DataTable();
            
            if (legajo.Length > 0){consulta += "m.Nro_Legajo_M = '" + legajo + "'";}
            if (nombre.Length > 0) {
                if (consulta[consulta.Length - 1] != ' '){consulta += ", ";}
                consulta += "m.Nombre_M = '" + nombre + "'";
            }
            if (apellido.Length > 0) {
                if (consulta[consulta.Length - 1] != ' '){consulta += ", ";}
                consulta += "m.Apellido_M = '" + apellido + "'";
            }
            if (especialidad.Length > 0) {
                if (consulta[consulta.Length - 1] != ' '){consulta += ", ";}
                consulta += "e.Descripcion_E = '" + especialidad + "'";
            }
            if (dia.Length > 0) {
                if (consulta[consulta.Length - 1] != ' '){consulta += ", ";}
                consulta += "h.Id_Dia_HM = '" + dia + "'";
            }
            //si no se especificó ningún filtro, borra el WHERE al final de la consulta
            if (consulta[consulta.Length - 1] == ' '){consulta = consulta.Remove(consulta.Length - 7, 6);}
            
            tabla = datos.CrearTabla("Medico", consulta);
            return tabla;
        }

        public SqlDataReader getMedicoUsuario(string usuario, string contrasenia)
        {
            SqlCommand command = new SqlCommand();

            datos.PrepararConsulta(command, "Select Nro_Legajo_M, Dni_M, Nombre_M, Apellido_M, Sexo_M, Nacionalidad_M, Fecha_Nacimiento_M, Direccion_M,Id_Localidad_M, Correo_Electronico_M, Telefono_M, Id_Especialidad_M, Usuario_M, Contrasenia_M, Estado_M From MEDICOS where Usuario_M = @usuario AND Contrasenia_M = @contra");
            datos.PrepararParametro(command, "@usuario", usuario);
            datos.PrepararParametro(command, "@contra", contrasenia);
            SqlDataReader reader = datos.EjecutarLectura(command);
            return reader;

        }
        public bool VerificarCorreo(string email, Medico medico)
        {

            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT Nro_Legajo_M FROM MEDICOS WHERE Correo_Electronico_M = @email");
                datos.setearParametro("@email", email);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    medico.setLegajo((string)(datos.Lector["Nro_Legajo_M"]));
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
        }

        public bool CambiarContrasenia(string pass, Medico medico)
        {
            try
            {
                datos.openConexion();
                datos.setearConsulta("UPDATE MEDICOS SET Contrasenia_M = @pass WHERE Nro_Legajo_M = @legajo");
                datos.setearParametro("@pass", pass);
                datos.setearParametro("@legajo", medico.getLegajo());
                if (datos.ejecutarAccion() == 1)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }

        }
    }
}
