/**
 * Created by bruno.brandao on 27/09/2017.
 */
angular
    .module('ShowcaseHTML5App')
    .component('dynaformShowcase', {
      templateUrl: 'html5/ShowcaseHTML5/abas/dynaformshowcase/dynaformshowcase.tpl.html',
      controller: 'DynaformShowcaseController'
    }).controller('DynaformShowcaseController', [
  'ObjectUtils', 'AngularUtil', 'KeyboardManager', 'MessageUtils',
  function (ObjectUtils, AngularUtil, KeyboardManager, MessageUtils) {
    var self = this;

    //Interceptors
    ObjectUtils.implements(self, IFormInterceptor);

    self.onClickBtnAdicional = onClickBtnAdicional;

    //Ciclo de vida do Dynaform
    self.onDynaformLoaded = onDynaformLoaded;
    self.customTabsLoader = customTabsLoader;
    self.otherOptionsLoader = otherOptionsLoader;

    //Implementações da interface IFormInterceptor
    self.interceptBuildField = interceptBuildField;
    self.buildFieldContainer = buildFieldContainer;

    var _dynaform;
    var _dataset;

    init();

    function init() {
      KeyboardManager.bind('ctrl+alt+F', function() {
        console.log('Atalho');
      });
    }

    function showInfo(text) {
      MessageUtils.showInfo(text);
    }

    function onClickBtnAdicional() {
      showInfo('clickBtnAdicional');
    }

    function onDynaformLoaded(dynaform, dataset) {
      if (dynaform.getEntityName() == 'Cidade') {
        _dynaform = dynaform;
        _dataset = dataset;

        //Bloqueando um campo permanentemente.
        _dynaform.setFieldProperty('DDD', 'enabled', false);

        //Adicionando um listener para que o campo 'SEQENTREGA' seja bloqueado a partir da função passada.
        //A avaliaçao da função acontece em todos os eventos disparados pelo dataset (troca de linha, change de campo, save, cancel, etc).
        //O último parametro diz que no caso de um evento de change,
        // a função só deverá ser avaliada se a alteração for no campo 'DISTANCIA'.
        _dynaform.addFieldPropertyEvaluator('SEQENTREGA', 'enabled', function (dataset, dynaform, event, params) {
          return !dataset.isFieldEmpty('DISTANCIA');
        }, 'DISTANCIA');


        //Adiciona um listener no dataset, que irá alterar o valor do campo SEQENTREGA de acordo com a função.
        //Funcionamento semelhante ao comentado acima.
        _dataset.addFieldValueEvaluator('SEQENTREGA', function (dataset, currentRow) {
          return currentRow.DISTANCIA ? currentRow.DISTANCIA : 0;
        }, 'DISTANCIA');
      }
    }

    function interceptBuildField(fieldName, dataset, fieldProp, scope) {
      if (fieldName == 'LATITUDE' || fieldName == 'LONGITUDE') {
        //Sem isso aqui, o sistema renderizará um sk-text-area por padrao
        return AngularUtil.createDirective('sk-text-input', fieldProp, scope);
      }
    }

    function buildFieldContainer(fieldName, dataset, fieldElem, scope) {
      if (fieldName == 'LATITUDE') {
        fieldElem.attr('flex', '');

        var helpTipElem = AngularUtil.createDirective('sk-help-tip', {
          'sk-help-tip': 'Este campo normalmente é um text-area',
          'style': 'margin-left: 5px'
        }, scope);

        var hBoxElem = AngularUtil.createDirective('sk-hbox', {
          'layout-align': 'start center',
          'flex': ''
        }, scope);

        hBoxElem.append(fieldElem);
        hBoxElem.append(helpTipElem);

        return hBoxElem;
      }
    }

    function customTabsLoader(entityName) {
      if (entityName == 'Cidade') {
        return [{
          blockId: 'abaAdicional',
          description: 'Aba adicional',
          templateUrl: 'html5/ShowcaseHTML5/abas/dynaformshowcase/abaadicional.tpl.html',
          controller: 'AbaAdicionalController'
        }];
      }
    }

    function otherOptionsLoader(dynaform, $dropdownMenu) {
      if (dynaform.getEntityName() == 'Cidade') {
        return [
          {
            label: 'Outra opção adicional',
            action: function () {
              showInfo('OutraOpção adicional');
            }
          }
        ];
      }
    }
  }]);