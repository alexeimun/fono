(function ()
{
    'use strict';

    angular.module('app').service('evaluadorService', ['$http', '$q', 'urlBunch', EvaluadorService]);

    function EvaluadorService($http, $q, urlBunch)
    {
        return {
            checkEvaluadorLogin: function (data)
            {
                var def = $q.defer();
                $http.post(urlBunch.evaluadores.evaluadorlogin, $.param(data)).then(function (response)
                {
                    def.resolve(response.data);
                }, function (response) {});
                return def.promise;
            },
            postEvaluador: function (data)
            {
                var def = $q.defer();
                $http.post(urlBunch.evaluadores.evaluadores, $.param(data)).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
            deleteEvaluador: function (id)
            {
                var def = $q.defer();
                $http.delete(urlBunch.evaluadores.evaluadores + '?id=' + id).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
            getEvaluadores: function ()
            {
                var def = $q.defer();
                $http.get(urlBunch.evaluadores.evaluadores).then(function (response)
                {
                    def.resolve(response.data);

                }, function (response)
                {
                });
                return def.promise;
            },

            //localStorage User Methods
            getEvaluador: function ()
            {
                return JSON.parse(localStorage.getItem('user'));
            },
            setEvaluador: function (userdata)
            {
                localStorage.setItem('user', JSON.stringify(userdata));
            },
            removeEvaluador: function ()
            {
                localStorage.removeItem('user');
            },
            //localStorage User Methods
            getPaciente: function ()
            {
                return JSON.parse(localStorage.getItem('patient'));
            },
            setPaciente: function (userdata)
            {
                localStorage.setItem('patient', JSON.stringify(userdata));
            },
            removePaciente: function ()
            {
                localStorage.removeItem('patient');
            }
        }
    }
})();
