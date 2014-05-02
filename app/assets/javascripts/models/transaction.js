Spearmint.Models.Transaction = Backbone.Model.extend({
  // need parse function


  // initialize: function () {
  // },

  validate: function (attributes) {
    if (!attributes) {
      return "Missing transaction information";
    }
  },

  parse: function (jsonResp) {
    this.transactions = new Spearmint.Collections.Transactions(jsonResp.transactions);
    delete jsonResp.transactions;
    return jsonResp;
  }

});
