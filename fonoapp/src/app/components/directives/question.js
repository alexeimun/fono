'use strict';

angular.module('app')
    .directive('question', function ()
    {
        return {
            restrict: 'E',
            replace: true,
            transclude: true,
            scope: {index: '=', template: '@', items: '=', instructionIndex: '=', cleanSelect: '='},
            controller: QuestionController,
            templateUrl: 'app/views/partials/question.html',
        };
    }).controller('QuestionController', ['$scope', 'pruebaService']);

function QuestionController($scope, pruebaService)
{
    var vm = $scope;
    vm.questions = {};
    vm.questionItems = {};

    pruebaService.getQuestionItems().then(function (items)
    {
        pruebaService.getQuestions().then(function (items2)
        {
            angular.forEach(items2, function (item)
            {
                angular.extend(item, items[item.idManual - 1]);
            });
            vm.questions = items2;
            pruebaService.setQuestions(vm.questions);
            pruebaService.setCuerrentIndex(0);
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
    }
}
