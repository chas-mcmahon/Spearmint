Spearmint.Views.TransactionsIndex = Backbone.View.extend({

  template: JST['transactions/index'],

  events: {
    //eventually to have clickable things on transaction page to reset filter?
  },

  initialize: function () {

  },

  render: function () {
    var renderedContent = this.template({
      transactions: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }

});
