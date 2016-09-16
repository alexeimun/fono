(function ()
{
    'use strict';

    angular.module('app').service('encuentroService', ['$http', '$q', 'urlBunch', EncuentroService]);

    function EncuentroService($http, $q, urlBunch)
    {
        return {
            postEncuentro: function (data)
            {
                var def = $q.defer();
                $http.post(urlBunch.encuentros.encuentros, $.param(data)).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
        }
    }
})();
