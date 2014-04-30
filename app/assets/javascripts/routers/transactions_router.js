Spearmint.Routers.TransactionsRouter = Backbone.Router.extend({

  intialize: function (options) {
    this.transactions = options.transactions;
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "/transactions" : "index"
  },

  index: function () {
    var indexView = new Spearmint.Views.TransactionsIndex({
      collection: this.transactions
    });

    return this._swapView(indexView)
  },

  _swapView: function () {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
