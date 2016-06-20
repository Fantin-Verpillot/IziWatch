using System;
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
    public class PopularitiesController : Controller
    {
        private IziWatchEntities db = new IziWatchEntities();

        // GET: Popularities
        public ActionResult Index()
        {
            return View(BusinessManagement.Popularity.GetListPopularity());
        }

        // GET: Popularities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Popularity popularity = db.Popularities.Find(id);
            DBO.Popularity popularity = BusinessManagement.Popularity.GetPopularity((int)id);
             
            if (popularity == null)
            {
                return HttpNotFound();
            }
            return View(popularity);
        }

        // GET: Popularities/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Popularities/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Viewed,Liked,ArticleId,UserId")] DBO.Popularity popularity)
        {
            if (ModelState.IsValid)
            {
                //Generated : db.Popularities.Add(popularity);
                BusinessManagement.Popularity.CreatePopularity(popularity);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(popularity);
        }

        // GET: Popularities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Popularity popularity = db.Popularities.Find(id);
            DBO.Popularity popularity = BusinessManagement.Popularity.GetPopularity((int)id);

            if (popularity == null)
            {
                return HttpNotFound();
            }
            return View(popularity);
        }

        // POST: Popularities/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Viewed,Liked,ArticleId,UserId")] DBO.Popularity popularity)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(popularity).State = EntityState.Modified;
                BusinessManagement.Popularity.UpdatePopularity(popularity);

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(popularity);
        }

        // GET: Popularities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Popularity popularity = db.Popularities.Find(id);
            DBO.Popularity popularity = BusinessManagement.Popularity.GetPopularity((int)id);

            if (popularity == null)
            {
                return HttpNotFound();
            }
            return View(popularity);
        }

        // POST: Popularities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Generated : Popularity popularity = db.Popularities.Find(id);
            //Generated : db.Popularities.Remove(popularity);
            BusinessManagement.Popularity.DeletePopularity((int)id);
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
