package Buoi9_WebOverview;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount"));

        double discountAmount = price * discountPercent * 0.01;
        double discountPrice = price - discountAmount;

        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head><title>Discount Result</title></head>");
        out.println("<body style='font-family: Arial, sans-serif; margin: 40px;'>");
        out.println("<h2>Discount Calculation Result</h2>");

        out.println("<p><strong>Product Description:</strong> " + description + "</p>");
        out.println("<p><strong>List Price:</strong> $" + String.format("%.2f", price) + "</p>");
        out.println("<p><strong>Discount Percent:</strong> " + discountPercent + "%</p>");

        out.println("<p><strong>Discount Amount:</strong> $" + String.format("%.2f", discountAmount) + "</p>");
        out.println("<p><strong>Discount Price:</strong> $" + String.format("%.2f", discountPrice) + "</p>");

        out.println("<br><a href='index.jsp'>Quay lại trang tính toán</a>");
        out.println("</body>");
        out.println("</html>");
    }
}
