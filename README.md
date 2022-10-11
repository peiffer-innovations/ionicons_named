# ionicons_named

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Table of Contents](#table-of-contents)
- [Live Example](#live-example)
- [Introduction](#introduction)
- [Usage](#usage)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Table of Contents

* [Live Example](#live-example)
* [Introduction](#introduction)
* [Usage](#usage)


## Live Example

* [Web](https://peiffer-innovations.github.io/ionicons_named/web/index.html#/)


## Introduction

Library that builds and provides auto-generated string to icon mapping for all [ionicons](https://ionic.io/ionicons) based from the `stable` branch for Flutter using the [ionicons](https://pub.dev/packages/ionicons) flutter package

Please note, if you include this library then Flutter will give you errors stating that it cannot tree shake icons when building for Android and iOS.  You must add the `--no-tree-shake-icons` flag to your builds.  For example:

```
flutter build apk --release --no-tree-shake-icons
```


## Usage

```dart
import 'package:ionicons_named/ionicons_named.dart';

...

Icon(ionicons['boat_outline']),

...

```