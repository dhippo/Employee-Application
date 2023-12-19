<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Update Employee</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="w-full flex justify-center">
    <div class="w-1/2 max-w-md mx-auto my-8 p-6 border border-gray-200 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold underline mb-6">Update Employee</h2>
        <form action="/employee/update" method="post" class="space-y-4">
            <input type="hidden" name="id" value="${employee.id}" />
            <div>
                <input type="text" name="employeeNumber" value="${employee.employeeNumber}" placeholder="Employee Number" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="firstName" value="${employee.firstName}" placeholder="First Name" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="lastName" value="${employee.lastName}" placeholder="Last Name" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="email" name="email" value="${employee.email}" placeholder="Email" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="password" name="password" value="${employee.password}" placeholder="Password" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="date" name="hireDate" value="${employee.hireDate}" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <input type="text" name="role" value="${employee.role}" placeholder="Role" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300" />
            </div>
            <div>
                <button type="submit" class="w-full bg-blue-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-700">Update</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
