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
        private int _IdProvincia;
        private string _Descripcion;

        //Constructores
        public Provincia() { }

        public Provincia(int idProvincia, string descripcion)
        {
            _IdProvincia = idProvincia;
            _Descripcion = descripcion;
        }
        //Getters y Setters

        public int getIdProvincia()
        {
            return _IdProvincia;
        }
        public void setIdProvincia(int idProvincia)
        {
            _IdProvincia=idProvincia;
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
