<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
    <title>Application Employees</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<div class="w-full flex flex-row">



    <div id="add-employee" class="w-1/2 max-w-md mx-auto my-8 p-6 border border-gray-200 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Ajouter un employée !</h2>

        <form action="/addEmployee" method="post" class="space-y-4">
            <div>
                <input type="text" name="employeeNumber" placeholder="Numéro d'employé" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="firstName" placeholder="Prénom" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="lastName" placeholder="Nom de famille" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="email" name="email" placeholder="Email" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="password" name="password" placeholder="Mot de passe" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="date" name="hireDate" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="role" placeholder="Rôle" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <button type="submit" class="w-full bg-orange-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">Ajouter Employé</button>
        </form>
    </div>

    <div id="show-employee" class="w-full  my-8 p-6 border border-gray-200 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Voir la liste des employés!</h2>

        <table class="min-w-full leading-normal">
            <thead>
            <tr>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Numéro</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Prénom</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Nom</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Email</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Date d'embauche</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Rôle</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">DELETE</th>


            </tr>
            </thead>
            <tbody>
            <c:forEach items="${employees}" var="employee" varStatus="loop">
                <tr>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.employeeNumber}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.firstName}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.lastName}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.email}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.hireDate}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.role}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm"><a class="text-white bg-red-500 p-2">todo: delete</a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


</div>
</body>
</html>