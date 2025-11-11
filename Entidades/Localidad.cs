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
        private string _IdLocalidad;
        private string _Descripcion;

        //Constructores
        public Localidad()
        {

        }


        public Localidad(string idLocalidad, string descripcion)
        {
            _IdLocalidad = idLocalidad;
            _Descripcion = descripcion;
        }
        //Getters y setters
        public string getIdLocalidad()
        {
            return _IdLocalidad;
        }
        public void setIdLocalidad(string idLocalidad)
        {
            _IdLocalidad = idLocalidad;
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
