﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using IziWatch.DBO;
using IziWatch.DataAccess;

namespace IziWatch.Controllers
{
    public class CategoriesController : Controller
    {
        private IziWatchEntities db = new IziWatchEntities();

        // GET: Categories
        public ActionResult Index()
        {
            return View(DataAccess.Category.GetListCategory());
        }

        // GET: Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            // Generated : DBO.Category category = db.Categories.Find(id);
            DBO.Category category = DataAccess.Category.GetCategory((long)id);

            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] DBO.Category category)
        {
            if (ModelState.IsValid)
            {
                //Generated : db.Categories.Add(category);
                DataAccess.Category.CreateCategory(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category);
        }

        // GET: Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Category category = db.Categories.Find(id);
            DBO.Category category = DataAccess.Category.GetCategory((long)id);

            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Categories/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] DBO.Category category)
        {
            if (ModelState.IsValid)
            {
                //Generated : db.Entry(category).State = EntityState.Modified;
                DataAccess.Category.UpdateCategory(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // GET: Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Category category = db.Categories.Find(id);
            DBO.Category category = DataAccess.Category.GetCategory((long)id);

            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Generated : Category category = db.Categories.Find(id);
            //Generated : db.Categories.Remove(category);
            DataAccess.Category.DeleteCategory((long)id);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}