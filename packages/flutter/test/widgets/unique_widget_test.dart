// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';

class TestUniqueWidget extends UniqueWidget<TestUniqueWidgetState> {
  TestUniqueWidget({ GlobalKey key }) : super(key: key);

  @override
  TestUniqueWidgetState createState() => new TestUniqueWidgetState();
}

class TestUniqueWidgetState extends State<TestUniqueWidget> {
  @override
  Widget build(BuildContext context) => new Container();
}

void main() {
  testWidgets('Unique widget control test', (WidgetTester tester) async {
    TestUniqueWidget widget = new TestUniqueWidget(key: new GlobalKey());

    await tester.pumpWidget(widget);

    TestUniqueWidgetState state = widget.currentState;

    expect(state, isNotNull);

    await tester.pumpWidget(new Container(child: widget));

    expect(widget.currentState, equals(state));
  });
}
