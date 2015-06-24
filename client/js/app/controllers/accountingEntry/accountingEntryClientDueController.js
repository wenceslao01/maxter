app.controller('accountingEntryClientDueController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.pageSize = 5;
		$scope.currentPage = 1;
		$scope.loadPage();
		$scope.loadBalance();
	}

	$scope.initOnLoaded = function() {
		$scope.isLoading = true;
	  $rootScope.$on('completeLoadClient', function(event, client) {
			$scope.client = client;
			$scope.init();
    });
	}

	$scope.loadPage = function() {
		var search = '';
		if ($scope.searchText != '' && $scope.searchType != undefined) {
			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;
		var idClientSearch = '&model[id_client]==' + $scope.client.id;
		var dueDateSearch = '&model[payment_due_date]>=0';
		var sort = '&sortBy=payment_date&sort=DESC';

		$scope.isLoading = true;
		$rootScope.helper.ajax('/accountingEntry/search.json?' + search + pagination + idClientSearch + dueDateSearch + sort
			, ''
			, function(result) {
				$scope.isLoading = false;
				$scope.elements = result.entries;
				$scope.totalItems = result.total;
				$rootScope.loadRoles($scope);
				$rootScope.loadAccountTypes($scope);
			}
		);
	};

	$scope.loadBalance = function() {
		var idClientSearch = 'id_client=' + $scope.client.id;
		$rootScope.helper.ajax('/accountingEntry/due.json?' + idClientSearch
			, ''
			, function(result) {
				if (result.total == null) {
					result.total = 0;
				}
				var aux = '$' + result.total;
				if (aux.charAt(1) === '-') {
					$scope.balanceNegative = true;
				}
				aux = aux.replace("$-", "-$");
				$scope.balance = aux;
			}
		);
	};

	$scope.insert = function(element) {
		if ($scope.formModel['formNew'].$invalid) {
			return;
		}

		element.$$isUpdating = true;
		element.selected.id_client = $scope.client.id;

		$rootScope.helper.ajax('/accountingEntry/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.id = result.id;
				element.selected.$$isEditing = false;
				element.selected.$$isNew = false;
				$scope.elements.push(element.selected);

				element.selected = { $$isNew:true };
				$scope.loadBalance();
			}
		);
	}

	$scope.getSaldo = function(index) {
		index++;
		var total = 0;
		for (var i = 0; i < index; i++) {
			//if ($scope.elements[i].payment_date != null)  {
				total += ($scope.elements[i].debit - 0) - ($scope.elements[i].credit - 0);
			//}
		}
		return total;
	}

	$scope.update = function(element) {
		if ($scope.formModel['form' + element.id].$invalid) {
			return;
		}

		var index = $scope.elements.indexOf(element);

		element.$$isUpdating = true;
		$rootScope.helper.ajax('/accountingEntry/update.json'
			, { model : element.selected }
			, function(result) {
				element.$$isUpdating = false;
				element.selected.$$isEditing = false;
				$scope.elements[index] = element.selected;
				$scope.loadBalance();
			}
		);
	}

	$scope.remove = function(element) {

		if (element.$$isEditing) {
			element.$$isEditing = false;
			return;
		}

		$rootScope.modal.remove(element.date_created, function() {
			element.$$isUpdating = true;
			$rootScope.helper.ajax('/accountingEntry/remove.json'
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
		return element.$$isEditing ? 'accountingEntryDue/edit' : 'accountingEntryDue/view';
	}


	$scope.onPageChange = function() {
		$scope.loadPage();
	};

});
