(function ()
{
    angular.module('app').controller('LoginController', ['$state', 'evaluadorService', LoginController]);

    function LoginController($state, evaluadorService)
    {
        if (evaluadorService.getEvaluador())
        {
            $state.go('home.dashboard');
        }

        var vm = this;
        vm.login = {CORREO: "", CLAVE: ""}

        vm.onSubmit = function ()
        {
            evaluadorService.checkEvaluadorLogin(vm.login).then(function (response)
            {
                if (response.status == true)
                {
                    evaluadorService.setEvaluador(response.data);
                    $state.go('home.dashboard');
                }
                else
                {
                    $('#badlogin').show(500);
                    setTimeout(function ()
                    {
                        $('#badlogin').hide(800)
                    }, 3000);
                }
            }, function ()
            {
                $('#badlogin').show(500);
                setTimeout(function () {$('#badlogin').hide(800)}, 3000);
            });
        }
    }
})();