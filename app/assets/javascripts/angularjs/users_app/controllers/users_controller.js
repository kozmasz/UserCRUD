(function(angular){
  angular.module('usersApp').controller('usersApp.usersController', usersController);

  usersController.$inject = [
    '$scope',
    'UserResource'
  ];

  function usersController($scope, UserResource) {
    $scope.pager = {
      page: 1,
      per_page: 25,
    };

    $scope.users = [];

    $scope.reload = function() {
      UserResource.query($scope.pager, function(data) {
        $scope.users = data.users;
        $scope.pager.count = data.count
      });
    }
    $scope.reload();

    $scope.destroy = function(id) {
      UserResource.delete({id: id}, $scope.reload, function(response) {
        console.log(response);
        alert('Felhasználó törlése sikertelen.');
      });
    };

    $scope.user = {
      name: '',
      birth_date: '',
      emails_attributes: []
    };

    $scope.create = function() {
      UserResource.save({user: $scope.user}, $scope.reload, function(response) {
        console.log(response);
        alert('Felhasználó létrehozása nem sikerült');
        $scope.errors = response.data.errors;
      });
    };

    $scope.$watchCollection('[pager.page, pager.per_page]', $scope.reload);
  }
})(angular);
