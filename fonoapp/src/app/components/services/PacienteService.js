(function ()
{
    'use strict';

    angular.module('app').service('pacienteService', ['$http', '$q', 'urlBunch', PacienteService]);

    function PacienteService($http, $q, urlBunch)
    {
        return {
            postPaciente: function (data)
            {
                var def = $q.defer();
                $http.post(urlBunch.pacientes.pacientes, $.param(data)).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
            deletePaciente: function (id)
            {
                var def = $q.defer();
                $http.delete(urlBunch.pacientes.pacientes + '?id=' + id).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
            getPacientes: function ()
            {
                var def = $q.defer();
                $http.get(urlBunch.pacientes.pacientes).then(function (response)
                {
                    def.resolve(response.data);

                }, function (response)
                {
                });
                return def.promise;
            }
        }
    }
})();
