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
    [Authorize(Roles = "Admin, Root")]
    public class SocialsController : Controller
    {
        private IziWatchEntities db = new IziWatchEntities();

        // GET: Socials
        public ActionResult Index()
        {
            return View(BusinessManagement.Social.GetListSocial());
        }

        // GET: Socials/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Social social = db.Socials.Find(id);
            DBO.Social social = BusinessManagement.Social.GetSocial((int)id);

            if (social == null)
            {
                return HttpNotFound();
            }
            return View(social);
        }

        // GET: Socials/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Socials/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Type,Account,Identifier")] DBO.Social social)
        {
            if (ModelState.IsValid)
            {
                //Generated : db.Socials.Add(social);
                BusinessManagement.Social.CreateSocial(social);

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(social);
        }

        // GET: Socials/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Social social = db.Socials.Find(id);
            DBO.Social social = BusinessManagement.Social.GetSocial((int)id);

            if (social == null)
            {
                return HttpNotFound();
            }
            return View(social);
        }

        // POST: Socials/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Type,Account,Identifier")] DBO.Social social)
        {
            if (ModelState.IsValid)
            {
                //Generated : db.Entry(social).State = EntityState.Modified;
                BusinessManagement.Social.UpdateSocial(social);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(social);
        }

        // GET: Socials/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Social social = db.Socials.Find(id);
            DBO.Social social = BusinessManagement.Social.GetSocial((int)id);

            if (social == null)
            {
                return HttpNotFound();
            }
            return View(social);
        }

        // POST: Socials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Generated : Social social = db.Socials.Find(id);
            //Generated : db.Socials.Remove(social);
            BusinessManagement.Social.DeleteSocial(id);
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
