package com.example.demo1.controller;

import com.example.demo1.model.Calculator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second-operand"));
        String operator = request.getParameter("operator");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Result:</h1>");

        try {
            float result = Calculator.calculate(firstOperand, secondOperand, operator);

            char charOperator = getCharOperator(operator);
            writer.println(firstOperand + " " + charOperator + " " + secondOperand + " = " + result);

        } catch (Exception ex) {
            writer.println("Error: " + ex.getMessage());
        }

        writer.println("</html>");
    }

    private char getCharOperator(String operator) {
        switch (operator) {
            case "Addition": return '+';
            case "Subtraction": return '-';
            case "Multiplication": return '*';
            case "Division": return '/';
            default: return '?';
        }
    }
}
