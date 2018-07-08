angular.module('usersApp', [ 'templates', 'ngRoute', 'ngResource' ]);
angular.module('usersApp').run(['$rootScope', 'Request', function($rootScope, Request) {
  $rootScope.Request = Request;
  $rootScope.Routes  = Routes;
}]);
