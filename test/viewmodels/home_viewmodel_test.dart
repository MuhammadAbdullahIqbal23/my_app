import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/ui/common/app_strings.dart';
import 'package:my_app/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewModelTest -', () {
    setUp(() {
      registerServices();
    });

    tearDown(() {
      locator.reset();
    });

    group('incrementCounter -', () {
      test('When called once should return "Counter is: 1"', () {
        final model = getModel();
        model.incrementCounter();
        expect(model.counterLabel, 'Counter is: 1');
      });
    });

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {
        final bottomSheetService = getAndRegisterBottomSheetService();
        final model = getModel();
        model.showBottomSheet();
        verify(bottomSheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: ksHomeBottomSheetTitle,
          description: ksHomeBottomSheetDescription,
        ));
      });
    });

    group('Button Color Toggle Test', () {
      test('Toggle button color from blue to red and vice versa', () {
        var viewModel = HomeViewModel();

        viewModel.onNewButtonPressed();
        expect(viewModel.buttonColor, equals(Colors.red));

        viewModel.onNewButtonPressed();
        expect(viewModel.buttonColor, equals(Colors.blue));
      });
    });
  });
}
