/**
 * Created by bruno.brandao on 27/09/2017.
 */
angular
    .module('ShowcaseHTML5App')
    .component('layoutAlignShowcase', {
      templateUrl: 'html5/ShowcaseHTML5/abas/layoutalignshowcase/layoutalignshowcase.tpl.html',
      controller: 'LayoutShowcaseController'
    }).controller('LayoutShowcaseController', [
  function () {
    var self = this;

    self.horizontalAxis = 'center';
    self.verticalAxis = 'center';

    self.getLayoutAlign = getLayoutAlign;
    
    function getLayoutAlign() {
      return self.horizontalAxis + ' ' + self.verticalAxis;
    }

  }]);