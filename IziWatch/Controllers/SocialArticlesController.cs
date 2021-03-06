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
    [Authorize(Roles = "Root")]
    public class SocialArticlesController : Controller
    {
        private IziWatchEntities db = new IziWatchEntities();

        // GET: SocialArticles
        public ActionResult Index()
        {
            return View(BusinessManagement.SocialArticle.GetListSocialArticle());
        }

        // GET: SocialArticles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DBO.SocialArticle socialArticle = BusinessManagement.SocialArticle.GetSocialArticle((int)id);
            if (socialArticle == null)
            {
                return HttpNotFound();
            }
            return View(socialArticle);
        }

        // GET: SocialArticles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SocialArticles/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Text,Image,SocialId")] DBO.SocialArticle socialArticle)
        {
            if (ModelState.IsValid)
            {
                BusinessManagement.SocialArticle.CreateSocialArticle(socialArticle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(socialArticle);
        }

        // GET: SocialArticles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DBO.SocialArticle socialArticle = BusinessManagement.SocialArticle.GetSocialArticle((int)id);
            if (socialArticle == null)
            {
                return HttpNotFound();
            }
            return View(socialArticle);
        }

        // POST: SocialArticles/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Text,Image,SocialId")] DBO.SocialArticle socialArticle)
        {
            if (ModelState.IsValid)
            {
                BusinessManagement.SocialArticle.UpdateSocialArticle(socialArticle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(socialArticle);
        }

        // GET: SocialArticles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DBO.SocialArticle socialArticle = BusinessManagement.SocialArticle.GetSocialArticle((int)id);
            if (socialArticle == null)
            {
                return HttpNotFound();
            }
            return View(socialArticle);
        }

        // POST: SocialArticles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BusinessManagement.SocialArticle.DeleteSocialArticle(id);
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
