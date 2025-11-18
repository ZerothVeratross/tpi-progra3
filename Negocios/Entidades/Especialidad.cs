using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Especialidad
    {
        //Atributos
        private string _IdEspecialidad;
        private string _Descripcion;

        //Constructores
        public Especialidad() { }

        public Especialidad(string idEspecialidad, string descripcion)
        {
            _IdEspecialidad = idEspecialidad;
            _Descripcion = descripcion;
        }
        //Getters y Setters

        public string getIdEspecialidad()
        {
            return _IdEspecialidad;
        }
        public void setIdEspecialidad(string idEspecialidad)
        {
            _IdEspecialidad = idEspecialidad;
        }

        public string getDescripcion()
        {
            return _Descripcion;
        }

        public void setDescripcion(string descripcion)
        {
            _Descripcion = descripcion;
        }
    }
}