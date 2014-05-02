Spearmint.Views.TransactionForm = Backbone.View.extend ({

  template: JST["transactions/form"],

  // how to specify form's action?
  tagName: "form",
  transaction: this.model,

  events: {
    "click input[type='submit']" : "submit"
  },

  initialize: function () {

  },

  render: function () {
    var renderedContent = this.template({
      transactions: this.collection, //need this all the time?
      transaction: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();

    // what do I actually want the success callback to be?
    // what does this success callback actually do?
    function success () {
      Backbone.history.navigate("", { trigger: true });
    }

    this.model.set(attrs);
    if (this.model.isNew()) {
      this.collection.create(this.model, {
        success: success
      });
    } else {
      this.model.save({}, {
        success: success
      });
    }
  }
});