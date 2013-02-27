Getting started with Ember Data
===============================

These are small Rails and Ember apps which are used in the [Getting Started with Ember Data tutorial](http://twbrandt.github.com/2013/02/22/Ember-Data-Quick-Start-Guide/).

The Rails app is acting only as an API serving up JSON, though I am not using the Rails API gem here. It does use the [active_model_serializers](https://github.com/rails-api/active_model_serializers), which renders JSON in a form usable by Ember Data.

Typically, the javascript and stylesheets would be handled by the asset pipline. But this demo does not assume that the html and javascript are being served up by a Rails app, so the html, javascript, and stylesheets are all in the /public folder.

For more information on Ember Data, please see the [Ember guides](http://emberjs.com/guides/models/), and Dan Gebhardt's [excellent example](https://github.com/dgeb/ember_data_example). Dan goes much deeper into Ember Data than I do here.