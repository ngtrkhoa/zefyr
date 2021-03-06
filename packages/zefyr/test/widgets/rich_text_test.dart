// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zefyr/src/widgets/rich_text.dart';
import 'package:zefyr/zefyr.dart';

void main() {
  group('$ZefyrRichText', () {
    final doc = new NotusDocument();
    doc.insert(0, 'This House Is A Circus');
    final text = new TextSpan(text: 'This House Is A Circus');

    Widget widget;
    setUp(() {
      widget = new Directionality(
        textDirection: TextDirection.ltr,
        child: new ZefyrRichText(
          node: doc.root.children.first as LineNode,
          text: text,
        ),
      );
    });

    testWidgets('initialize', (tester) async {
      await tester.pumpWidget(widget);
      ZefyrRichText result =
          tester.firstWidget(find.byType(ZefyrRichText));
      expect(result, isNotNull);
      expect(result.text.text, 'This House Is A Circus');
    });
  });
}
