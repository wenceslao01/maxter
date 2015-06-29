app.controller('providerSearchController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
			$scope.pageSize = 10;
			$scope.currentPage = 1;
			$scope.order='desc';
			$scope.orderField='name';
			$scope.loadPage();
	}

	$scope.loadPage = function() {
		var search = '', pagination, order;
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}
		pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;
		order= '&order=' + $scope.order + '&orderField=' + $scope.orderField;
		$scope.isLoading = true;
		$rootScope.helper.ajax('/provider/search.json?' + search + pagination + order
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.elements = result.entries;
				$scope.totalItems = result.total;
			}
		);
	};
	$scope.changeOrder= function(field, order){
		$scope.orderField= field;
		$scope.order= order;
		$scope.loadPage();
	};


	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/provider/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.id = result.id;
				element.selected.$$isEditing = false;
				element.selected.$$isNew = false;
				$scope.elements.push(element.selected);

				element.selected = { $$isNew:true };
			}
		);
	}

	$scope.update = function(element) {
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $scope.elements.indexOf(element);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/provider/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;
				$scope.elements[index] = element.selected;
			}
		);
	}

	$scope.remove = function(element) {

		if (element.$$isEditing) {
			element.$$isEditing = false;
			return;
		}

		$rootScope.modal.remove(element.first_name, function() {
			element.$$isUpdating = true;
			$rootScope.helper.ajax('/provider/remove.json'
				, { model : element }
				, function(result) {
					var index = $scope.elements.indexOf(element);
					$scope.elements.splice(index, 1);
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
		return element.$$isEditing ? 'providerEdit' : 'view';
	}


	$scope.onPageChange = function() {
		$scope.loadPage();
	};

});
