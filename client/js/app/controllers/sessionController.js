app.controller('sessionController', function($scope, $rootScope, $http, $location, $routeParams, authUsers) {

  $scope.init = function() {
  }

  $scope.loadPage = function() {
    var search = '';
    if ($scope.searchText != '' && $scope.searchType != undefined) {
      search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
    }

    var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;
    var idClientSearch = '&model[id_client]==' + $scope.client.id;

    $scope.isLoading = true;
    $rootScope.helper.ajax('/session/search.json?' + search + pagination + idClientSearch
      , ''
      , function(result) {
        $scope.isLoading = false;
        $scope.sessions = result.entries;
        $scope.totalItems = result.total;
        $rootScope.temp_sessions = $scope.sessions;
      }
    );
  };

  $scope.onLogin = function() {
    var email = $scope.email;
    var pass = $scope.password;
    var isRemember = $scope.remember == true;

    var user = {
      login : email,
      password : pass
    };

    $scope.isLogging = true;
    authUsers.login(user, $scope.onLogged);
  };

  $scope.onLogged = function(status) {
    $scope.isLogging = false;
    if (status == 'ok') {
      var user = authUsers.getUser();
      $rootScope.usernameLogged = user.first_name;
    } else {
      $scope.loginError = 'Las credenciales ingresadas no son correctas. Por favor, intente iniciar sesión nuevamente.'
    }
  };

});
