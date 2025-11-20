using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurnos
    {
        AccesoDatos datos = new AccesoDatos();

        public List<Turno> getTurnosPorMedico(Medico medico)
        {
            List<Turno> lista = new List<Turno>();
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE T.Nro_Legajo_T = @id");
                datos.setearParametro("id", medico.getLegajo());
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno turno = new Turno();
                    turno.ID = (string)datos.Lector["Id_Turno"];
                    turno.DNI = (string)datos.Lector["Dni_Paciente_T"];
                    turno.Nombre = (string)datos.Lector["Nombre_P"];
                    turno.Apellido = (string)datos.Lector["Apellido_P"];
                    turno.Sexo = (string)datos.Lector["Sexo_P"];
                    turno.FechaNacimiento = (DateTime)datos.Lector["Fecha_Nacimiento_P"];
                    turno.Provincia = (string)datos.Lector["Descripcion_P"];
                    turno.Fecha = (DateTime)datos.Lector["Fecha_T"];
                    turno.Hora = ((TimeSpan)datos.Lector["Hora_T"]).ToString();
                    turno.Asistencia = (string)datos.Lector["Asistencia_T"];
                    turno.Observaciones = (string)datos.Lector["Observaciones"];

                    lista.Add(turno);
                }
                return lista;
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
        public List<Turno> FiltrarTurno(string filtro, string filtro2, string id)
        {
            List<Turno> lista = new List<Turno>();
            string consulta = null;
            try
            {
                if (filtro == "Sexo")
                {
                    consulta = "SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Sexo_P = @filtro2 AND T.Nro_Legajo_T = @id";
                }
                else if (filtro == "Provincia")
                {
                    consulta = "SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE Pr.Descripcion_P = @filtro2 AND T.Nro_Legajo_T = @id";
                }
                else if (filtro == "Asistencia")
                {
                    consulta = "SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE Asistencia_T = @filtro2 AND T.Nro_Legajo_T = @id";
                }
                datos.openConexion();
                datos.setearConsulta(consulta);
                datos.setearParametro("filtro2", filtro2);
                datos.setearParametro("id", id);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno turno = new Turno();
                    turno.ID = (string)datos.Lector["Id_Turno"];
                    turno.DNI = (string)datos.Lector["Dni_Paciente_T"];
                    turno.Nombre = (string)datos.Lector["Nombre_P"];
                    turno.Apellido = (string)datos.Lector["Apellido_P"];
                    turno.Sexo = (string)datos.Lector["Sexo_P"];
                    turno.FechaNacimiento = (DateTime)datos.Lector["Fecha_Nacimiento_P"];
                    turno.Provincia = (string)datos.Lector["Descripcion_P"];
                    turno.Fecha = (DateTime)datos.Lector["Fecha_T"];
                    turno.Hora = ((TimeSpan)datos.Lector["Hora_T"]).ToString();
                    turno.Asistencia = (string)datos.Lector["Asistencia_T"];
                    turno.Observaciones = (string)datos.Lector["Observaciones"];

                    lista.Add(turno);
                }
                return lista;
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
