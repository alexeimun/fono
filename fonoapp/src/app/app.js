(function ()
{
    'use strict';
    angular.module('app', ['ngMaterial']).run(function ($http)
    {
        $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
    });
})();
