(function ()
{
    angular.module('app').controller('MainController',
        ['navService', '$mdSidenav', '$mdBottomSheet', '$log', '$q', '$state', '$mdToast', 'evaluadorService',
            MainController
        ]);

    function MainController(navService, $mdSidenav, $mdBottomSheet, $log, $q, $state, $mdToast, evaluadorService)
    {
        if (!evaluadorService.getEvaluador())
        {
            $state.go('login');
        }
        var vm = this;
        vm.evaluador = evaluadorService.getEvaluador();
        vm.menuItems = [];
        vm.selectItem = selectItem;
        vm.toggleItemsList = toggleItemsList;
        vm.showActions = showActions;
        vm.title = $state.current.data.title;
        vm.showSimpleToast = showSimpleToast;
        vm.toggleRightSidebar = toggleRightSidebar;

        navService.loadAllItems().then(function (menuItems)
        {
            vm.menuItems = [].concat(menuItems);
        });

        function toggleRightSidebar()
        {
            $mdSidenav('right').toggle();
        }

        function toggleItemsList()
        {
            var pending = $mdBottomSheet.hide() || $q.when(true);

            pending.then(function ()
            {
                $mdSidenav('left').toggle();
            });
        }

        function selectItem(item)
        {
            vm.title = item.name;
            vm.toggleItemsList();
            vm.showSimpleToast(vm.title);
        }

        function showActions($event)
        {
            $mdBottomSheet.show({
                parent: angular.element(document.getElementById('content')),
                templateUrl: 'app/views/partials/bottomSheet.html',
                controller: ['$mdBottomSheet', 'evaluadorService', '$state', SheetController],
                controllerAs: "vm",
                bindToController: true,
                targetEvent: $event
            });

            function SheetController($mdBottomSheet, evaluadorService, $state)
            {
                var vm = this;

                vm.logout = function ()
                {
                    $mdBottomSheet.hide();
                    evaluadorService.removeEvaluador();
                    location.href = '';
                }
            }
        }

        function showSimpleToast(title)
        {
            $mdToast.show(
                $mdToast.simple()
                    .content(title)
                    .hideDelay(2000)
                    .position('bottom right')
            );
        }
    }
})();
