(function ()
{
    'use strict';

    angular.module('app').service('urlBunch', [urlBunch]);

    function urlBunch()
    {
        var hostname = 'http://localhost/fonorest';
        return {
            //Encuentros available urls
            encuentros: {
                encuentros: hostname + '/encuentros',
            },
            //Evaluadores available urls
            evaluadores: {
                evaluadores: hostname + '/evaluadores',
                evaluadorlogin: hostname + '/evaluadores/evaluadorlogin', //Login a user
            },
            //Pacientes available urls
            pacientes: {
                pacientes: hostname + '/pacientes',
            },
            //Pruebas available urls
            prueba: {
                questions: '/assets/items.json',
                questionItems: hostname + '/pruebas/questions',
                respuestaevaluador: hostname + '/pruebas/respuestaevaluador',
                encuentrotiempo: hostname + '/pruebas/encuentrotiempo',
                respuestapaciente: hostname + '/pruebas/respuestapaciente',
            },
            //Images available urls
            images: {
                image: hostname + '/images/',
                imageserver: hostname + '/pruebas/images'
            },
            //Audios available urls
            audios: {
                audio: hostname + '/sounds/'
            }
        }
    }
})();
