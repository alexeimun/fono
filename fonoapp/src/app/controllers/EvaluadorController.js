(function ()
{
    angular.module('app').controller('EvaluadorController', ['$state', 'evaluadorService', EvaluadorController]);

    function EvaluadorController($state, evaluadorService)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }

        var vm = this;

        vm.removeEvaluador = function (id)
        {
            evaluadorService.deleteEvaluador(id).then(function (response)
            {
                location.reload();
            }, function ()
            {
                console.log('error');
            });
        }

        vm.getEvaluadores = function ()
        {
            evaluadorService.getEvaluadores().then(function (response)
            {
                vm.evaluadores = response;
            }, function ()
            {
                console.log('error');
            });
        };
        vm.getEvaluadores();
    }
})();