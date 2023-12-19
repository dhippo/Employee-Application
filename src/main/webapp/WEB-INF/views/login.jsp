<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="w-full flex justify-center">
    <div class="w-1/2 max-w-md mx-auto my-8 p-6 border border-gray-200 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Connexion</h2>

        <c:if test="${not empty errorMessage}">
            <div class="mb-4 text-center p-2 bg-red-100 border border-red-400 text-red-700">
                    ${errorMessage}
            </div>
        </c:if>

        <form action="/login" method="post" class="space-y-4">
            <div>
                <input type="email" name="email" placeholder="Email" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="password" name="password" placeholder="Mot de passe" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">Se connecter</button>
        </form>
    </div>
</div>
</body>
</html>
