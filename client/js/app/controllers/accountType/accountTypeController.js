app.controller('accountTypeController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;
		$scope.loadPage();
	}

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;

		$scope.isLoading = true;
		$rootScope.helper.ajax('/accountType/search.json?' + search + pagination
			, ''
			, function(result) {
				$scope.isLoading = false;
				$rootScope.accountTypes = result.entries;
				$scope.totalItems = result.total;
			}
		);
	};

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;

		$rootScope.helper.ajax('/accountType/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;

				element.selected.id = result.id;
				element.selected.$$isEditing = false;
				element.selected.$$isNew = false;
				$rootScope.accountTypes.push(element.selected);

				element.selected = { $$isNew:true };
			}
		);
	}

	$scope.update = function(element) {
		console.log($scope.formModel)
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $rootScope.accountTypes.indexOf(element);

		element.$$isUpdating = true;
		console.log(element.selected);
		$rootScope.helper.ajax('/accountType/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;
				$rootScope.accountTypes[index] = element.selected;
			}
		);
	}

	$scope.remove = function(element) {

		if (element.$$isEditing) {
			element.$$isEditing = false;
			return;
		}

		$rootScope.modal.remove(element.name, function() {
			element.$$isUpdating = true;
			$rootScope.helper.ajax('/accountType/remove.json'
				, { model : element }
				, function(result) {
					var index = $rootScope.accountTypes.indexOf(element);
					$rootScope.accountTypes.splice(index, 1);
					element.$$isUpdating = false;
				}
			);
		});
	}

	$scope.edit = function(element) {
		element.$$isEditing = true;
		element.selected = angular.copy(element);
	}

	$scope.getTemplate = function(element) {
		return element.$$isEditing ? 'edit' : 'view';
	}


	$scope.onPageChange = function() {
		$scope.loadPage();
	};
});
