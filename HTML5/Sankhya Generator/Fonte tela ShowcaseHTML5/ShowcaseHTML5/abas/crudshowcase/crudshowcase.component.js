/**
 * Created by bruno.brandao on 27/09/2017.
 */
angular
    .module('ShowcaseHTML5App')
    .component('crudShowcase', {
      templateUrl: 'html5/ShowcaseHTML5/abas/crudshowcase/crudshowcase.tpl.html',
      controller: 'CRUDShowcaseController'
    }).controller('CRUDShowcaseController', [
  '$q',
  function ($q) {
    var self = this;

    self.myDS;

    self.onDatasetCreated = onDatasetCreated;
    self.saveHandler = saveHandler;
    self.removeHandler = removeHandler;
    self.refreshHandler = refreshHandler;

    function saveHandler(request) {
      console.log(request);
      //No saveHandler não é necessário retornar algo, o dataset irá guardar como salvo a linha em memoria.
      //Mas geralmente, após salvarmos um registro esse pode ser modificado por triggers ou listeners no servidor
      //então nesses casos devemos retornar para o dataset a versão atualizada do registro salvo.

      //Apenas para demonstrar uma alteração que o o servidor faria
      var currentRow = self.dsStandAlone.getCurrentRow();

      currentRow[0] = 'Campo Modificado';

      return [
        currentRow
      ];
    }

    function removeHandler(request) {
      console.log(request);
    }

    function refreshHandler(request) {
      console.log(request);

      return $q(function (resolve, reject) {
        //Simulando uma carga assíncrona
        //chame a função "reject" para abortar a carga
        setTimeout(function () {
          resolve([
            ['Campo1', 1],
            ['Campo1', 2],
            ['Campo1', 3],
            ['Campo1', 4]
          ]);
        }, 3000);
      });
    }

    function onDatasetCreated(dataset) {
      if (dataset.getEntityName() == 'Cidade') {
        self.dsCidade = dataset;
      } else {
        self.dsStandAlone = dataset;
      }

      dataset.addCriteriaProvider(new CriteriaProvider(Criteria('this.CODCID > 0')));

      dataset.initAndRefresh().then(function () {
        console.log('Refresh realizado');
      });
    }

  }]);