window.Spearmint = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(transactionsJSON, $rootEl) {
    Spearmint.transactions = new Spearmint.Collections.Transactions(transactionsJSON);
    new Spearmint.Routers.TransactionRouter({
      $rootEl: $rootEl,
      transactions: Spearmint.transactions
    })
    Backbone.history.start();
  }
};

// shouldn't this go in transaction's index.html.erb page?
// $(document).ready(function(){
//   Spearmint.initialize();
// });
