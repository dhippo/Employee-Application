<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Modifier Administrateur</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="text/javascript">
        function showNewPasswordFields() {
            var currentPasswordField = document.getElementById("currentPassword");
            var newPasswordField = document.getElementById("newPassword");
            var confirmNewPasswordField = document.getElementById("confirmNewPassword");
            if (currentPasswordField.value.length > 0) {
                newPasswordField.style.display = "block";
                confirmNewPasswordField.style.display = "block";
            } else {
                newPasswordField.style.display = "none";
                confirmNewPasswordField.style.display = "none";
            }
        }
    </script>
</head>
<body>
<div class="w-full flex justify-center">
    <div class="w-1/2 max-w-md mx-auto my-8 p-6 border border-gray-200 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Modifier Administrateur</h2>

        <form action="/updateAdmin" method="post" class="space-y-4">
            <input type="hidden" name="id" value="${employee.id}"/>
            <input type="hidden" name="admin" value="1"/>

            <!-- Reste du formulaire identique à updateEmployee -->
            <h1 class="text-medium mb-6">Prénom:</h1>
            <div>
                <input type="text" name="firstName" value="${employee.firstName}" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>

            <h1 class="text-medium mb-6">Nom:</h1>
            <div>
                <input type="text" name="lastName" value="${employee.lastName}" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>

            <h1 class="text-medium mb-6">Email:</h1>
            <div>
                <input type="email" name="email" value="${employee.email}" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>

            <h1 class="text-medium mb-6">Modification Mot de Passe:</h1>
            <div>
                <input type="password" id="currentPassword" name="currentPassword" placeholder="Rentrer votre mot de passe actuel ou laissé vide pour ne pas modifier" oninput="showNewPasswordFields()" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div id="newPassword" style="display:none;">
                <input type="password" name="newPassword" placeholder="Nouveau mot de passe" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div id="confirmNewPassword" style="display:none;">
                <input type="password" name="confirmNewPassword" placeholder="Confirmer nouveau mot de passe" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>

            <h1 class="text-medium mb-6">Numéro de téléphone:</h1>
            <div>
                <input type="text" name="employeePhone" value="${employee.employeePhone}" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" pattern="\d{10}" maxlength="10" minlength="10" title="Veuillez saisir un numéro de téléphone valide."/>
            </div>

            <h1 class="text-medium mb-6">Date d'embauche:</h1>
            <div>
                <input type="date" name="hireDate" value="${employee.hireDate}" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>

            <h1 class="text-medium mb-6">Pole d'activité:</h1>
            <div>
                <select required name="pole" value="${employee.pole}" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300">
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
                <input type="text" name="role" value="${employee.role}" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>


            <button type="submit" class="w-full bg-blue-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">Mettre à jour</button>
        </form>
    </div>
</div>
</body>
</html>
