angular.module('usersApp').factory('UserResource', ['$resource', function($resource) {
  return $resource('/users/:id', {id: '@id'}, {
    query: {method: 'get', isArray: false}
  });
}]);
