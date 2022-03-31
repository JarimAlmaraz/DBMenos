using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ML
{
    public class Clientes
    {
    public int IdCliente { get; set; }
    public string Nombre { get; set; }
    public int Telefono { get; set; }
    public DateTime UltimoPago { get; set; }
    public DateTime FechaCreacion { get; set; }
    //Lista donde se meterá la información que se traé de la base para MVC
    public List<object> ClientesList { get; set; }
    }
}
