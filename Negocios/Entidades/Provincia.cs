using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Provincia
    {
        //Atributos
        private string _IdProvincia;
        private string _Descripcion;

        //Constructores
        public Provincia() { }

        public Provincia(string idProvincia, string descripcion)
        {
            _IdProvincia = idProvincia;
            _Descripcion = descripcion;
        }
        //Getters y Setters

        public string getIdProvincia()
        {
            return _IdProvincia;
        }
        public void setIdProvincia(string idProvincia)
        {
            _IdProvincia = idProvincia;
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
