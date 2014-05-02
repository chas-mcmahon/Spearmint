Spearmint.Collections.Transactions = Backbone.Collection.extend({

  model: Spearmint.Models.Transaction,
  url: "/api/transactions"

  // comparator: function (transaction) {
  //   return transaction.get("date");
  // }

});
