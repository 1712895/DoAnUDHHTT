using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DataRepository;

namespace ConsoleClient.Controllers
{
    public class UserController : ApiController
    {
       
        QLXeMayEntities1 entities = new QLXeMayEntities1();

        public UserController()
        {
            // Add the following code
            // problem will be solved
            entities.Configuration.ProxyCreationEnabled = false;
        }
        [HttpGet]
        public List<User> LoadAllUser()
        {
            return entities.Users.ToList();
        }
        [HttpGet]
        public HttpResponseMessage LoadUserById(int id)
        {
            var entity = entities.Users.FirstOrDefault(e => e.IDUser == id);
            if(entity != null)
            {
                return Request.CreateResponse(HttpStatusCode.OK, entity);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "User voi Id = " + id.ToString() + " khong tim thay");
            }
        }
        [Route("api/User/{id}/UpdateSDT")]
        [HttpPut]
        public HttpResponseMessage UpdateSDT(int id, [FromBody] User user)
        {
            try
            {
                var entity = entities.Users.FirstOrDefault(e => e.IDUser == id);
                if (entity == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "User voi Id = " + id.ToString() + " Khong tim thay");
                }
                else
                {
                    entity.SDT = user.SDT;
                    entities.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, entity);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        [Route("api/User/{id}/UpdatePW")]
        [HttpPut]
        public HttpResponseMessage UpdatePW(int id, [FromBody] User user)
        {
            try
            {
                var entity = entities.Users.FirstOrDefault(e => e.IDUser == id);
                if (entity == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "User voi Id = " + id.ToString() + " Khong tim thay");
                }
                else
                {
                 
                    entity.password = user.password;
                    entities.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, entity);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
        }

    }
    

    
}
