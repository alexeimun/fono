(function ()
{
    angular.module('app').controller('PacientePruebaController', ['$state', 'evaluadorService', 'pruebaService', '$timeout', 'urlBunch', PacientePruebaController]);

    function PacientePruebaController($state, evaluadorService, pruebaService, $timeout, urlBunch)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }

        var vm = this;
        vm.question = {};
        vm.material = [];
        vm.index = -1;
        vm.indexIntruction = -1;
        vm.multipleInstructionIndex = -1;
        vm.pruebaService = pruebaService;
        vm.cleanSelect = false;

        vm.once = function ()
        {
            $timeout(function ()
            {
                if (pruebaService.getCuerrentIndex() != vm.index)
                {
                    $('body').css({'background': 'white'});
                    vm.material = null;
                    vm.index = pruebaService.getCuerrentIndex();
                    vm.question = pruebaService.getCuerrentQuestion();
                    if (vm.question.ap)
                    {
                        vm.patientEnvironment(pruebaService);
                    }
                    else
                    {
                        $('body').css({'background': 'black'});
                    }
                }
                vm.once();
            }, 2000);
        }
        vm.once();

        vm.patientEnvironment = function ()
        {
            if (vm.question.hasOwnProperty('type'))
            {
                vm.indexIntruction = -1;
                vm.waitInstructionChange();

                switch (vm.question.type)
                {
                    case 'random':
                        vm.material = _.sampleSize(vm.prepareImages(vm.question.material), 8);
                        pruebaService.setImagesPatient(vm.material);
                        break;
                    case 'randomButton':
                        console.log('randomButton');
                        vm.waitImages = function ()
                        {
                            $timeout(function ()
                            {
                                console.log('out');
                                var index = pruebaService.getCurrentInstruction();
                                if (index != null && index != vm.indexIntruction)
                                {
                                    console.log('in');
                                    vm.indexIntruction = index;
                                    vm.material = _.sampleSize(vm.prepareImages(vm.question.material), 8);
                                    pruebaService.setImagesPatient(vm.material);
                                }
                                vm.waitImages();
                            }, 200);
                        };
                        vm.waitImages();
                        break;
                    case 'group':
                        console.log('group');
                        break;
                    case 'pair':
                        console.log('pair');
                        break;
                    case 'multiple':
                        console.log('multiple');
                        vm.waitImages = function ()
                        {
                            $timeout(function ()
                            {
                                // console.log('m out');
                                var index = pruebaService.getMultipleCurrentInstruction();
                                if (index != null && index != 'exit' && index != vm.multipleInstructionIndex)
                                {
                                    // console.log('m in');
                                    vm.multipleInstructionIndex = index;
                                    vm.material = vm.prepareImages(vm.question.secondDynamicInstructions[index]['objects']);
                                    pruebaService.setImagesPatient(vm.material);
                                }
                                if (index != 'exit')
                                {
                                    vm.waitImages();
                                }
                            }, 500);
                        };
                        vm.waitImages();
                        break;
                    case 'sort':
                        vm.waitImages = function ()
                        {
                            $timeout(function ()
                            {
                                var images = pruebaService.getImagesPatient();
                                if (images)
                                {
                                    vm.material = vm.prepareImages(images);
                                    pruebaService.setImagesPatient(null);
                                }
                                if (vm.question.type == 'sort')
                                {
                                    console.log('listening sort...');
                                    vm.waitImages();
                                }
                            }, 1000);
                        }
                        vm.waitImages();
                        break;
                    case 'multimedia':
                        break;
                    case 'single':
                        console.log('single');
                        vm.material = vm.prepareImages(vm.question.material);
                        pruebaService.setImagesPatient(vm.material);
                        break;
                    case 'terna':
                        break;
                }
            }
        }

        vm.waitInstructionChange = function ()
        {
            $timeout(function ()
            {
                var index = pruebaService.getCurrentInstruction();
                console.log('index => ' + index);
                if (index != null && index != vm.indexIntruction)
                {
                    vm.indexIntruction = index;
                    //No visual support
                    if (vm.indexIntruction == 3 && vm.index == 9)
                    {
                        vm.material = [];
                        pruebaService.setImagesPatient(vm.material);
                    }
                    else
                    {
                        console.log(vm.question.dynamicInstructions[index]['objects']);
                        vm.material = vm.prepareImages(vm.question.dynamicInstructions[index]['objects']);
                        pruebaService.setImagesPatient(vm.material);
                    }
                }

                if (pruebaService.getContinueInstruction())
                {
                    vm.waitInstructionChange();
                }
            }, 300);
        };

        vm.response = function (image)
        {
            pruebaService.setPatientResponse(image);
        }
        vm.prepareImages = function (images)
        {
            var material = [];
            images = images.split(',')
            angular.forEach(images, function (image)
            {
                material.push(urlBunch.images.image + image + '.png');
            });
            return material;
        }
    }
})();