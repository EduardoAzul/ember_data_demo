this.App = Ember.Application.create();

App.ApplicationController = Ember.Controller.extend({
  firstName: "Tom",
  lastName: "Brandt"
});

App.Store = DS.Store.extend({
  revision: 11,
  url: "http://localhost:3000"
});

App.Post = DS.Model.extend({
  title: DS.attr('string'),
  body: DS.attr('string')
});

App.Router.map(function(){
  this.resource('posts', function() {
    this.route('new');
    this.resource('post', {path: ':post_id'});
  });
});

App.IndexRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.set('title', "The is the index controller");
  }
});

App.PostsRoute = Ember.Route.extend({
  model: function() {
    return App.Post.find();
  },
  events: {
    addRecord: function() {
      alert("So you want to add a record?");
    }
  }
});

App.PostController = Ember.ObjectController.extend({
  save: function() {
    alert("saving record");
  },
  destroyRecord: function() {
    if (window.confirm("Are you sure you want to delete this post?")) {
      this.get('content').deleteRecord();
      this.get('store').commit();
      this.get('target.router').transitionTo('posts.index');
    }
  }
});