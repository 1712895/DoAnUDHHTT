using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DataRepository;


namespace ConsoleClient.Controllers
{
    public class BangLaiXeController : ApiController
    {
        QLXeMayEntities1 entities = new QLXeMayEntities1();

        public BangLaiXeController()
        {
            // Add the following code
            // problem will be solved
            entities.Configuration.ProxyCreationEnabled = false;
        }
        [HttpGet]
        public List<BangLaiXe> LoadAllBLX()
        {
            return entities.BangLaiXe.ToList();
        }
        [HttpGet]
        public HttpResponseMessage LoadBLXById(int id)
        {
            var entity = entities.BangLaiXe.FirstOrDefault(e => e.IDUser == id);
            if (entity != null)
            {
                return Request.CreateResponse(HttpStatusCode.OK, entity);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "User voi Id = " + id.ToString() + " khong tim thay");
            }
        }
    }
}
