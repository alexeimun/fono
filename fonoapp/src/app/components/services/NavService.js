(function ()
{
    'use strict';

    angular.module('app').service('navService', ['$q', 'evaluadorService', navService]);

    function navService($q, evaluadorService)
    {
        var menuItems = [];
        if (evaluadorService.getEvaluador() && evaluadorService.getEvaluador().SCOPE == 1)
        {
            menuItems = [
                {
                    name: 'Tablero',
                    icon: 'dashboard',
                    sref: '.dashboard'
                },
                {
                    name: 'Evaluadores',
                    icon: 'people',
                    sref: '.evaluadores'
                },
                {
                    name: 'Pacientes',
                    icon: 'people',
                    sref: '.pacientes'
                }
            ];
        }
        else
        {
            menuItems = [
                {
                    name: 'Encuentros',
                    icon: 'dashboard',
                    sref: '.encuentros'
                },
                {
                    name: 'Pacientes',
                    icon: 'people',
                    sref: '.pacientes'
                },
            ];
        }

        return {
            loadAllItems: function ()
            {
                return $q.when(menuItems);
            }
        };
    }

})();
