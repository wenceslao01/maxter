app.controller('accountingEntryViewToDoController', function($scope, $rootScope, $http, $location, $routeParams) {

	$scope.init = function() {
		$scope.isLoading = true;
		$scope.loadPage();
	}

	$scope.loadPage = function() {
		var idSearch = '&model[id]=' + $routeParams.id;
		var fullSearch = '&fullSearch=true';

		$scope.isLoading = true;
		$rootScope.helper.ajax('/accountingEntry/search.json?' + idSearch + fullSearch
			, ''
			, function(result) {
				$scope.isLoading = false;
				console.log(result)
				if (result.entries.length > 0) {
					$scope.element = result.entries[0];
				}
			}
		);
	};

});
