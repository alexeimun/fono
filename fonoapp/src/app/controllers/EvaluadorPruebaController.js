(function ()
{
    angular.module('app')
        .filter('trustedAudioUrl', function ($sce)
        {
            return function (audioFile)
            {
                return $sce.trustAsResourceUrl(audioFile);
            };
        })
        .controller('EvaluadorPruebaController', ['$state', 'evaluadorService', 'pruebaService', 'urlBunch', '$timeout', EvaluadorPruebaController]);

    function EvaluadorPruebaController($state, evaluadorService, pruebaService, urlBunch, $timeout)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }

        var vm = this;
        vm.total = '';
        vm.time = {seg: 0, min: 0};
        vm.timeQuestion = {seg: 0, min: 0};
        vm.paciente = evaluadorService.getPaciente();
        vm.index = 45;
        vm.instructionIndex = -1;
        vm.questions = [];
        vm.questionItems = [];
        vm.cleanSelect = false;
        vm.imagesPatient = [];
        vm.allImages = [];
        vm.allRawImages = [];
        vm.selectedObjects = [];
        vm.randomButtonValue = -1;
        vm.multipleInstructionIndex = -1;
        vm.patientResponse = [];
        vm.waitaingPatientResponse = false;
        vm.totalTimeQuestion = '';
        vm.summary = false;
        vm.objects = [];
        //Evaluación
        vm.isEvaluating = false;
        vm.assignment = {
            RESPONDIO: 0,
            ID_PREGUNTA: vm.index + 1
        };

        vm.renderResponse = function ()
        {
            return vm.patientResponse.map(function (img)
                {
                    return img.TITULO_IMAGEN;
                }).join(', ') || 'Esperando respuesta...';
        }
        pruebaService.getImagesTitles().then(function (images)
        {
            vm.allImages = images;
            vm.allRawImages = vm.allImages.map(function (img)
            {
                return img['NOMBRE_IMAGEN'];
            });
        });

        pruebaService.getQuestionItems().then(function (items)
        {
            pruebaService.getQuestions().then(function (items2)
            {
                angular.forEach(items2, function (item)
                {
                    angular.extend(item, items[item.idManual - 1]);
                });
                vm.questions = items2;
                //Restart values
                pruebaService.setQuestions(vm.questions);
                pruebaService.setCuerrentIndex(vm.index);
                pruebaService.setContinueInstruction(false);
                pruebaService.setCurrentInstruction(null);
                pruebaService.setImagesPatient(null);
                pruebaService.setPatientResponse(null);
                pruebaService.setMultipleCurrentInstruction(null);
                vm.getImagesPatient(5000);
                vm.response();
                //Restart values
            }, function ()
            {
                console.log('error');
            });
        }, function ()
        {
            console.log('error');
        });
        vm.changeInstruction = function (index)
        {
            pruebaService.setCurrentInstruction(index);
            vm.getImagesPatient(800);
        }
        vm.changemultipleInstruction = function (index)
        {
            pruebaService.setMultipleCurrentInstruction(index);
            vm.getImagesPatient(800);
        }

        vm.sendQuestion = function ()
        {
            pruebaService.postRespuestaevaluador(vm.assignment);
            pruebaService.postRespuestapaciente({
                RESPUESTA: vm.renderResponse(),
                ID_PREGUNTA: vm.index + 1,
                TIEMPO_RESPUESTA: vm.totalTimeQuestion
            });
        }
        vm.nextQuestion = function ()
        {
            if (vm.index != 45)
            {
                vm.index++;
                vm.sendQuestion();
                vm.isEvaluating = false;
                vm.patientResponse = [];
                vm.instructionIndex = -1;
                pruebaService.setCurrentInstruction(null);
                pruebaService.setCuerrentIndex(vm.index);
                pruebaService.setImagesPatient(null);
                pruebaService.setPatientResponse(null);
                vm.cleanSelect = true;
                vm.imagesPatient = [];
                vm.prepareType();

                $timeout(function ()
                {
                    vm.cleanSelect = false;
                }, 10);

                vm.otherSettings();
                vm.timeQuestion = {seg: 0, min: 0};
            }
            else
            {
                vm.total = vm.time.min + ':' + vm.time.seg;
                pruebaService.postEncuentroTiempo({TIEMPO_REALIZACION: vm.total})
                vm.summary = true;
            }
        }

        vm.otherSettings = function ()
        {
            //Keep showing dynamic instructions?
            if (vm.questions[vm.index].dynamicInstructions)
            {
                pruebaService.setContinueInstruction(true);
            }
            else
            {
                pruebaService.setContinueInstruction(false);
            }
            if (vm.index - 1 != -1 && vm.questions[vm.index - 1].type == 'multiple')
            {
                pruebaService.setMultipleCurrentInstruction('exit');
            }
            vm.response();
        }
        vm.response = function ()
        {
            if (vm.questions[vm.index].ap)
            {
                vm.waitaingPatientResponse = true;
                vm.waitPatientResponse = function ()
                {
                    $timeout(function ()
                    {
                        vm.addResponse();
                        vm.waitPatientResponse();
                    }, 1000);
                }
                if (vm.waitaingPatientResponse)
                {
                    vm.waitPatientResponse();
                }
            }
            else
            {
                vm.waitaingPatientResponse = false;
            }
        }
        vm.addResponse = function ()
        {
            var res = pruebaService.getPatientResponse();
            if (res)
            {
                res = vm.queryImages([res])[0];
                if (vm.patientResponse.indexOf(res) < 0)
                {
                    vm.patientResponse.push(res);
                }
            }
        }
        vm.sendPatientImages = function ()
        {
            var imgs = vm.selectedObjects.map(function (img)
            {
                return img.split('/')[img.split('/').length - 1].replace('.png', '');
            });
            pruebaService.setImagesPatient(imgs.join(','));
        }
        vm.getImagesPatient = function (time)
        {
            $timeout(function ()
            {
                vm.imagesPatient = vm.queryImages(pruebaService.getImagesPatient());
            }, time);
        }

        vm.randomImages = function ()
        {
            pruebaService.setCurrentInstruction(++vm.randomButtonValue);
            vm.getImagesPatient(600);
        }


        vm.prepareType = function ()
        {
            if (vm.questions[vm.index].type == 'sort')
            {
                if (vm.index == 15)
                {
                    vm.selectedObjects = [];
                    vm.objects = [
                        {name: 'Perro', url: urlBunch.images.image + 'perro.png'},
                        {name: 'Gato', url: urlBunch.images.image + 'gato.png'},
                        {name: 'Pato', url: urlBunch.images.image + 'pato.png'},
                        {name: 'Sillas', url: urlBunch.images.image + 'sillas.png'},
                        {name: 'Mesa', url: urlBunch.images.image + 'mesa.png'},
                        {name: 'Pelota', url: urlBunch.images.image + 'pelota.png'},
                    ];
                }
                else
                {
                    vm.objects = [
                        {category: 'Cocina', name: 'Cucharón', url: urlBunch.images.image + 'cucharon.png'},
                        {category: 'Cocina', name: 'Estufa', url: urlBunch.images.image + 'estufa.png'},
                        {category: 'Cocina', name: 'Olla', url: urlBunch.images.image + 'olla.png'},
                        {category: 'Animales', name: 'Pato', url: urlBunch.images.image + 'pato.png'},
                        {category: 'Animales', name: 'Jirafa', url: urlBunch.images.image + 'jirafa.png'},
                        {category: 'Animales', name: 'León', url: urlBunch.images.image + 'leon.png'},
                        {category: 'Animales', name: 'Vaca', url: urlBunch.images.image + 'vaca.png'},
                        {category: 'Animales', name: 'Gato', url: urlBunch.images.image + 'gato.png'},
                        {category: 'Animales', name: 'Perro', url: urlBunch.images.image + 'perro.png'},
                        {category: 'Muebles', name: 'Cama', url: urlBunch.images.image + 'cama.png'},
                        {category: 'Muebles', name: 'Mesa', url: urlBunch.images.image + 'mesa.png'},
                        {category: 'Muebles', name: 'Sillas', url: urlBunch.images.image + 'sillas.png'},
                    ];
                }
            }
            else if (vm.questions[vm.index].type == 'single')
            {
                vm.getImagesPatient(800);
            }
        }
        vm.timer = function ()
        {
            $timeout(function ()
            {
                vm.time.seg++;
                if (vm.time.seg == 60)
                {
                    vm.time.seg = 0;
                    vm.time.min++;
                }
                if (!vm.summary)
                {
                    vm.timer();
                }
            }, 1000);
        }
        vm.timerQuestion = function ()
        {
            $timeout(function ()
            {
                vm.timeQuestion.seg++;
                if (vm.timeQuestion.seg == 60)
                {
                    vm.timeQuestion.seg = 0;
                    vm.timeQuestion.min++;
                }
                if (!vm.summary)
                {
                    vm.timerQuestion();
                }
            }, 1000);
        }
        vm.timerQuestion();
        vm.timer();
        vm.prepareAudio = function (audios)
        {
            var material = [];
            if (audios)
            {
                audios = audios.split(',')
                angular.forEach(audios, function (audio)
                {
                    material.push(urlBunch.audios.audio + audio + '.mp3');
                });
            }
            return material;
        }

        vm.evaluate = function ()
        {
            vm.assignment = {
                RESPONDIO: 0,
                ID_PREGUNTA: vm.index + 1
            };
            vm.totalTimeQuestion = vm.timeQuestion.min + ':' + vm.timeQuestion.seg;
            vm.isEvaluating = true;
        }
        vm.queryImages = function (images)
        {
            var list = [];
            angular.forEach(images, function (img)
            {
                list.push(vm.allImages[vm.allRawImages.indexOf(img.split('/')[img.split('/').length - 1].replace('.png', ''))]);
                // console.log(list[list.length - 1], img)
                list[list.length - 1].url = img;
            });
            return list;
        }
    }
})();