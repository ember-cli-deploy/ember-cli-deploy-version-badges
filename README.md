As new versions of ember-cli-deploy are releases there is room for breaking changes in the plugins ecosystem.

To ensure that the right plugins are used with the appropriate versions of ember-cli-deploy, and to manage the effort required by maintainers, we've created a GitHub-driven badge service. See
[the user-friendly website](https://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/)
for more details on the general idea.

## Updating a badge

Badges are stored as Jekyll pages. For example, the badge for this plugin:

* "ember-cli-deploy-s3" [http://github.com/ember-cli-deploy/ember-cli-deploy-s3](http://github.com/ember-cli-deploy/ember-cli-deploy-s3)

Is stored at:

* [/plugins/ember-cli-deploy-s3](https://github.com/ember-cli-deploy/ember-cli-deploy-version-badges/blob/gh-pages/plugins/ember-cli-deploy-s3.svg)

Versioning information is stored in the YAML front-matter of that post:

```
---
layout: plugin
url: http://github.com/ember-cli-deploy/ember-cli-deploy-s3
start_version: "0.5.0"
end_version: "1.0.0"
max_supported_version: 001000000000
permalink: /plugins/ember-cli-deploy-s3.svg
---
```

To update the badge, open a PR changing
the YAML front-matter.

## Creating a badge

To create and embed a badge, first author a Jekyll page with the version
information as exists. Most badges are likely to be for current content, and
thus may only have a `start_version` property.

To embed your badge, use the filename to determine the badge URL. For example
this filename:

```
plugins/ember-cli-deploy-s3.svg
```

Is used as a badge with the following markup:

```html
![](https://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/plugins/ember-cli-deploy-s3.svg)
```

Please help ensure your own plugins are correctly flagged by adding a badge
when you publish.

#### `end_version`:

If your plugin supports only up to a specific version of `ember-cli-deploy` you can specify
an `end_version` key that will be used in the badge and a `max_supported_version` key that will be used to
compare the current version of `ember-cli-deploy` and the version supported by the plugin so that the proper color (red or green) can be used in your badge.

Due to limitations of the GH hosting the `max_supported_version` key has to be an integer.

The format that we're using (without spaces) is:

```
Major Minor Patch Beta
000   000   000   000
```

There's also a script `create_badge.rb` that can be used to ease the process of generating a new badge

## Using a badge

Once the PR for your badge is merged simply add it to your project's Readme (we normally also wrap it in a link that points to this repo)

```
[![](https://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/plugins/ember-cli-deploy-s3.svg)](http://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/)
```

### Credits:

Thanks to @mixonic doing the hard work in [mixonic/ember-community-versions](https://github.com/mixonic/ember-community-versions)
