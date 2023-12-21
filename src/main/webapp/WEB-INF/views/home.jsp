<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>

    <title>Application Employees</title>
    <script src="https://cdn.tailwindcss.com"></script>


</head>

<body style="background-color: #c3c8d1">

<div id="header-infos" class="w-full flex flex-row">

    <div id="hello-and-stats" class="bg-white rounded-xl ml-12 pl-12 pr-12 pb-12 pt-8 mt-12 rounded-xl border border-[3px] border-black">
        <div>

            <div class="flex flex-row items-center mb-10">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" data-slot="icon" class="w-12 h-12 mr-3">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.05 4.575a1.575 1.575 0 1 0-3.15 0v3m3.15-3v-1.5a1.575 1.575 0 0 1 3.15 0v1.5m-3.15 0 .075 5.925m3.075.75V4.575m0 0a1.575 1.575 0 0 1 3.15 0V15M6.9 7.575a1.575 1.575 0 1 0-3.15 0v8.175a6.75 6.75 0 0 0 6.75 6.75h2.018a5.25 5.25 0 0 0 3.712-1.538l1.732-1.732a5.25 5.25 0 0 0 1.538-3.712l.003-2.024a.668.668 0 0 1 .198-.471 1.575 1.575 0 1 0-2.228-2.228 3.818 3.818 0 0 0-1.12 2.687M6.9 7.575V12m6.27 4.318A4.49 4.49 0 0 1 16.35 15m.002 0h-.002" />
                </svg>
                <h1 class="text-4xl font-semibold leading-6 text-gray-900">bonjour, <c:out value="${sessionScope.userEmail}" default="Utilisateur" /> </h1>
            </div>

            <h3 class="text-base font-semibold leading-6 text-gray-900">Statistiques des employés</h3>

            <!-- Section des statistiques des employés -->
            <dl class="mt-2 grid grid-cols-1 gap-5 sm:grid-cols-3">
                <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 border border-[2px] border-black">
                    <dt class="truncate text-sm font-medium text-gray-500">Nouveaux employés ce mois-ci</dt>
                    <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900">${totalEmployeesThisMonth}</dd>
                </div>
                <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 border border-[2px] border-black">
                    <dt class="truncate text-sm font-medium text-gray-500">Total des employés</dt>
                    <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900">${totalEmployees}</dd>
                </div>
                <div class="overflow-hidden rounded-lg bg-white px-4 py-5 shadow sm:p-6 border border-[2px] border-black">
                    <dt class="truncate text-sm font-medium text-gray-500">Total des admins</dt>
                    <dd class="mt-1 text-3xl font-semibold tracking-tight text-gray-900">${totalAdmins}</dd>
                </div>
            </dl>
        </div>
    </div>

    <div id="my-account" class="bg-white rounded-xl ml-12 pl-12 pr-12 pt-8 mt-12 mr-12 rounded-xl border border-[3px] border-black">

        <div class="flex flex-row items-center mb-6 ">
            <div class="h-12 mr-3">

                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" data-slot="icon" class="w-12 h-12">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                </svg>
            </div>
            <div class="h-12 flex flex-col justify-center items-center">
                <h1 class="text-4xl font-semibold leading-6 text-gray-900">
                    mon compte
                </h1>
            </div>

        </div>
        <h3 class="text-base font-semibold leading-6 text-gray-900 mb-4">
            Modifier votre compte
        </h3>
        <div id="icone" class="grid grid-cols-1 gap-5 sm:grid-cols-3">
            <div id="icone-update-profile" class="overflow-hidden rounded-lg bg-white  shadow border border-[2px] border-black">

                <div class="w-full h-full flex flex-col justify-center items-center">
                    <a href="updateAdmin?id=${loggedInEmployee.id}" class="w-32 h-24 text-black hover:text-blue-800 flex flex-col justify-center items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" data-slot="icon" class="w-12 h-12">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                        </svg>

                        Modifier

                    </a>
                </div>



            </div>

            <div class="w-full h-full rounded-lg bg-white shadow border border-[2px] border-black flex justify-center items-center">
                <a href="/logout" class="w-32 h-24 flex-col justify-center items-center hover:text-blue-800 ">

                    <div class="w-full h-full flex flex-col justify-center items-center bg-red-100 rounded-lg">
                        <div class="w-full flex justify-center">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" data-slot="icon" class="w-10 h-10">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" />
                            </svg>
                        </div>
                        <div class="w-full flex justify-center">
                            <span class="w-full flex justify-center items-center">Déconnexion</span>
                        </div>
                    </div>

                </a>
            </div>

        </div>

    </div>


</div>


<div class="w-full flex flex-col">

    <div id="add-employee" class="w-1/2 bg-white p-6 mt-10 mb-10 ml-10 mr-1 rounded-xl shadow-md border border-[3px] border-black">
        <button id="toggleFormButton" class="bg-orange-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">
            <h2 class="text-2xl font-bold underline mb-6">Ajouter un employé !</h2>
        </button>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <div id="addEmployeeForm" style="display: none;">

            <form action="/addEmployee" method="post" class="space-y-4">
            <input type="hidden" name="employee_number" value="9">

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


    </div>

    <div id="show-employee" class="w-[90%] bg-white p-6 ml-2 mt-10 mr-7 border border-[3px] border-black rounded-xl shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Voir la liste des employés!</h2>
        <div class="flex justify-between items-center mb-6">
            <div class="relative w-1/2">
                <input type="search" id="search" placeholder="Rechercher" class=" border border-gray-300 text-neutral-400 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-60 pl-10 p-2.5">
                <div class="absolute inset-y-0 left-0 pl-2 flex items-center pointer-events-none">
                    <img src="/assets/search.png" alt="search" class="w-5">
                </div>
            </div>


            <form action="/filter" method="post" class="space-y-4">
                <%--                file deroulante--%>
                <div class="flex space-x-3">
                    <select name="filterPole" class="px-3 py-2 w-40 border border-gray-300 text-neutral-400 rounded-md focus:outline-none focus:ring focus:border-blue-500">
                        <option value="" >Slectionner</option>
                        <option value="Autre" >Autre</option>
                        <option value="commercial" >Commercial et Marketing</option>
                        <option value="financial" >Financier</option>
                        <option value="operations" >Opérations et Production</option>
                        <option value="humanResources" >Ressources Humaines (RH)</option>
                        <option value="researchDevelopment" >Recherche et Développement (R&D) / Innovation</option>
                    </select>

                    <select name="trie" class="px-3 py-2 border text-neutral-400 border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-500">
                        <option value="" >Trier</option>
                        <option value="asc" >Croissant</option>
                        <option value="desc" >Decroissant</option>
                    </select>

                    <button type="submit" class="bg-orange-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">Valider</button>
                </div>

            </form>



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
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Modifier</th>
                <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Supprimer</th>

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
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <a href="updateEmployee?id=${employee.id}" class="text-blue-500 hover:text-blue-800">Modifier</a>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                        <form action="/deleteEmployee" method="post">
                            <input type="hidden" name="id" value="${employee.id}" />
                            <button type="submit" class="text-red-500 hover:text-red-800">Supprimer</button>
                        </form>
                    </td>
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

        if(searchTerm.length > 0) {
            fetch('/search?term=' + encodeURIComponent(searchTerm))
                .then(response => response.json())
                .then(data => {
                    resultsDiv.innerHTML = '';
                    if (data.length === 0) {
                        resultsDiv.innerHTML = '<p class="text-gray-700 text-center">Aucun résultat trouvé</p>';
                    } else {
                        let tableHtml = '<div class="mb-5"><table class="min-w-full divide-y divide-gray-200">' +
                            '<thead class="bg-gray-50">' +
                            '<tr>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Numéro de tél</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prénom</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nom</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date d\'embauche</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Pôle d\'activité</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rôle</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Modifier</th>' +
                            '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Supprimer</th>' +
                            '</tr>' +
                            '</thead>' +
                            '<tbody class="bg-white divide-y divide-gray-200">';

                        data.forEach(emp => {
                            tableHtml += '<tr>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["employeePhone"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["firstName"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["lastName"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["email"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["hireDate"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["pole"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' + emp["role"] + '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' +
                                '<a href="updateEmployee?id=' + emp["id"] + '" class="text-blue-500 hover:text-blue-800">Modifier</a>' +
                                '</td>' +
                                '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">' +
                                '<form action="/deleteEmployee" method="post">' +
                                '<input type="hidden" name="id" value="' + emp["id"] + '" />' +
                                '<button type="submit" class="text-red-500 hover:text-red-800">Supprimer</button>' +
                                '</form>' +
                                '</td>' +
                                '</tr>';
                        });

                        tableHtml += '</tbody></table></div><p class="text-gray-600 text-center mt-3 p-6 border-b-[2px] border-black">' + data.length + ' résultats trouvés</p>';
                        resultsDiv.innerHTML = tableHtml;
                    }
                })
                .catch(error => console.error('Error:', error));
        } else {
            resultsDiv.innerHTML = '<p class="text-gray-700 text-center">Commencez à taper pour rechercher...</p>';
        }
    });

    // Gestionnaire d'événement pour afficher/cacher le formulaire
    document.getElementById('toggleFormButton').addEventListener('click', function() {
        var form = document.getElementById('addEmployeeForm');
        if (form.style.display === 'none' || form.style.display === '') {
            form.style.display = 'block';
            this.textContent = 'Cacher le formulaire';
        } else {
            form.style.display = 'none';
            this.textContent = 'Ajouter un employé';
        }
    });
</script>

