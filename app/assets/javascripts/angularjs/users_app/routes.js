angular.module('usersApp').config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/', { redirectTo: '/felhasznalok' })
    .when('/felhasznalok', {
      templateUrl:  'angularjs/users_app/templates/index.html',
      controller:   'usersApp.usersController',
      controllerAs: 'controller',
      resolve: {
        users: function(Request, $route){
          return Request.users(function(data){
            return data;
          });
        }
      }
    })
}]);


angular.module('usersApp').config(['$locationProvider', function($locationProvider){
  $locationProvider.hashPrefix('');
}]);
