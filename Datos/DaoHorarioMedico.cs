using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoHorarioMedico
    {
        AccesoDatos datos = new AccesoDatos();
        public int AgregarHorario(HorarioMedico horario)
        {
            int filasAfectadas = 0;
            try
            {
                datos.openConexion();
                datos.setearConsulta("INSERT INTO HORARIO_MEDICOS (Nro_Legajo_HM, Id_Dia_HM, HorarioInicio_HM, HorarioFinal_HM) " +
                    "VALUES (@legajo, @dia, @inicio, @fin)");
                datos.setearParametro("@legajo", horario.getLegajo());
                datos.setearParametro("@dia", horario.getIdDia());
                datos.setearParametro("@inicio", horario.getHoraInicio());
                datos.setearParametro("@fin", horario.getHoraFin());

                filasAfectadas = datos.ejecutarAccion();
            } catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }

            return filasAfectadas;
        }
        public HorarioMedico TraerHorarioMedico(HorarioMedico horarioMedico)
        {
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT HorarioInicio_HM as inicio, HorarioFinal_HM as final FROM HORARIO_MEDICOS" +
                    " WHERE Nro_Legajo_HM = @numeroLegajo");

                datos.setearParametro("@numeroLegajo", horarioMedico.getLegajo());
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    horarioMedico.setHoraInicio(datos.Lector["inicio"].ToString());
                    horarioMedico.setHoraFin(datos.Lector["final"].ToString());
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
            return horarioMedico;
        }

        public List<string> LeerDiasLaborales(List<string> listaDeDias, string legajo)
        {
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT Id_Dia_HM as dia FROM HORARIO_MEDICOS" +
                                    " WHERE Nro_Legajo_HM = @numeroLegajo");

                datos.setearParametro("@numeroLegajo", legajo);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    string dia = datos.Lector["dia"].ToString().Trim();
                    listaDeDias.Add(dia);
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
            return listaDeDias;
        }

        public bool EliminarDiasPorLegajo(string legajo)
        {
            int filas;
            try
            {
                datos.openConexion();
                datos.setearConsulta("DELETE HORARIO_MEDICOS where Nro_Legajo_HM = @legajo");
                datos.setearParametro("@legajo", legajo);

                filas = datos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return filas > 0;
        }

        public DataTable TablaInforme(string[] especialidades)
        {
            DataTable dt = new DataTable();
            string consulta = "SELECT DISTINCT e.Descripcion_E AS Especialidad, " +
                "COUNT(m.Nro_Legajo_M) AS Medicos, " +
                "SUM(CASE WHEN hm.Id_Dia_HM = '1' THEN 1 ELSE 0 END) AS Lunes, " +
                "SUM(CASE WHEN hm.Id_Dia_HM = '2' THEN 1 ELSE 0 END) AS Martes, " +
                "SUM(CASE WHEN hm.Id_Dia_HM = '3' THEN 1 ELSE 0 END) AS Miercoles, " +
                "SUM(CASE WHEN hm.Id_Dia_HM = '4' THEN 1 ELSE 0 END) AS Jueves, " +
                "SUM(CASE WHEN hm.Id_Dia_HM = '5' THEN 1 ELSE 0 END) AS Viernes, " +
                "SUM(CASE WHEN hm.Id_Dia_HM = '6' THEN 1 ELSE 0 END) AS Sabado, " +
                "SUM(CASE WHEN hm.Id_Dia_HM = '7' THEN 1 ELSE 0 END) AS Domingo " +
                "FROM ESPECIALIDADES e LEFT JOIN MEDICOS m ON e.ID_Especialidad = m.Id_Especialidad_M " +
                "LEFT JOIN HORARIO_MEDICOS hm ON m.Nro_Legajo_M = hm.Nro_Legajo_HM WHERE m.Estado_M = 1 ";

            if (especialidades[0] != "0")
            {
                consulta += "AND (";
                foreach (string especialidad in especialidades)
                {
                    consulta += "e.Descripcion_E = '" + especialidad + "' OR ";
                }
                consulta = consulta.Remove(consulta.Length - 4);
                consulta += ")";
            }

            consulta += " GROUP BY e.Descripcion_E";

            try
            {
                datos.openConexion();
                datos.setearConsulta(consulta);

                datos.ejecutarLectura();
                dt.Load(datos.Lector);
            }
            catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }

            return dt;
        }
    }
}
