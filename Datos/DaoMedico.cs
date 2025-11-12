using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    
    public class DaoMedico
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaMedicos()
        {
            DataTable tabla = datos.CrearTabla("Medico", "Select * from Medicos");
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
