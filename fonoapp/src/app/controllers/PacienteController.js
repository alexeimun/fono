(function ()
{
    angular.module('app').controller('PacienteController', ['$state', 'evaluadorService', 'pacienteService', PacienteController]);

    function PacienteController($state, evaluadorService, pacienteService)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }

        var vm = this;

        vm.createPaciente = evaluadorService.getEvaluador().SCOPE == 1;
        vm.removePaciente = function (id)
        {
            pacienteService.deletePaciente(id).then(function (response)
            {
                location.reload();
            }, function ()
            {
                console.log('error');
            });
        }

        vm.getPacientes = function ()
        {
            pacienteService.getPacientes().then(function (response)
            {
                vm.pacientes = response;
            }, function ()
            {
                console.log('error');
            });
        };
        vm.getPacientes();
    }
})();