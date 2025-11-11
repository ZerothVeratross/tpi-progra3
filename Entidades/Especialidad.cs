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
        private int _IdEspecialidad;
        private string _Descripcion;

        //Constructores
        public Especialidad() { }
        
        public Especialidad(int idEspecialidad, string descripcion)
        {
            _IdEspecialidad = idEspecialidad;
            _Descripcion = descripcion;
        }
        //Getters y Setters

        public int getIdEspecialidad()
        {
            return _IdEspecialidad;
        }
        public void setIdEspecialidad(int idEspecialidad)
        {
            _IdEspecialidad=idEspecialidad;
        }

        public string getDescripcion()
        {
            return _Descripcion;
        }

        public void setDescripcion(string descripcion)
        {
            _Descripcion=descripcion;
        }
    }
}