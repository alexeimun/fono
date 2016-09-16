'use strict';

angular.module('angularMaterialAdmin', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ui.router', 'ngMaterial', 'nvd3', 'app'])

    .config(function ($stateProvider, $urlRouterProvider, $mdThemingProvider, $mdIconProvider)
    {
        $stateProvider.state('home', {
            url: '',
            templateUrl: 'app/views/main.html',
            controller: 'MainController',
            controllerAs: 'vm',
            abstract: true
        })
            .state('login', {
                url: '/',
                templateUrl: 'app/views/login.html',
                controller: 'LoginController',
                controllerAs: 'vm'
            })
            .state('home.dashboard', {
                url: '/dashboard',
                templateUrl: 'app/views/dashboard.html',
                data: {
                    title: 'Dashboard'
                }
            })
            .state('home.profile', {
                url: '/profile',
                templateUrl: 'app/views/profile.html',
                controller: 'ProfileController',
                controllerAs: 'vm',
                data: {
                    title: 'Profile'
                }
            })
            /////////////////Evaluadores
            .state('home.evaluadores', {
                url: '/evaluadores',
                templateUrl: 'app/views/evaluadores/evaluadores.html',
                controller: 'EvaluadorController',
                controllerAs: 'vm',
                data: {
                    title: 'Evaluadores'
                }
            })
            .state('home.crearevaluador', {
                url: '/crearevaluador',
                templateUrl: 'app/views/evaluadores/crearevaluador.html',
                controller: 'CrearEvaluadorController',
                controllerAs: 'vm',
                data: {
                    title: 'Nuevo_Evaluador'
                }
            })
            /////////////////Pacientes
            .state('home.pacientes', {
                url: '/pacientes',
                templateUrl: 'app/views/pacientes/pacientes.html',
                controller: 'PacienteController',
                controllerAs: 'vm',
                data: {
                    title: 'Pacientes'
                }
            })
            .state('home.crearpaciente', {
                url: '/crearpaciente',
                templateUrl: 'app/views/pacientes/crearpaciente.html',
                controller: 'CrearPacienteController',
                controllerAs: 'vm',
                data: {
                    title: 'Nuevo_Paciente'
                }
            })
            /////////////////Encuentros
            .state('home.encuentros', {
                url: '/encuentros',
                templateUrl: 'app/views/encuentros/encuentros.html',
                controller: 'EncuentrosController',
                controllerAs: 'vm',
                data: {
                    title: 'Encuentros'
                }
            })
            .state('home.crearencuentro', {
                url: '/crearencuentro',
                templateUrl: 'app/views/encuentros/crearencuentro.html',
                controller: 'CrearEncuentroController',
                controllerAs: 'vm',
                data: {
                    title: 'Crear_Encuentros'
                }
            })
            /////////////////Pruebas Evaluador/Paciente
            .state('evaluadorprueba', {
                url: '/evaluadorprueba',
                templateUrl: 'app/views/prueba/evaluadorprueba.html',
                controller: 'EvaluadorPruebaController',
                controllerAs: 'vm',
                data: {
                    title: 'Evaluador_Prueba'
                }
            })
            .state('pacienteprueba', {
                url: '/pacienteprueba',
                templateUrl: 'app/views/prueba/pacienteprueba.html',
                controller: 'PacientePruebaController',
                controllerAs: 'vm',
                data: {
                    title: 'Evaluador_Prueba'
                }
            });

        $urlRouterProvider.otherwise('/');

        $mdThemingProvider
            .theme('default')
            .primaryPalette('grey', {
                'default': '600'
            })
            .accentPalette('teal', {
                'default': '500'
            })
            .warnPalette('defaultPrimary');

        $mdThemingProvider.theme('dark', 'default')
            .primaryPalette('defaultPrimary')
            .dark();

        $mdThemingProvider.theme('grey', 'default')
            .primaryPalette('grey');

        $mdThemingProvider.theme('custom', 'default')
            .primaryPalette('defaultPrimary', {
                'hue-1': '50'
            });

        $mdThemingProvider.definePalette('defaultPrimary', {
            '50': '#FFFFFF',
            '100': 'rgb(255, 198, 197)',
            '200': '#E75753',
            '300': '#E75753',
            '400': '#E75753',
            '500': '#E75753',
            '600': '#E75753',
            '700': '#E75753',
            '800': '#E75753',
            '900': '#E75753',
            'A100': '#E75753',
            'A200': '#E75753',
            'A400': '#E75753',
            'A700': '#E75753'
        });

        $mdIconProvider.icon('user', 'assets/images/user.svg', 64);
    });
