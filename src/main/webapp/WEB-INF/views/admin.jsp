<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
    <title>Application Employees</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body style="background-color: #c3c8d1">
<div id="header-infos" class="w-full flex flex-row">
    <div class="bg-white rounded-xl ml-12 pl-12 pr-12 pb-12 pt-8 mt-12 rounded-xl border border-[3px] border-black">
        <div>
            <h1 class="text-4xl font-semibold leading-6 text-gray-900 mb-10">Bonjour, ${employeeName} </h1>
            <h3 class="text-base font-semibold leading-6 text-gray-900">Statistiques des employés</h3>
            <dl class="mt-2 grid grid-cols-1 gap-5 sm:grid-cols-3">
                <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 border border-[2px] border-black">
                    <dt class="truncate text-sm font-medium text-gray-500">Nouveaux employés ce mois-ci</dt>
                    <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900">5</dd>
                </div>
                <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 border border-[2px] border-black">
                    <dt class="truncate text-sm font-medium text-gray-500">Total des employés</dt>
                    <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900">123</dd>
                </div>
                <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 border border-[2px] border-black">
                    <dt class="truncate text-sm font-medium text-gray-500">Total des admins</dt>
                    <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900">3</dd>
                </div>
            </dl>
        </div>
    </div>
</div>

<div class="w-full flex flex-col lg:flex-row">

    <div id="add-employee" class="w-1/2 bg-white p-6 m-10 rounded-xl shadow-md border border-[3px] border-black">
        <h2 class="text-2xl font-semibold mb-6">Ajouter un employé.</h2>

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

    <div id="show-employee" class="w-full bg-white p-6 m-10 border border-[3px] border-black rounded-xl shadow-md">
        <h2 class="text-2xl font-semibold mb-6">Liste des employés.</h2>

        <div class="flex justify-between items-center mb-6">
            <div class="relative">
                <input type="search" id="search" placeholder="Recherche" class=" border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 ">
                <div class="absolute inset-y-0 left-0 pl-2 flex items-center pointer-events-none">
                    <img src="/assets/search.png" alt="search" class="w-5">
                </div>
            </div>
        </div>


        <table class="min-w-full leading-normal ">
            <thead class="rounded-xl">
            <tr>
                <th class="rounded-tl-xl px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Numéro</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Prénom</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Nom</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Email</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Date d'embauche</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Rôle</th>
                <th class="rounded-tr-xl px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-right">DELETE</th>

            </tr>
            </thead>
            <tbody>
            <div id="search-results" class="flex flex-col space-y-4 w-300">

            </div>

            <c:forEach items="${employees}" var="employee" varStatus="loop">
                <tr>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">${employee.employeeNumber}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">${employee.firstName}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">${employee.lastName}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">${employee.email}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">${employee.hireDate}</td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">${employee.role}</td>
                    <td class="pl-5 py-5 border-b border-gray-200 bg-white text-sm"><a class="text-white bg-red-500 p-2 rounded-xl text-right">delete</a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>




<script>
    document.getElementById('search').addEventListener('input', function(e) {
        var searchTerm = e.target.value;
        var resultsDiv = document.getElementById('search-results');

        // RÉSULTATS DES RECHERCHES
        if(searchTerm.length > 0) {
            fetch('/search?term=' + encodeURIComponent(searchTerm))
                .then(response => response.json())
                .then(data => {
                    resultsDiv.innerHTML = ''; // Vider le contenu précédent
                    if (data.length === 0) {
                        resultsDiv.innerHTML = '<p class="text-gray-700 text-center">Aucun résultat trouvé</p>';
                    } else {
                        // Le tableau commence ici
                        let tableHtml = '<div class="overflow-hidden shadow-md sm:rounded-lg">' +
                            '<table class="min-w-full divide-y divide-gray-200">' +
                            '<thead class="bg-gray-50">' +
                            '<tr>';
                        // Là c'est les en-têtes du tableau
                        tableHtml += '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Numéro</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prénom</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date d\'embauche</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rôle</th>' +
                            '</tr>' +
                            '</thead>' +
                            '<tbody class="bg-white divide-y divide-gray-200">';

                        // Ajouter les lignes pour chaque employé
                        data.forEach(emp => {
                            tableHtml += '<tr>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">' + emp["employeeNumber"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["firstName"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["lastName"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["email"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["hireDate"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["role"] + '</td>' +
                                '</tr>';
                        });

                        // Fermer le tableau
                        tableHtml += '</tbody></table></div>';

                        // Mettre à jour le HTML de resultsDiv
                        resultsDiv.innerHTML = tableHtml;
                    }
                })
                .catch(error => console.error('Error:', error));
        } else {
            resultsDiv.innerHTML = '<p class="text-gray-700 text-center">...</p>';
        }
    });

</script>

