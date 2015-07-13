require.config({
  baseUrl: 'js/lib',
  paths: {
    //AngularJs Version 1.3.14
    'angular': 'angular',
    'angularMap': 'angular-route.min',
    //Bootstrap Core JavaScript
    'bootstrap': 'bootstrap.min',
    //UI-Bootstrap Core JavaScript
    'angularL': 'angular-locale_es-es',
    'uiBootstrap': 'ui-bootstrap-tpls-0.12.1.min',
    'datepicker': 'datepicker',
    'lodash': 'lodash.min',
    'angularGoogle': 'angular-google-maps.min',
    'chart': 'chart.min',
    'jQuery': 'jQuery.min',
    //Utils
    'prototypes': '../app/utils/prototypes',
    //app
    'app': '../app/app',
    //controllers
    'sessionController': '../app/controllers/sessionController'
  },
});
require(
{
  shim: {
    'angularMap':{
      deps: ['angular'],
      exports: 'angularMap'
    },
    'bootstrap':{
      deps: ['jQuery'],
    },
    'angularL':{
      deps: ['angular', 'angularMap'],
      exports: 'angularL'
    },
    'uiBootstrap':{
      deps: ['angular', 'angularL', 'angularMap'],
      exports: 'uiBootstrap'
    },
    'datepicker':{
      deps: ['angular'],
    },
    'angularGoogle':{
      deps: ['angular'],
      exports: 'angularGoogle'
    },
    'jQuery':{
      exports: '$'
    },
    'lodash':{
      exports:'lodash'
    },
    'app':{
      deps: ['angular',
      'angularMap',
      'bootstrap',
      'uiBootstrap',
      'angularL',
      'jQuery',
      'angularGoogle']
    },
    'angular': {
      exports: 'angular'
    },
    'sessionController':{
      deps: ['app', 'angularMap'],
      exports: 'sessionController'
    }
  }
},
[
   'jQuery','app', 'datepicker', 'bootstrap', 'uiBootstrap', 'lodash', 'sessionController'
], function($, app){
  angular.bootstrap(document, ['app']);
}
);