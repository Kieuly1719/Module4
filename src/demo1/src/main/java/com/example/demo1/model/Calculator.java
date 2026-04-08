package com.example.demo1.model;

public class Calculator {
    public static float calculate(float firstOperand, float secondOperand, String operator){
        switch (operator){
            case "Addition":
                return firstOperand + secondOperand;
            case "Subtraction":
                return firstOperand - secondOperand;
            case "Multiplication":
                return firstOperand*secondOperand;
            case "Division":
                if(secondOperand != 0){
                    return firstOperand/secondOperand;
                }
                else{
                    throw new ArithmeticException("Can't divide by zero");
                }
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
