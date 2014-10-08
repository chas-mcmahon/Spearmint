Spearmint.Models.Transaction = Backbone.Model.extend({

  // relations: [{
  //   type: Backbone.HasOne,
  //   key: 'category',
  //   relatedModel: Spearmint.Models.Category,
  //   collectionType: Spearmint.Collections.Categories,
  //   reverseRelation: {
  //     key: 'transactions'
  //     // includeInJSON: 'id'
  //   }
  // }]

  parse: function (jsonResp) {
    if (jsonResp.category) {
      this.category().set(jsonResp.category)
      delete jsonResp.category;
    }
    return jsonResp;
  },

  category: function () {
    if (!this._category) {
      this._category = new Spearmint.Models.Category();
    }
    return this._category;
  },

  convert_cents: function() {
    return (this.get('amount_cents')/100).toFixed(2);
  }

  // initialize: function () {
  // },

  // validate: function (attributes) {
  //   if (!attributes) {
  //     return "Missing transaction information";
  //   }
  // }

});
