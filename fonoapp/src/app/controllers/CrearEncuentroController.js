(function ()
{
    angular.module('app').controller('CrearEncuentroController', ['$state', 'evaluadorService', 'pacienteService', 'encuentroService', CrearEncuentroController]);

    function CrearEncuentroController($state, evaluadorService, pacienteService, encuentroService)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }

        var vm = this;
        vm.paciente = 0;

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


        vm.onSubmit = function ()
        {
            var idPaciente = vm.pacientes.filter(function (e)
            {
                return e.ID_PACIENTE == vm.paciente;
            })[0];

            encuentroService.postEncuentro({
                ID_PACIENTE: idPaciente.ID_PACIENTE,
                ID_EVALUADOR: evaluadorService.getEvaluador().ID_EVALUADOR
            });
            evaluadorService.setPaciente(idPaciente);
            window.open(location.origin + "/#pacienteprueba", "Prueba del paciente", "status=1");
            $state.go('evaluadorprueba');
        }
    }
})();