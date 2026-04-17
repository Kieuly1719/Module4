package com.example.qlsp_connectdb.controller;

import com.example.qlsp_connectdb.model.Category;
import com.example.qlsp_connectdb.service.CategoryService;
import com.example.qlsp_connectdb.service.ICategoryService;
import com.example.qlsp_connectdb.service.IProductService;
import com.example.qlsp_connectdb.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/categories")
public class CategoryController extends HttpServlet {
    private ICategoryService categoryService = new CategoryService();
    private IProductService productService = new ProductService();

    public CategoryController(){}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");
        if(action == null){
            action = "list";
        }
        switch (action){
            case "list":
                ListCategoris(request, response);
                break;
            case "viewProducts":
                viewCategoryProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");
        if(action == null){
            action = "list";
        }
        switch (action){
            case "list":
                response.sendRedirect(request.getContextPath() + "/categories");
                break;
        }
    }

    private void viewCategoryProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = parseInt(request.getParameter("id"), -1);

        Category category = categoryService.findById(id);
        if (category == null) {
            response.sendRedirect(request.getContextPath() + "/categories");
            return;
        }

        request.setAttribute("category", category);
        request.setAttribute("products", productService.findProductByCategoryID(id));
        request.getRequestDispatcher("/WEB-INF/views/category_products.jsp").forward(request, response);
    }

    private int parseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return defaultValue;
        }
    }
    private void ListCategoris(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setAttribute("categories", categoryService.findAll());
        request.getRequestDispatcher("/WEB-INF/views/category_list.jsp").forward(request, response);
    }

}
