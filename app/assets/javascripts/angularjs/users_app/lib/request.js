angular.module('usersApp').factory('Request', ['$resource', function($resource) {
  function Request(attributes) {
    this.method  = attributes.method  || 'GET';
    this.url     = attributes.url + '?:params';
    this.isArray = attributes.isArray || false;
  };

  var requests = {
    users:         new Request({ method: 'GET',    isArray: true, url: Routes.users_path({ format: 'json' }) }),
    destroy_user:  new Request({ method: 'DELETE',                url: Routes.user_path({ id: ':id' }) }),
  };

  return $resource('', {}, requests);
}]);
