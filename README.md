As new versions of ember-cli-deploy are releases there is room for breaking changes in the plugins ecosystem.

To ensure that the right plugins are used with the appropriate versions of ember-cli-deploy, and to manage the effort required by maintainers, we've created a GitHub-driven badge service. See
[the user-friendly website](https://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/)
for more details on the general idea.

## Updating a badge

Badges are stored as Jekyll pages. For example, the badge for this plugin:

* "ember-cli-deploy-s3" [http://github.com/ember-cli-deploy/ember-cli-deploy-s3](http://github.com/ember-cli-deploy/ember-cli-deploy-s3)

Is stored at:

* [/plugins/ember-cli-deploy-s3](https://github.com/ember-cli-deploy/ember-cli-deploy-version-badges/blob/gh-pages/plugins/ember-cli-deploy-s3)

Versioning information is stored in the YAML front-matter of that post:

```
---
layout: plugin
url: http://github.com/ember-cli-deploy/ember-cli-deploy-s3
start_version: "0.5.0"
end_version: "1.0.0"
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
plugins/ember-cli-deploy-s3.md
```

Is used as a badge with the following markup:

```html
![](https://ember-cli-deploy.github.io/ember-cli-deploy-version-badges/plugins/ember-cli-deploy-s3.svg)
```

Please help ensure your own plugins posts are correctly flagged by adding a badge
when you publish.

Linking to a URL that does not exist, such as before your
PR with the new badge is merged, will result in a "pending" badge. As
soon as the PR is merged and GitHub pages updates, the versioned badge will
appear.

### Credits:

Thanks to @mixonic doing the hard work in [mixonic/ember-community-versions](https://github.com/mixonic/ember-community-versions)
