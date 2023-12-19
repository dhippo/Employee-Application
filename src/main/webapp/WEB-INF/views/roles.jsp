<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Role Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body style="background-color: #c3c8d1">
<div class="w-full flex flex-col items-center pt-8">
    <div class="w-1/2 bg-white p-6 rounded-xl shadow-md border border-[3px] border-black mb-8">
        <h2 class="text-2xl font-semibold mb-6">Ajouter un métier (rôles).</h2>
        <form action="/addRole" method="post" class="space-y-4">
            <div>
                <input type="text" name="roleName" placeholder="Mot identificateur unique du métier (exemple : dev_front , resp_rh)" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="roleTitle" placeholder="Titre entier du métier" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="roleDomain" placeholder="Domaine du métier" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="employeesListVisibility" placeholder="Visibilité de la liste des employés" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">Ajouter Rôle</button>
        </form>
    </div>

    <div class="w-1/2 bg-white p-6 rounded-xl shadow-md border border-[3px] border-black">
        <h2 class="text-2xl font-semibold mb-6">Liste des métiers.</h2>
        <c:forEach items="${roles}" var="role">
            <div class="p-4 mb-4 border-b border-gray-200">
                <p class="text-lg font-semibold">${role.roleName}</p>
                <p>${role.roleTitle}</p>
                <p>${role.roleDomain}</p>
                <p>${role.employeesListVisibility}</p>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
