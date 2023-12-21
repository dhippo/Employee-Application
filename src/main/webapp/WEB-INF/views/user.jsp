<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Profil Utilisateur</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="container mx-auto my-12 p-8 bg-white rounded-lg shadow-xl">
    <div class="flex justify-between items-center mb-8">
        <div>
            <h1 class="text-3xl font-semibold text-gray-800">Profil Utilisateur</h1>
            <p class="text-gray-600">Informations personnelles</p>
            <div>

                <p class="text-gray-600 mb-2">Prénom: <span class="font-medium">${employee.firstName}</span></p>
                <p class="text-gray-600 mb-2">Nom: <span class="font-medium">${employee.lastName}</span></p>
                <p class="text-gray-600 mb-2">Numéro de téléphone: <span class="font-medium">${employee.employeePhone}</span></p>
                <p class="text-gray-600">Email: <span class="font-medium">${employee.email}</span></p>

            </div>
        </div>
        <div>
            <a href="/logout" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Déconnexion</a>
        </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">Détails du compte</h2>

            <form action="/updateFirstName" method="post">
                <p class="text-gray-600 mb-2">Prénom: <input type="text" name="firstName" value="${employee.firstName}" class="border border-gray-300 rounded-md p-2" /></p>
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-4 rounded">Changer de prénom</button>
            </form>

            <form action="/updateLastName" method="post">
                <p class="text-gray-600 mb-2">Nom: <input type="text" name="lastName" value="${employee.lastName}" class="border border-gray-300 rounded-md p-2" /></p>
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-4 rounded">Changer de nom</button>
            </form>

            <p class="text-gray-600 mb-2">Numéro de téléphone: <span class="font-medium">${employee.employeePhone}</span></p>
            <p class="text-gray-600">Email: <span class="font-medium">${employee.email}</span></p>
        </div>
    </div>
</div>
</body>
</html>
