package com.example.qlsp_connectdb.controller;

import com.example.qlsp_connectdb.model.Product;
import com.example.qlsp_connectdb.repository.IProductRepository;
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

@WebServlet("/products")
public class ProductController  extends HttpServlet {
    private final IProductService productService = new ProductService();
    private final ICategoryService categoryService = new CategoryService();
    private static final int PAGE_SIZE = 5;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");
        if (action == null){
            action = "list";
        }
        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProducts(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");
        if (action == null){
            action = "list";
        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProducts(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/products");
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String keyword = request.getParameter("keyword");
        Integer categoryId = parseInteger(request.getParameter("categoryId"));

        boolean isSearching = false;
        if(keyword != null && !keyword.isEmpty() || categoryId != null){
            keyword = keyword.trim();
            isSearching = true;
        }
        if(isSearching){
            if(keyword != null){
                request.setAttribute("products", productService.searchByProductName(keyword));
            }
            else if(categoryId != null){
                request.setAttribute("products", productService.findProductByCategoryID(categoryId));
            }
        }
        else{
            request.setAttribute("products", productService.findAll());
        }
        request.setAttribute("categories", categoryService.findAll());
        request.getRequestDispatcher("/WEB-INF/views/product_list.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        if(product == null){
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }
        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("product", product);
        request.setAttribute("formAction", "edit");
        request.getRequestDispatcher("/WEB-INF/views/product_form.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("product", new Product());
        request.setAttribute("formAction", "create");
        request.getRequestDispatcher("/WEB-INF/views/product_form.jsp").forward(request,response);
    }
    private void deleteProducts(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        boolean isDeleteSuccess = productService.deleteProduct(deleteId);
        response.sendRedirect(request.getContextPath() + "/products");
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String categoryId = request.getParameter("categoryIdRaw");

        try{
            double price_new = Double.parseDouble(price);
            int quantity_new = Integer.parseInt(quantity);
            int categoryId_new = Integer.parseInt(categoryId);

            Product product = new Product();
            product.setName(name);
            product.setPrice(price_new);
            product.setQuantity(quantity_new);
            product.setCategory_id(categoryId_new);

            boolean success = productService.addProduct(product);
            if(success){
                response.sendRedirect(request.getContextPath() + "/products");
                return;
            }

            request.setAttribute("error", "Không thể thêm sản phẩm.");
            request.setAttribute("product", product);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Giá, số lượng hoặc category không hợp lệ.");

            Product product = new Product();
            product.setName(name);
            request.setAttribute("product", product);
        }

        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("formAction", "create");
        request.getRequestDispatcher("/WEB-INF/views/product_form.jsp").forward(request, response);
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idRaw = request.getParameter("id");
        String name = request.getParameter("name");
        String priceRaw = request.getParameter("price");
        String quantityRaw = request.getParameter("quantity");
        String categoryIdRaw = request.getParameter("categoryId");

        try {
            int id = Integer.parseInt(idRaw);
            double price = Double.parseDouble(priceRaw);
            int quantity = Integer.parseInt(quantityRaw);
            int categoryId = Integer.parseInt(categoryIdRaw);

            Product product = new Product();
            product.setId(id);
            product.setName(name);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setCategory_id(categoryId);

            boolean success = productService.updateProduct(product);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/products");
                return;
            }

            request.setAttribute("error", "Không thể cập nhật sản phẩm.");
            request.setAttribute("product", product);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Dữ liệu cập nhật không hợp lệ.");
        }

        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("formAction", "edit");
        request.getRequestDispatcher("/WEB-INF/views/product_form.jsp").forward(request, response);
    }
    private int parseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return defaultValue;
        }
    }

    private Integer parseInteger(String value) {
        try {
            if (value == null || value.trim().isEmpty()) {
                return null;
            }
            return Integer.parseInt(value);
        } catch (Exception e) {
            return null;
        }
    }
}
