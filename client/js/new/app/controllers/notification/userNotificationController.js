define(['app'], function(app){

app.controller('userNotificationController', function($scope, $rootScope, $http, $location, authUsers) {

	$scope.init = function() {
		$scope.user = authUsers.getUser();
		$scope.load();
	}

	$scope.load = function() {
		var search = 'model[id_user]=' + $scope.user.id;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/userNotification/search.json?' + search
			, ''
			, function(result) {
				$scope.isLoading = false;
				$rootScope.userNotifications = result.entries;
				$scope.total = result.total;

				if ($rootScope.flagNotifications) {
					if ($rootScope.userNotifications.length > 0) {
						$rootScope.modal.alert($rootScope.userNotifications, function() { });
					}
					$rootScope.flagNotifications = false;
				}
			}
		);
	};

	$scope.delete = function(element) {
		$rootScope.helper.ajax('/userNotification/delete.json'
			, { id : element.id }
			, function(result) {
				var idx = $scope.userNotifications.indexOf(element);
				$scope.userNotifications.deleteAt(idx);
				$scope.total--;
			}
		);
	};

});
});