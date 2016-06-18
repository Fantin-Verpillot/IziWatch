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
    public class CommentsController : Controller
    {
        private IziWatchEntities db = new IziWatchEntities();

        // GET: Comments
        public ActionResult Index()
        {
            return View(DataAccess.Comment.GetListComment());
        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Comment comment = db.Comments.Find(id);
            DBO.Comment comment = DataAccess.Comment.GetComment((long)id);

            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Comments/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title,Text,ArticleId,UserId")] DBO.Comment comment)
        {
            if (ModelState.IsValid)
            {
                //Generated : db.Comments.Add(comment);
                DataAccess.Comment.CreateComment(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(comment);
        }

        // GET: Comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Comment comment = db.Comments.Find(id);
            DBO.Comment comment = DataAccess.Comment.GetComment((long)id);

            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Text,ArticleId,UserId")] DBO.Comment comment)
        {
            if (ModelState.IsValid)
            {
                //Generated : db.Entry(comment).State = EntityState.Modified;
                DataAccess.Comment.UpdateComment(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(comment);
        }

        // GET: Comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Generated : Comment comment = db.Comments.Find(id);
            DBO.Comment comment = DataAccess.Comment.GetComment((long)id);

            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Generated : Comment comment = db.Comments.Find(id);
            //Generated : db.Comments.Remove(comment);
            DataAccess.Comment.DeleteComment((long)id);
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
