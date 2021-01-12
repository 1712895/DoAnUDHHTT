using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DataRepository;
using System.Diagnostics;
using System.Threading;

namespace ConsoleClient.Controllers
{
    public class ThongTinLuatController : ApiController
    {
        QLXeMayEntities1 entities = new QLXeMayEntities1();

        public ThongTinLuatController()
        {
            // Add the following code
            // problem will be solved
            entities.Configuration.ProxyCreationEnabled = false;
        }
        [HttpGet]
        public List<ThongTinLuat> LoadAllThongTin()
        {
            return entities.ThongTinLuat.ToList();
        }
        
        [HttpGet]
        public IHttpActionResult SearchByKey(string key)
        {
            var result = entities.ThongTinLuat.Where(x => x.ThongTinDayDu.Contains(key) || x.TenChuDe.Contains(key) ).ToList();
           
            return Ok(result); 
        }

    }
}
