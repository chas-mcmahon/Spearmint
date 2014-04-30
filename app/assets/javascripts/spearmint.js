window.Spearmint = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    Spearmint.transactions = new Spearmint.Collections.Transactions();
    new Spearmint.Routers.TransactionRouter({
      $rootEl: $(".transaction-main-content"),
      transactions: Spearmint.transactions
    })
    Backbone.history.start();
  }
};

// should this go in transaction's index.html.erb page?
$(document).ready(function(){
  Spearmint.initialize();
});
