angular.module('GeneratorExampleApp', ['snk']).controller('GeneratorExampleController', ['SkApplication', 'i18n', 'ObjectUtils', 'MGEParameters', 'AngularUtil', 'StringUtils', 'ServiceProxy', 'MessageUtils', 'SanPopup',
   function(SkApplication, i18n, ObjectUtils, MGEParameters, AngularUtil, StringUtils, ServiceProxy, MessageUtils, SanPopup) {
      var self = this;
      var _dsCidade;
      var _dynaformCidade;
      var _personalizedFilter;
      var _navigator;
      //Dynaform Interceptors
      self.onDynaformLoaded = onDynaformLoaded;
      self.customTabsLoader = customTabsLoader;
      self.interceptNavigator = interceptNavigator;
      self.interceptPersonalizedFilter = interceptPersonalizedFilter;
      //Dynaform intercepttors implementation
      ObjectUtils.implements(self, IDynaformInterceptor);
      self.interceptFieldMetadata = interceptFieldMetadata;
      self.interceptDataset = interceptDataset;
      self.interceptDynaform = interceptDynaform;
      self.acceptField = acceptField;
      //{declaration interceptors dynaform placeholder}            
      //Dataset Interceptors
      ObjectUtils.implements(self, IDataSetObserver);
      self.dataSaved = dataSaved;
      self.currentLineChanged = currentLineChanged;
      self.refreshed = refreshed;
      self.saveAvoided = saveAvoided;
      //{declaration interceptors dataset placeholder}           
      function onDynaformLoaded(dynaform, dataset) {
         _dynaformCidade = dynaform;
         _dsCidade = dataset;
         _dsCidade.addObserver(self);
      }

      function customTabsLoader(entityName) {
         if (entityName == 'Cidade') {
            var customTabs = [];
            //{customTabs placeholder}
            return customTabs;
         }
      }

      function interceptPersonalizedFilter(personalizedFilter, dataset) {
         _personalizedFilter = personalizedFilter;
      }

      function interceptNavigator(navigator, dynaform) {
         _navigator = navigator;
      }

      function interceptFieldMetadata(fieldMetadata, dataset, dynaform) {}

      function interceptDataset(dynaform, dataset) {}

      function interceptDynaform(dynaform) {}

      function acceptField(fieldMD, dynaform, dataset) {
         return true;
      }
      //{implementation interceptors dynaform placeholder}
      //Dataset interceptors implementation
      function dataSaved(isNew, records) {}

      function currentLineChanged(newIndex) {}

      function refreshed() {}

      function saveAvoided(nullFieldNames) {}
      //{implementation interceptors dataset placeholder}
      //{popup callers placeholder}           
   }
]);