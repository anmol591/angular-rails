(function () {
    'use strict';

    angular
        .module('myApp')
        .controller('Register1Controller', Register1Controller);

    Register1Controller.$inject = ['UserService', '$location', '$rootScope', 'FlashService'];
    function Register1Controller(UserService, $location, $rootScope, FlashService) {
        var vm = this;

        vm.register1 = register1;

        function register1() {
            vm.dataLoading = true;
            UserService.Create1(vm.company)
                .then(function (response) {
                    if (response.success) {
                        FlashService.Success('Registration successful', true);
                        $location.path('/login');
                    } else {
                        FlashService.Error(response.message);
                        vm.dataLoading = false;
                    }
                });
        }
    }

})();
