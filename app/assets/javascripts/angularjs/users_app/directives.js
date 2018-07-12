(function(angular) {
  angular.module('usersApp').directive('pager', function(){
    return {
      restrict: 'A',
      templateUrl: 'angularjs/users_app/templates/_pager.html',
      scope: {
        data: '=pager',
      },
      link: function(scope) {
        scope.data.per_page = scope.data.per_page || 10;
        scope.$watch('data.per_page', function() { scope.data.page = 1; });

        scope.$watchCollection('[data.count, data.per_page]', function() {
          scope.pages = Math.ceil((scope.data.count || 1) / scope.data.per_page);
        })
        scope.data.page = scope.data.page || 1;

      }
    }
  })
})(window.angular);
