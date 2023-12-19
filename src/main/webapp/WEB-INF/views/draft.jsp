<script>
    document.getElementById('search').addEventListener('input', function(e) {
        var searchTerm = e.target.value;
        var resultsDiv = document.getElementById('search-results');



        if(searchTerm.length > 0) {
            fetch('/search?term=' + encodeURIComponent(searchTerm))
                .then(response => response.json())
                .then(data => {
                    console.log("seacrh")
                    resultsDiv.innerHTML = '<table class="min-w-full leading-normal ">'+
                        '<thead class="rounded-xl">'+
                        '<tr>'+
                        '<th class="rounded-tl-xl px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Numéro</th>'+
                        '<th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Prénom</th>'+
                        '<th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Nom</th>'+
                        '<th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Email</th>'+
                        '<th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Date d \'embauche</th>'+
                        '<th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-center">Rôle</th>'+
                        '<th class="rounded-tr-xl px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider text-right">DELETE</th>'+
                        '</tr>'+
                        '</thead>'+
                        '<tbody>';

                    data.forEach(emp => {
                        resultsDiv.innerHTML += '<tr>' +
                            '<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">' +
                            emp["employeeNumber"] +
                            '</td><td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">' +
                            emp["firstName"] +
                            '</td><td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">' +
                            emp["lastName"] +
                            '</td><td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">' +
                            emp["hireDate"] +
                            '</td><td class="px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">' +
                            emp["role"] +
                            '</td><td class="pl-5 py-5 border-b border-gray-200 bg-white text-sm"><a class="text-white bg-red-500 p-2 rounded-xl text-right">delete</a></td></tr>';
                    });

                    resultsDiv.innerHTML = '</tbody>'+
                        '</table>';
                })
            // .catch(error => console.error('Error:', error));
        }else {
            resultsDiv.innerHTML = '<h1>Aucun résultat</h1>';
        }
    });
</script>