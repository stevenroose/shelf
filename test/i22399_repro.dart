// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library shelf.create_middleware_test;

import 'package:shelf/shelf.dart';

import 'test_util.dart';

void main() {
  var middleware = createMiddleware(responseHandler: (response) {
    throw 'middleware error';
  });

  var handler =
      const Pipeline().addMiddleware(middleware).addHandler(syncHandler);

  makeSimpleRequest(handler);
}
