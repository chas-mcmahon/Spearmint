Spearmint.Models.Transaction = Backbone.RelationalModel.extend({

  relations: [{
    type: Backbone.HasOne,
    key: 'category',
    relatedModel: Spearmint.Models.Category,
    collectionType: Spearmint.Collections.Categories,
    reverseRelation: {
      key: 'transactions',
    }
  }]

  // initialize: function () {
  // },

  // validate: function (attributes) {
  //   if (!attributes) {
  //     return "Missing transaction information";
  //   }
  // }

  // parse: function (jsonResp) {
  //
  // }

});
