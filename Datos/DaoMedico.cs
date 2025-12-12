using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    
    public class DaoMedico
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaMedicos(string legajo, string nombre, string apellido, string dia, string especialidad)
        {
            try
            {
                string consulta = "SELECT DISTINCT m.Nro_Legajo_M AS Legajo, m.Dni_M AS DNI, m.Nombre_M AS Nombre, m.Apellido_M AS Apellido, " +
                "m.Sexo_M AS Sexo, m.Nacionalidad_M AS Nacionalidad, m.Fecha_Nacimiento_M AS Nacimiento, m.Direccion_M AS Direccion, " +
                "l.Descripcion_L AS Localidad, p.Descripcion_P AS Provincia, m.Correo_Electronico_M AS Correo, m.Telefono_M AS Telefono, " +
                "e.Descripcion_E AS Especialidad " +
                "FROM MEDICOS m INNER JOIN LOCALIDADES l ON m.Id_Localidad_M = l.Id_Localidad " +
                "INNER JOIN PROVINCIAS p ON p.Id_Provincia = l.Id_Provincia_L " +
                "INNER JOIN ESPECIALIDADES e ON m.Id_Especialidad_M = e.ID_Especialidad " +
                "LEFT JOIN HORARIO_MEDICOS h ON m.Nro_Legajo_M = h.Nro_Legajo_HM " +
                "WHERE ";

                if (legajo.Length > 0) { consulta += "m.Nro_Legajo_M = '" + legajo + "'"; }
                if (nombre.Length > 0)
                {
                    if (consulta[consulta.Length - 1] != ' ') { consulta += " AND "; }
                    consulta += "m.Nombre_M LIKE '%" + nombre + "%'";
                }
                if (apellido.Length > 0)
                {
                    if (consulta[consulta.Length - 1] != ' ') { consulta += " AND "; }
                    consulta += "m.Apellido_M LIKE '%" + apellido + "%'";
                }
                if (especialidad.Length > 0)
                {
                    if (consulta[consulta.Length - 1] != ' ') { consulta += " AND "; }
                    consulta += "e.Descripcion_E LIKE '%" + especialidad + "%'";
                }
                if (dia.Length > 0)
                {
                    if (consulta[consulta.Length - 1] != ' ') { consulta += " AND "; }
                    consulta += "h.Id_Dia_HM = '" + dia + "'";
                }

                if (consulta[consulta.Length - 1] != ' ') { consulta += " AND "; }
                consulta += "m.Estado_M = 1";
                datos.openConexion();
                datos.setearAdaptador(consulta);
                
                return datos.ejecutarTabla("MEDICOS");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool getMedicoUsuario(Medico medico)
        {
            try
            {
                datos.openConexion();
                datos.setearConsulta("Select Nro_Legajo_M, Dni_M, Nombre_M, Apellido_M, Sexo_M, Nacionalidad_M, Fecha_Nacimiento_M, Direccion_M,Id_Localidad_M, Correo_Electronico_M, Telefono_M, Id_Especialidad_M, Usuario_M, Contrasenia_M, Estado_M From MEDICOS where Usuario_M = @usuario AND Contrasenia_M = @contra");
                datos.setearParametro("@usuario", medico.getUsuario());
                datos.setearParametro("@contra", medico.getContrasenia());
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    medico.setLegajo((string)datos.Lector["Nro_Legajo_M"]);
                    medico.setDni((string)datos.Lector["Dni_M"]);
                    medico.setNombre((string)datos.Lector["Nombre_M"]);
                    medico.setApellido((string)datos.Lector["Apellido_M"]);
                    medico.setSexo((string)datos.Lector["Sexo_M"]);
                    medico.setNacionalidad((string)datos.Lector["Nacionalidad_M"]);
                    medico.setFechaNacimiento((DateTime)datos.Lector["Fecha_Nacimiento_M"]);
                    medico.setDireccion((string)datos.Lector["Direccion_M"]);
                    Localidad localidad = new Localidad();
                    localidad.setIdLocalidad((string)datos.Lector["Id_Localidad_M"]);
                    medico.setCorreoElectronico((string)datos.Lector["Correo_Electronico_M"]);
                    medico.setTelefono((string)datos.Lector["Telefono_M"]);
                    Especialidad especialiadad = new Especialidad();
                    especialiadad.setIdEspecialidad((string)datos.Lector["Id_Especialidad_M"]);
                    medico.setEstado((bool)datos.Lector["Estado_M"]);
                    return true;
                }
                else
                {
                    return false;
                }
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

        public string GetLegajoNuevo()
        {
            string legajo = "";
            int numLegajo = 0;
            int ceros = 0;

            try {
                datos.openConexion();
                datos.setearConsulta("SELECT TOP 1 Nro_Legajo_M FROM MEDICOS ORDER BY Nro_Legajo_M DESC");
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    legajo = (string)(datos.Lector["Nro_Legajo_M"]);
                    numLegajo = Convert.ToInt32(legajo.Remove(0, 1)) + 1;
                    legajo = "M";
                    if (numLegajo < 10) { ceros = 3; }
                    else if (numLegajo < 100) { ceros = 2; }
                    else if (numLegajo < 1000) { ceros = 1; }
                    else { ceros = 0; }
                    for (int i = 0; i < ceros; i++)
                    {
                        legajo += "0";
                    }
                    legajo += numLegajo.ToString();
                }
            } catch (Exception ex) { throw ex; }
            finally {datos.closeConexion(); }

            return legajo;
        }

        public int AgregarMedico(Medico medico)
        {
            int filasAfectadas = 0;

            try
            {
                datos.openConexion();
                datos.setearConsulta("INSERT INTO MEDICOS (Nro_Legajo_M, Dni_M, Nombre_M, Apellido_M, Sexo_M, " +
                    "Nacionalidad_M, Fecha_Nacimiento_M, Direccion_M, Id_Localidad_M, Correo_Electronico_M, " +
                    "Telefono_M, Id_Especialidad_M, Usuario_M, Contrasenia_M, Estado_M) VALUES (" +
                    "@legajo, @dni, @nombre, @apellido, @sexo, @nacionalidad, @nacimiento, @direccion, @localidad, @correo, " +
                    "@telefono, @especialidad, @usuario, @contrasenia, 1)");

                datos.setearParametro("@legajo", medico.getLegajo());
                datos.setearParametro("@dni", medico.getDni());
                datos.setearParametro("@nombre", medico.getNombre());
                datos.setearParametro("@apellido", medico.getApellido());
                datos.setearParametro("@sexo", medico.getSexo());
                datos.setearParametro("@nacionalidad", medico.getNacionalidad());
                datos.setearParametro("@nacimiento", medico.getFechaNacimiento());
                datos.setearParametro("@direccion", medico.getDireccion());
                datos.setearParametro("@localidad", medico.getLocalidad().getIdLocalidad());
                datos.setearParametro("@correo", medico.getCorreoElectronico());
                datos.setearParametro("@telefono", medico.getTelefono());
                datos.setearParametro("@especialidad", medico.getEspecialidad().getIdEspecialidad());
                datos.setearParametro("@usuario", medico.getUsuario());
                datos.setearParametro("@contrasenia", medico.getContrasenia());

                filasAfectadas = datos.ejecutarAccion();
            } catch (Exception ex) { throw ex; }
            finally {datos.closeConexion(); }

            return filasAfectadas;
        }

        public bool BuscarUsuario(string usuario)
        {
            bool encontrado = false;
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT * FROM MEDICOS WHERE Usuario_M = @usuario");
                datos.setearParametro("@usuario", usuario);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    encontrado = true;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return encontrado;
        }

        public bool BuscarDNI(string dni)
        {
            bool encontrado = false;
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT * FROM MEDICOS WHERE Dni_M = @dni");
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    encontrado = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return encontrado;
        }
        public DataTable TraerMedicoTabla(string dni)
        {
            DataTable tabla = new DataTable();
            try
            {
                datos.openConexion();

                datos.setearConsulta(
                    "SELECT Nro_Legajo_M as Legajo, Dni_M as DNI, Nombre_M as nombre, Apellido_M as apellido, Sexo_M as Sexo, Nacionalidad_M as Nacionalidad, Fecha_Nacimiento_M as FechaDeNacimiento, Direccion_M as Direccion , Correo_Electronico_M as CorreoElectronico, Telefono_M as Telefono, Estado_M as Estado FROM MEDICOS WHERE Dni_M = @dni");
                datos.setearParametro("@dni", dni);

                datos.ejecutarLectura();

                tabla.Load(datos.Lector);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return tabla;
        }

        public bool BajaMedico(string dni)
        {
            int filasAfectadas;
            try
            {
                datos.openConexion();
                datos.setearConsulta("UPDATE MEDICOS SET Estado_M = 0 WHERE Dni_M = @dni");
                datos.setearParametro("@dni", dni);
                filasAfectadas = datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return filasAfectadas == 1 ? true : false;
        }
        /// MODIFICAR MEDICO
        public Medico BuscarMedico(Medico medico)
        {
            try
            {
                datos.openConexion();

                datos.setearConsulta(
                    "SELECT Nro_Legajo_M, Dni_M as dni, Nombre_M as nombre, Apellido_M as apellido, Sexo_M as sexo, Nacionalidad_M as nacionalidad," +
                    "Fecha_Nacimiento_M as fechaDeNacimiento, Direccion_M as direccion, Id_Localidad_M as idLocalidad, Id_Provincia_L AS idProvincia, " +
                    "Telefono_M as telefono, Id_Especialidad_M as especialidad, Usuario_M as usuario, Contrasenia_M as contrasenia, Estado_M as estado, " +
                    "Correo_Electronico_M as correoElectronico FROM MEDICOS " +
                    "INNER JOIN LOCALIDADES ON LOCALIDADES.Id_Localidad = MEDICOS.Id_Localidad_M " +
                    "WHERE Nro_Legajo_M = @legajo");
                datos.setearParametro("@legajo", medico.getLegajo());

                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    medico.setDni(datos.Lector["dni"].ToString().Trim());
                    medico.setNombre(datos.Lector["nombre"].ToString());
                    medico.setApellido(datos.Lector["apellido"].ToString());
                    medico.setSexo(datos.Lector["sexo"].ToString());
                    medico.setNacionalidad(datos.Lector["nacionalidad"].ToString());
                    medico.setFechaNacimiento(Convert.ToDateTime(datos.Lector["fechaDeNacimiento"]));
                    medico.setDireccion(datos.Lector["direccion"].ToString());
                    medico.getLocalidad().setIdLocalidad(datos.Lector["idLocalidad"].ToString());
                    medico.getProvincia().setIdProvincia(datos.Lector["idProvincia"].ToString());
                    medico.setTelefono(datos.Lector["telefono"].ToString().Trim());
                    medico.getEspecialidad().setIdEspecialidad(datos.Lector["especialidad"].ToString());
                    medico.setCorreoElectronico(datos.Lector["correoElectronico"].ToString());
                    medico.setUsuario(datos.Lector["usuario"].ToString());
                    medico.setContrasenia(datos.Lector["contrasenia"].ToString());
                    medico.setEstado(Convert.ToBoolean(datos.Lector["estado"]));
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return medico;
        }
        public bool ModificarMedicoEnBD(Medico medico)
        {
            int filasAfectadas = 0;
            try
            {
                datos.openConexion();
                datos.setearConsulta(
                                "UPDATE MEDICOS SET " +
                                "Dni_M = @dni, Nombre_M = @nombre, Apellido_M = @apellido, Sexo_M = @sexo, " +
                                "Nacionalidad_M = @nacionalidad, Fecha_Nacimiento_M = @fecha, Direccion_M = @direccion, " +
                                "Id_Localidad_M = @localidad, Telefono_M = @telefono, " +
                                "Id_Especialidad_M = @especialidad, Correo_Electronico_M = @correo, Usuario_M = @usuario, " +
                                "Contrasenia_M = @contrasenia " +
                                "WHERE Nro_Legajo_M = @legajo");

                datos.setearParametro("@dni", medico.getDni());
                datos.setearParametro("@nombre", medico.getNombre());
                datos.setearParametro("@apellido", medico.getApellido());
                datos.setearParametro("@sexo", medico.getSexo());
                datos.setearParametro("@nacionalidad", medico.getNacionalidad());
                datos.setearParametro("@fecha", medico.getFechaNacimiento());
                datos.setearParametro("@direccion", medico.getDireccion());
                datos.setearParametro("@localidad", medico.getLocalidad().getIdLocalidad());
                datos.setearParametro("@especialidad", medico.getEspecialidad().getIdEspecialidad());
                datos.setearParametro("@correo", medico.getCorreoElectronico());
                datos.setearParametro("@usuario", medico.getUsuario());
                datos.setearParametro("@contrasenia", medico.getContrasenia());
                datos.setearParametro("@telefono", medico.getTelefono());
                datos.setearParametro("@legajo", medico.getLegajo());

                filasAfectadas = datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return filasAfectadas != 0;
        }

        ///Reactivar
        public DataTable GetTablaInactivos()
        {
            try
            {
                string consulta = "SELECT m.Nro_Legajo_M AS Legajo, m.Dni_M AS DNI, m.Nombre_M AS Nombre, m.Apellido_M AS Apellido, " +
                    "m.Sexo_M AS Sexo, m.Nacionalidad_M AS Nacionalidad, m.Fecha_Nacimiento_M AS Nacimiento, m.Direccion_M AS Direccion, " +
                    "l.Descripcion_L AS Localidad, p.Descripcion_P AS Provincia, m.Correo_Electronico_M AS Correo, m.Telefono_M AS Telefono, " +
                    "e.Descripcion_E AS Especialidad " +
                    "FROM MEDICOS m INNER JOIN LOCALIDADES l ON m.Id_Localidad_M = l.Id_Localidad " +
                    "INNER JOIN PROVINCIAS p ON p.Id_Provincia = l.Id_Provincia_L " +
                    "INNER JOIN ESPECIALIDADES e ON m.Id_Especialidad_M = e.ID_Especialidad " +
                    "WHERE m.Estado_M = 0";
                datos.openConexion();
                datos.setearAdaptador(consulta);
                return datos.ejecutarTabla("MEDICOS");
            }
            catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }
        }

        public DataTable GetTablaInactivosFiltrar(string buscar)
        {
            try
            {
                string consulta = "SELECT m.Nro_Legajo_M AS Legajo, m.Dni_M AS DNI, m.Nombre_M AS Nombre, m.Apellido_M AS Apellido, " +
                        "m.Sexo_M AS Sexo, m.Nacionalidad_M AS Nacionalidad, m.Fecha_Nacimiento_M AS Nacimiento, m.Direccion_M AS Direccion, " +
                        "l.Descripcion_L AS Localidad, p.Descripcion_P AS Provincia, m.Correo_Electronico_M AS Correo, m.Telefono_M AS Telefono, " +
                        "e.Descripcion_E AS Especialidad " +
                        "FROM MEDICOS m INNER JOIN LOCALIDADES l ON m.Id_Localidad_M = l.Id_Localidad " +
                        "INNER JOIN PROVINCIAS p ON p.Id_Provincia = l.Id_Provincia_L " +
                        "INNER JOIN ESPECIALIDADES e ON m.Id_Especialidad_M = e.ID_Especialidad " +
                        "WHERE m.Estado_M = 0 AND (m.Nro_Legajo_M LIKE @buscar OR m.Dni_M LIKE @buscar OR m.Nombre_M LIKE @buscar OR m.Apellido_M LIKE @buscar)";


                datos.openConexion();
                datos.setearAdaptador(consulta);
                datos.setearParametroAdaptador("@buscar", "%" + buscar + "%");
                return datos.ejecutarTabla("MEDICOS");
            }
            catch (Exception ex) { throw ex; }
            finally
            {
                datos.closeConexion();
            }

        }

        public bool ReactivarMedico(string legajo)
        {
            try
            {
                datos.openConexion();
                datos.setearConsulta("UPDATE MEDICOS SET Estado_M = 1 WHERE Nro_Legajo_M = @legajo");
                datos.setearParametro("@legajo", legajo);
                return datos.ejecutarAccion() == 1;
            }
            catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }
        }
        /// consultas de chequeo
        public bool ExisteDniEnOtroMedico(string dni, string legajoActual)
        {
            int contar;
            try
            {
                datos.openConexion();
                datos.setearConsulta(
                    "SELECT COUNT(*) FROM MEDICOS WHERE Dni_M = @dni AND Nro_Legajo_M <> @legajo");
                datos.setearParametro("@dni", dni);
                datos.setearParametro("@legajo", legajoActual);

                contar = (int)datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return contar > 0;
        }
        public bool ExisteCorreoEnOtroMedico(string correo, string legajoActual)
        {
            int contar;
            try
            {
                datos.openConexion();
                datos.setearConsulta(
                    "SELECT COUNT(*) FROM MEDICOS WHERE Correo_Electronico_M = @correo AND Nro_Legajo_M <> @legajo");
                datos.setearParametro("@correo", correo);
                datos.setearParametro("@legajo", legajoActual);

                contar = (int)datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return contar > 0;
        }
        public bool ExisteTelefonoEnOtroMedico(string telefono, string legajoActual)
        {
            int contar;
            try
            {
                datos.openConexion();
                datos.setearConsulta(
                    "SELECT COUNT(*) FROM MEDICOS WHERE Telefono_M = @tel AND Nro_Legajo_M <> @legajo");
                datos.setearParametro("@tel", telefono);
                datos.setearParametro("@legajo", legajoActual);

                contar = (int)datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return contar > 0;
        }
        public bool ExisteUsuario(string usuario, string legajo)
        {
            int contar;
            try
            {
                datos.openConexion();
                datos.setearConsulta(
                    "SELECT COUNT(*) FROM MEDICOS WHERE Usuario_M = @usuario AND Nro_Legajo_M <> @legajo");
                datos.setearParametro("@usuario", usuario);
                datos.setearParametro("@legajo", legajo);

                contar = (int)datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return contar > 0;
        }
    }
}
