---
layout: page
title: Ember Cli Deploy version badges
---

[![](https://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/plugins/ember-cli-deploy-s3.svg)](http://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/)
![](./plugins/ember-deploy-ssh-index.svg)

ember-cli-deploy plugins with this badge should work (without deprecation) when using an appropriate
version of ember-cli-deploy.

If you see an inaccurate badge, please help us by
[opening a pull request](https://github.com/ember-cli-deploy/ember-cli-deploy-version-badges)
to change the version number. All entries are made as page in the plugins directory
and should include the URL of the original entry. For example:

{% highlight yaml %}
layout: plugin
start_version: "0.5.0"
permalink: /plugins/ember-cli-deploy-s3.svg
{% endhighlight %}

To include a badge in you Readme use markdown syntax and wrap it in a link

{% highlight html %}
[![](https://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/plugins/ember-cli-deploy-s3.svg)](http://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/)
{% endhighlight %}

Please help ensure your own plugins are correctly flagged by adding a badge
upon publication, even if you only provide a starting version. See
[ember-cli-deploy/ember-cli-deploy-version-badges](https://github.com/ember-cli-deploy/ember-cli-deploy-version-badges)
for more information.
