// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalizationController on LocalizationControllerBase, Store {
  Computed<LocalizationEnum>? _$selectedLocalizationComputed;

  @override
  LocalizationEnum get selectedLocalization =>
      (_$selectedLocalizationComputed ??= Computed<LocalizationEnum>(
              () => super.selectedLocalization,
              name: 'LocalizationControllerBase.selectedLocalization'))
          .value;

  late final _$_selectedLocalizationAtom = Atom(
      name: 'LocalizationControllerBase._selectedLocalization',
      context: context);

  @override
  LocalizationEnum get _selectedLocalization {
    _$_selectedLocalizationAtom.reportRead();
    return super._selectedLocalization;
  }

  @override
  set _selectedLocalization(LocalizationEnum value) {
    _$_selectedLocalizationAtom.reportWrite(value, super._selectedLocalization,
        () {
      super._selectedLocalization = value;
    });
  }

  @override
  String toString() {
    return '''
selectedLocalization: ${selectedLocalization}
    ''';
  }
}
