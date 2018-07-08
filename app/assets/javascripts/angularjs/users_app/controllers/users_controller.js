(function(){
  angular.module('usersApp').controller('usersApp.usersController', usersController);

  usersController.$inject = [
    '$scope',
    'users'
  ];

  function usersController($scope, users) {
    $scope.users   = users;
    $scope.destroy = function(user_id){
      $scope.Request.destroy_user({id: user_id}, function(data){
        console.log(data);
      });
    }
  }
})();
