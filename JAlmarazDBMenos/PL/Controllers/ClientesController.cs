using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PL.Controllers
{
    public class ClientesController : Controller
    {
        //
        // GET: /Clientes/
        public ActionResult GetAll()
        {
            ML.Result result = BL.Clientes.GetAll();

            ML.Clientes cliente = new ML.Clientes();

            if (result.Correct)
            {
                cliente.ClientesList = result.Objects;
            }
            else
            {

            }
            return View(cliente);
        }

        [HttpGet]
        public ActionResult Form(int? IdClientes)
        {
            ML.Clientes clientes = new ML.Clientes();

                if (IdClientes == null) //Add
                {
                    return View(clientes);
                }

            return View(clientes);
        }

        [HttpPost]
        public ActionResult Form(ML.Clientes clientes)
        {
            ML.Result result = new ML.Result();

            if (clientes.IdCliente == 0)
            {
                result = BL.Clientes.Add(clientes);

                if (result.Correct)
                {
                    ViewBag.Mensaje = "El Cliente se ha registrado correctamente";
                }
                else
                {
                    ViewBag.Mensaje = "El Cliente no se ha registrado correctamente " + result.ErrorMessage;
                }

            }
            else
            {
                //result = BL.Poliza.Update(poliza);

                //if (result.Correct)
                //{
                //    ViewBag.Mensaje = "La Poliza se ha actualizado correctamente";
                //}
                //else
                //{
                //    ViewBag.Mensaje = "La Poliza no se ha actualizado correctamente " + result.ErrorMessage;
                //}
            }
            return PartialView("ModalPV");
        }
	}
}