(function(angular) {
  angular.module('usersApp').config(['$routeProvider', function($routeProvider) {
    $routeProvider
      .when('/', { redirectTo: '/felhasznalok' })
      .when('/felhasznalok', {
        templateUrl:  'angularjs/users_app/templates/index.html',
        controller:   'usersApp.usersController',
      })
  }]);


  angular.module('usersApp').config(['$locationProvider', function($locationProvider){
    $locationProvider.hashPrefix('');
  }]);
})(angular);
