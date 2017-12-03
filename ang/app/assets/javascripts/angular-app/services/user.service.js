(function () {
    'use strict';

    angular
        .module('myApp')
        .factory('UserService', UserService);

    UserService.$inject = ['$http'];
    function UserService($http) {
        var service = {};

        
        service.GetByEmailid = GetByEmailid;
        service.Create = Create;
        service.Create1 = Create1;

        return service;

        


        function GetByEmailid(emailId) {
            return $http.get('/api/users/signin' + emailId).then(handleSuccess, handleError('Error getting user by Emailid'));
        }

        function Create(user) {
            return $http.post('/api/users/signup', user).then(handleSuccess, handleError('Error creating user'));
        }
        

        function Create1(company) {
            return $http.post('/api/companys/signup', company).then(handleSuccess, handleError('Error creating company info'));
        }
        

        function handleSuccess(res) {
            return res.data;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
    }

})();
