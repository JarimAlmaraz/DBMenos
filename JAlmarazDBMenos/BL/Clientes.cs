using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Clientes
    {
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();

            try
            {
                using (DL.JAlmarazDBMenosEntities context = new DL.JAlmarazDBMenosEntities())
                {
                    var query = context.ClienteGetAll().ToList();

                    result.Objects = new List<object>();

                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.Clientes clientes = new ML.Clientes();

                            clientes.IdCliente = obj.IdCliente;
                            clientes.Nombre = obj.Nombre;
                            clientes.Telefono = obj.Telefono.Value;
                            clientes.UltimoPago = obj.Ultimo_pago.Value;
                            clientes.FechaCreacion = obj.Fecha_Creacion.Value;

                            //aseguradora.FechaCreacion = obj.FechaModificacion.Value.ToString("dd-MM-yyyy");

                            result.Objects.Add(clientes);
                        }
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Ocurrió un error al obtener los registros en la tabla Clientes";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }

            return result;
        }

        public static ML.Result Add(ML.Clientes clientes)
        {
            ML.Result result = new ML.Result();

            try
            {
                using (DL.JAlmarazDBMenosEntities context = new DL.JAlmarazDBMenosEntities())
                {
                    var query = context.ClientesAdd(clientes.Nombre, clientes.Telefono, clientes.UltimoPago);

                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se insertó el registro";
                    }
                    result.Correct = true;
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
    }

}
