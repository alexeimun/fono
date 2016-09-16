(function ()
{
    'use strict';

    angular.module('app').service('pruebaService', ['$http', '$q', 'urlBunch', PruebaService]);

    function PruebaService($http, $q, urlBunch)
    {
        return {
            getQuestions: function ()
            {
                var def = $q.defer();
                $http.get(urlBunch.prueba.questions).then(function (response)
                {
                    def.resolve(response.data.items);

                }, function (response)
                {
                });
                return def.promise;
            },
            getQuestionItems: function ()
            {
                var def = $q.defer();
                $http.get(urlBunch.prueba.questionItems).then(function (response)
                {
                    def.resolve(response.data);

                }, function (response)
                {
                });
                return def.promise;
            },
            postRespuestaevaluador: function (data)
            {
                var def = $q.defer();
                $http.post(urlBunch.prueba.respuestaevaluador, $.param(data)).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
            postRespuestapaciente: function (data)
            {
                var def = $q.defer();
                $http.post(urlBunch.prueba.respuestapaciente, $.param(data)).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
            postEncuentroTiempo: function (data)
            {
                var def = $q.defer();
                $http.post(urlBunch.prueba.encuentrotiempo, $.param(data)).then(function (response)
                {
                    def.resolve(response);
                }, function (response) {});
                return def.promise;
            },
            //localStorage Patient Methods
            getCuerrentQuestion: function ()
            {
                return this.getItem(this.getCuerrentIndex())
            },
            getItem: function (index)
            {
                return JSON.parse(localStorage.getItem('questions'))[index];
            },
            getCuerrentIndex: function ()
            {
                return localStorage.getItem('index');
            },
            setCuerrentIndex: function (index)
            {
                localStorage.setItem('index', index);
            },
            setQuestions: function (questions)
            {
                localStorage.setItem('questions', JSON.stringify(questions));
            },
            //localStorage Patient Intructions Methods
            getCurrentInstruction: function ()
            {
                return JSON.parse(localStorage.getItem('indexInstruction'));
            },
            setCurrentInstruction: function (index)
            {
                localStorage.setItem('indexInstruction', index);
            },
            getMultipleCurrentInstruction: function ()
            {
                return JSON.parse(localStorage.getItem('multipleIndexInstruction'));
            },
            setMultipleCurrentInstruction: function (index)
            {
                localStorage.setItem('multipleIndexInstruction', index);
            },
            getContinueInstruction: function ()
            {
                return JSON.parse(localStorage.getItem('continueInstruction'));
            },
            setContinueInstruction: function (flag)
            {
                localStorage.setItem('continueInstruction', flag);
            },
            //localStorage images Syncrhonic
            getImagesTitles: function ()
            {
                var def = $q.defer();
                $http.get(urlBunch.images.imageserver).then(function (response)
                {
                    def.resolve(response.data);

                }, function (response)
                {
                });
                return def.promise;
            },
            getImagesPatient: function ()
            {
                return JSON.parse(localStorage.getItem('patientImages'));
            },
            setImagesPatient: function (images)
            {
                localStorage.setItem('patientImages', JSON.stringify(images));
            },
            //Patient Response
            getPatientResponse: function ()
            {
                return JSON.parse(localStorage.getItem('patientResponse'));
            },
            setPatientResponse: function (image)
            {
                localStorage.setItem('patientResponse', JSON.stringify(image));
            },

        }
    }
})();
