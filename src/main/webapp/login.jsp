<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Login</title>
    <style>
        body{font-family:Arial;background:#eef2f7;margin:0}
        .box{width:360px;margin:80px auto;background:#fff;padding:30px;border-radius:10px;box-shadow:0 4px 12px rgba(0,0,0,0.15)}
        h2{text-align:center;color:#1f3b57}
        input{width:100%;padding:10px;margin:10px 0;border:1px solid #ccc;border-radius:6px;box-sizing:border-box}
        button{width:100%;padding:10px;background:#1f3b57;color:#fff;border:none;border-radius:6px}
        .error{text-align:center;color:red}
    </style>
</head>
<body>
<div class="box">
    <h2>Hospital Management Login</h2>

    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    <p class="error"><%= errorMessage %></p>
    <%
        }
    %>

    <form action="login" method="post">
        <input type="text" name="username" placeholder="Enter username" required>
        <input type="password" name="password" placeholder="Enter password" required>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>