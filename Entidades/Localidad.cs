using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Localidad
    {
        //Atributos
        private int _IdLocalidad;
        private string _Descripcion;

        //Constructores
        public Localidad()
        {

        }


        public Localidad(int idLocalidad, string descripcion)
        {
            _IdLocalidad = idLocalidad;
            _Descripcion = descripcion;
        }
        //Getters y setters
        public int getIdLocalidad()
        {
            return _IdLocalidad;
        }
        public void setIdLocalidad(int idLocalidad) 
        {
            _IdLocalidad=idLocalidad;
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
