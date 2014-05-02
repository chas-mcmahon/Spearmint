window.Spearmint = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(transactionsJSON, $rootEl) {
    Spearmint.transactions = new Spearmint.Collections.Transactions(transactionsJSON);
    var router = new Spearmint.Routers.TransactionsRouter({
      $rootEl: $rootEl,
      transactions: Spearmint.transactions
    });
    Backbone.history.start();
  }
};
