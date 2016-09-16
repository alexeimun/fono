(function ()
{
    angular.module('app').controller('CrearEvaluadorController', ['$state', 'evaluadorService', CrearEvaluadorController]);

    function CrearEvaluadorController($state, evaluadorService)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }

        var vm = this;
        vm.evaluador = {
            NOMBRE_EVALUADOR: '',
            CORREO: '',
            CLAVE: '',
            NUMERO_IDENTIFICACION: '',
            TELEFONO: ''
        };

        vm.onSubmit = function ()
        {
            evaluadorService.postEvaluador(vm.evaluador).then(function (response)
            {
                $state.go('home.evaluadores');
                // console.log(response);

            }, function ()
            {
                console.log('bad');
            });
        }
    }
})();