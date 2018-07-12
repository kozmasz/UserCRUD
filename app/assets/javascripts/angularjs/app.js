(function(angular, JSON) {
  angular.module('usersApp', [ 'templates', 'ngRoute', 'ngResource' ]);
  angular.module('usersApp').run(['$rootScope', function($rootScope) {
    $rootScope.JSON = JSON;
  }]);
})(angular, JSON);
