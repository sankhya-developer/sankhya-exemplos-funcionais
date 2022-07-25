angular
	.module('ShowcaseHTML5App', ['snk'])
    .controller('ShowcaseHTML5Controller', [function() {
    	var self = this;
    	
    	self.onChangeTab = function(newIndex) {
        console.info('novo tabIndex', newIndex);
      };
      
      self.filters = () => {
          let obj = {};
          obj['CODPARC'] = 20;
          return obj;
      }
        
    }]);
    		
