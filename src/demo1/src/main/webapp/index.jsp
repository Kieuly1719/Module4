<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1><%= "Simple Calculator"%></h1>
<fieldset style="width: 300px">
    <legend>Calculator</legend>
    <form action="calculate" method="post">
        <table>
            <tr>
                <td>First operand:</td>
                <td><input type="number" name="first-operand" step="any" required></td>
            </tr>
            <tr>
                <td>Operator:</td>
                <td>
                    <select name="operator">
                        <option value="Addition">Addition (+)</option>
                        <option value="Subtraction">Subtraction (-)</option>
                        <option value="Multiplication">Multiplication (*)</option>
                        <option value="Division">Division (/)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input type="number" name="second-operand" step="any" required></td>
            </tr>
            <tr>
                <td></td>
                <td><button type="submit">Calculate</button></td>
            </tr>
        </table>
    </form>
</fieldset>
<br/>
</body>
</html>