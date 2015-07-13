define(['app'],function(app){
app.controller('modalController', function ($rootScope, $modal) {

    $rootScope.modal = {
        remove : function(name, callback) {
          var modalInstance = $modal.open({
            templateUrl: 'modal-confirm',
            controller: 'modalConfirmController',
            size: '', // lg, sm
            resolve: {
              label: function () {
                return name;
              }
            }
          });

          modalInstance.result.then(function (result) {
            if (result === true) {
              callback();
            }
          });
        },
        alert : function(userNotifications, callback) {
          var modalInstance = $modal.open({
            templateUrl: 'modal-alert',
            controller: 'modalAlertController',
            size: '', // lg, sm
            resolve: {
              label: function () {
                return name;
              }
            }
          });

          modalInstance.result.then(function (result) {
            if (result === true) {
              callback();
            }
          });
        }
    };
});

app.controller('modalConfirmController', function ($scope, $modalInstance, label) {

  $scope.label = label;

  $scope.ok = function () {
    $modalInstance.close(true);
  };

  $scope.cancel = function () {
    $modalInstance.close(false);
  };
});

app.controller('modalAlertController', function ($scope, $modalInstance, label) {

  $scope.label = label;

  $scope.ok = function () {
    $modalInstance.close(true);
  };

});
});