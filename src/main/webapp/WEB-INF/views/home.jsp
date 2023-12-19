<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
    <title>Application Employees</title>
    <script src="https://cdn.tailwindcss.com"></script>
<%--    backgroun color black--%>
<style>
    body {
        background-color: grey;
    }
</style>
</head>

<body>
<div class="w-full flex flex-row">



    <div id="add-employee" class="w-1/2 max-w-md mx-auto my-8 p-6 border border-gray-200 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Ajouter un employée !</h2>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <form action="/addEmployee" method="post" class="space-y-4">

            <h1 class="text-medium mb-6">Prénom:</h1>
            <div>
                <input type="text" name="firstName" placeholder="Prénom" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <h1 class="text-medium mb-6">Nom:</h1>
            <div>
                <input type="text" name="lastName" placeholder="Nom de famille" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <h1 class="text-medium mb-6">Email:</h1>
            <div>
                <input type="email" name="email" placeholder="Email" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <h1 class="text-medium mb-6">Mot de passe:</h1>
            <div>
                <input type="password" name="password" placeholder="Mot de passe" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <h1 class="text-medium mb-6">Numéro de téléphone:</h1>
            <div>
                <input type="text" name="employeePhone" placeholder="Numéro de téléphone" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300"
                       pattern="\d{10}"
                       maxlength="10"
                       minlength="10"
                       title="Veuillez saisir un numéro de téléphone valide."/>
            </div>
            <h1 class="text-medium mb-6">Date d'embauche:</h1>
            <div>
                <input type="date" name="hireDate" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <h1 class="text-medium mb-6">Pole d'activité:</h1>
            <div>
                <select required name="pole" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300">
                    <option value="Autre">Autre</option>
                    <option value="commercial">Commercial et Marketing</option>
                    <option value="financial">Financier</option>
                    <option value="operations">Opérations et Production</option>
                    <option value="humanResources">Ressources Humaines (RH)</option>
                    <option value="researchDevelopment">Recherche et Développement (R&D) / Innovation</option>
                </select>
            </div>
            <h1 class="text-medium mb-6">Poste:</h1>
            <div>
                <input type="text" name="role" placeholder="Rôle" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <button type="submit" class="w-full bg-orange-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">Ajouter Employé</button>
        </form>
    </div>

    <div id="show-employee" class="w-full my-8 p-6 border border-gray-200 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Voir la liste des employés!</h2>
<%--        <form action="/search" method="post" class="space-y-4">--%>
            <div class="flex justify-between items-center mb-6">
                <div class="relative">
                    <input type="search" id="search" placeholder="Recherche" class="bg-cyan-400 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <div class="absolute inset-y-0 left-0 pl-2 flex items-center pointer-events-none">
                        <img src="/assets/search.png" alt="search" class="w-5">
                    </div>
                </div>
            </div>
            <div id="search-results" class="flex flex-col space-y-4 w-300">
            </div>
            <table class="min-w-full leading-normal">
                <thead>
                <tr>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Numéro de tél</th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Prénom</th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Nom</th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Email</th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Date d'embauche</th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Pole d'activité</th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Rôle</th>
                    <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">DELETE</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${employees}" var="employee" varStatus="loop">
                    <tr>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.employeePhone}</td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.firstName}</td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.lastName}</td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.email}</td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.hireDate}</td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.pole}</td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.role}</td>
                        <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm"><a class="text-white bg-red-500 p-2">todo: delete</a></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
<%--        </form>--%>
    </div>


</div>
</body>
</html>

<script>
    document.getElementById('search').addEventListener('input', function(e) {
        var searchTerm = e.target.value;
        var resultsDiv = document.getElementById('search-results');

        if(searchTerm.length > 0) {
            fetch('/search?term=' + encodeURIComponent(searchTerm))
                .then(response => response.json())
                .then(data => {
                    resultsDiv.innerHTML = '';
                    data.forEach(emp => {
                        resultsDiv.innerHTML += '<div class="bg-blue-200 p-4 rounded-lg shadow-md">'+ emp["firstName"] +'</div>';
                    });
                })
                // .catch(error => console.error('Error:', error));
        }else {
            resultsDiv.innerHTML = '';
        }
    });
</script>