Spearmint.Models.Transaction = Backbone.RelationalModel.extend({

  relations: [{
    type: Backbone.HasOne,
    key: 'category',
    relatedModel: Spearmint.Models.Category,
    collectionType: Spearmint.Collections.Categories,
    reverseRelation: {
      key: 'transactions'
      // includeInJSON: 'id'
    }
  }]

  // parse: function (jsonResp) {
  //   if (jsonResp.category) {
  //     this.category().set(jsonResp.category)
  //   }
  // }

  // initialize: function () {
  // },

  // validate: function (attributes) {
  //   if (!attributes) {
  //     return "Missing transaction information";
  //   }
  // }

});
