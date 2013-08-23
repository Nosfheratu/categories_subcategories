using MvcApplication1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class HomeController : Controller
    {
        public cat_sub Context;

        public HomeController()
        {
            Context = new cat_sub();
        }
        
        public ActionResult Index()
        {
            var categories = Context.Categories.ToList();
            
            return View(categories);
        }

        public ActionResult SubCategories(int idCategory)
        {
            var subCategories = Context.Categories.Where(c => c.Id == idCategory).FirstOrDefault().SubCategories.ToList();
            ViewBag.Category = subCategories.FirstOrDefault().Category.Name;
            return View(subCategories);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
