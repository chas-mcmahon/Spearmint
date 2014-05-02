Spearmint.Routers.TransactionsRouter = Backbone.Router.extend({

  intialize: function (options) {
    this.transactions = options.transactions;
    this.$rootEl = options.$rootEl;
    console.log("initialized")
  },

  routes: {
    "api/transactions" : "index",
    "api/transactions/new" : "new",
    "api/transactions/:id" : "edit",
    "api/transactions/:id" : "destroy"
  },

  index: function () {
    var indexView = new Spearmint.Views.TransactionsIndex({
      collection: this.transactions
    });

    return this._swapView(indexView)
  },

  new: function () {
    var formView = new Spearmint.Views.TransactionsForm({
      collection: this.transactions
      model: new Spearmint.Models.Transaction ()
    });

    return this._swapView(formView)
  },

  edit: function (id) {
    var formView = new Spearmint.Views.TransactionsForm({
      model: this.transactions.get(id)
    });
  },

  destroy: function (id) {
  },

  _swapView: function () {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
