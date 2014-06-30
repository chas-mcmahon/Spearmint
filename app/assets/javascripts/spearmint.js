window.Spearmint = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(transactionsJSON, $rootEl) {

    Spearmint.transactions = new Spearmint.Collections.Transactions(transactionsJSON);
    // Spearmint.categories = new Spearmint.Collections.Categories(transactionsJSON.categories);

    var router = new Spearmint.Routers.TransactionsRouter({
      $rootEl: $rootEl,
      transactions: Spearmint.transactions
      // categories: Spearmint.categories
    });

    Backbone.history.start();
  }
};