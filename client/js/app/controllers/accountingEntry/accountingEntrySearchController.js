app.controller('accountingEntrySearchController', function($scope, $rootScope, $http, $location) {

	$scope.init = function() {
		$scope.isLoading = true;
		$scope.pageSize = 10;
		$scope.currentPage = 1;
		$scope.loadPage();
		$scope.loadBalance();
	}

	$scope.loadPage = function() {
		var search = '';

		var pagination = '&pageSize=' + $scope.pageSize + '&currentPage=' + $scope.currentPage;
		var paymentDateSearch = '&model[payment_date]>=0';
		var sort = '&sortBy=payment_date&sort=DESC';

		if ($scope.searchText != '' && $scope.searchType != undefined) {
			if ($scope.searchType == 'payment_date') {
				var aux = $scope.searchText.split('/');
				if (aux.length > 2) {
					paymentDateSearch = '&model[payment_date]=' + aux[2] + '-' + aux[1] + '-' + aux[0];
				}
			}

			search = 'model[' + $scope.searchType + ']=' + $scope.searchText;
		}

		var dateSearch = '';
		if ($scope.initDate != undefined && $scope.initDate != null && $scope.endDate != undefined && $scope.endDate != null ) {
			dateSearch = '&init=' + $scope.initDate + '&end=' + $scope.endDate;
		}

		$scope.isLoading = true;
		$rootScope.helper.ajax('/accountingEntry/search.json?' + search + pagination + paymentDateSearch + sort + dateSearch
			, ''
			, function(result) {
				$scope.isLoading = false;
				result.entries = result.entries.slice().reverse();
				$scope.elements = result.entries;
				$scope.totalItems = result.total;
				$rootScope.loadClients($scope);
				$rootScope.loadAccountTypes($scope);
			}
		);
	};

	$scope.loadBalance = function() {
		$rootScope.helper.ajax('/accountingEntry/balance.json'
			, ''
			, function(result) {
				if (result.total == null) {
					result.total = 0;
				}
				var aux = '$' + result.total;
				$scope.balanceNegative = aux.charAt(1) === '-';
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
		return element.$$isEditing ? 'accountingEntry/edit' : 'accountingEntry/view';
	}

	$scope.onChangeCredit = function(element) {
		element.selected.debit = 0;
	}

	$scope.onChangeDebit = function(element) {
		element.selected.credit = 0;
	}

	$scope.onPageChange = function() {
		$scope.loadPage();
	};

});
