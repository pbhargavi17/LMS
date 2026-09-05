<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>
    <h2>Library Registration Form</h2>
    <form action="Registration.jsp" method="post">
        <label>Name:</label>
        <input type="text" name="name" required><br><br>

        <label>Email:</label>
        <input type="email" name="email" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <label>Course:</label>
        <input type="text" name="course"><br><br>

        <input type="submit" value="Register">
    </form>

    <%-- Simple JSP to display submitted values --%>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        if (name != null && email != null) {
    %>
        <h3>Registration Successful!</h3>
        <p><b>Name:</b> <%= name %></p>
        <p><b>Email:</b> <%= email %></p>
        <p><b>Course:</b> <%= course %></p>
    <%
        }
    %>
</body>
</html>
