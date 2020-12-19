using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDangKyXeMay.Models;

namespace WebDangKyXeMay.Controllers
{
    public class DangKyXeController : Controller
    {
        //
        // GET: /DangKyXe/
        public ActionResult Index()
        {
            var listDangKyXeMay = new DBQLXeMayConnection().DangKyXeMays.ToList();
            return View(listDangKyXeMay);
        }

        //
        // GET: /DangKyXe/Details/5
        public ActionResult Details(int id)
        {
            var context = new DBQLXeMayConnection();
            var detail = context.DangKyXeMays.Find(id);
            return View(detail);
        }

        //
        // GET: /DangKyXe/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /DangKyXe/Create
        [HttpPost]
        public ActionResult Create(DangKyXeMay model)
        {
            try
            {
                // TODO: Add insert logic here
                var context = new DBQLXeMayConnection();
                context.DangKyXeMays.Add(model);
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /DangKyXe/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /DangKyXe/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /DangKyXe/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /DangKyXe/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
