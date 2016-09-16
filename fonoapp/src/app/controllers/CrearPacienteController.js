(function ()
{
    angular.module('app').controller('CrearPacienteController', ['$state', 'evaluadorService', 'pacienteService', CrearPacienteController]);

    function CrearPacienteController($state, evaluadorService, pacienteService)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }

        var vm = this;
        vm.paciente = {
            NOMBRES_PACIENTE: '',
            APELLIDOS_PACIENTE: '',
            SEXO: 0,
            NUMERO_IDENTIFICACION: '',
            DIRECCION_RESIDENCIA: '',
            TELEFONO_RESIDENCIA: '',
            FECHA_NACIMIENTO: '',
            NOMBRE_ACUDIENTE: ''
        };

        vm.sexos = [{text: 'Masculino', value: 0}, {text: 'Femenino', value: 1}];

        vm.onSubmit = function ()
        {
            pacienteService.postPaciente(vm.paciente).then(function (response)
            {
                $state.go('home.pacientes');

            }, function ()
            {
                console.log('bad');
            });
        }
    }
})();