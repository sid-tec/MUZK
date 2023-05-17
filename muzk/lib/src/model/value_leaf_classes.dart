import 'package:sid_d_d/sid_d_d.dart';
import 'validator_classes.dart';

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for UPC
// #############################

class IdDeezer extends ValueLeaf<int> {
  //
  // ===========================
  IdDeezer({required super.value, required super.what})
      : super(failures: ValidatorIdDeezer().failures(value: value));
}

class Year extends ValueLeaf<int> {
  //
  // ===========================
  Year({required super.value, required super.what})
      : super(failures: ValidatorYear().failures(value: value));
}

class ArtistName extends ValueLeaf<String> {
  //
  // ===========================
  ArtistName({required super.value, required super.what})
      : super(failures: ValidatorName().failures(value: value));
}

class Title extends ValueLeaf<String> {
  //
  // ===========================
  Title({required super.value, required super.what})
      : super(failures: ValidatorTitle().failures(value: value));
}

/* class Artists extends ValueLeaf<Iterable<int>> {
  //
  // ===========================
  Artists({required super.value, required super.what})
      : super(failures: ValidatorArtists().failures(value: value));
} */

/* import 'package:uuid/uuid.dart';
//
import '../model/value_leaf.dart';
import '../model/failure.dart';
import 'validator_classes.dart';

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for Unique ID
// ############################

class UniqueId extends ValueLeaf<String> {
  //
  // ===========================
  UniqueId({required String value})
      : super(
          value: value.isEmpty ? Uuid().v1() : value,
          failures: [],
          what: 'uid',
        );
}



  //
  // ===========================
  Upc({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for Dezzer ID
// #############################

class DeezerId extends ValueLeaf<int> {
  //
  // ===========================
  static List<Failure> validators(int value) {
    //
    final min = ValidatorMinValue(min: 1);
    //
    var list = <Failure>[];
    //
    list.addAll(min.failures(value: value));
    //
    return list;
  }

  //
  // ===========================
  DeezerId({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for Date Format
// #############################

class Date extends ValueLeaf<String> {
  //
  // ===========================
  Date({required super.value, required super.what})
      : super(
          failures: ValidatorDateFormat().failures(value: value),
        );
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for Seconds
// #############################

class DurationSeconds extends ValueLeaf<int> {
  //
  // ===========================
  DurationSeconds({required super.value, required super.what})
      : super(
          failures: ValidatorPositive().failures(value: value),
        );
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for Boolean
// #############################

class BoolVo extends ValueLeaf<bool> {
  //
  // ===========================
  BoolVo({required super.value, required super.what}) : super(failures: []);
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for Name String
// #############################

class Name extends ValueLeaf<String> {
  //
  // ===========================
  static List<Failure> validators(String value) {
    //
    final notEmpty = ValidatorNotEmpty();
    final singleLine = ValidatorSingleLine();
    final minLength = ValidatorMinLength(min: 4);
    final maxLength = ValidatorMaxLength(max: 10);
    final regExp = ValidatorRegExp(regExp: RegExp(r'^[a-zA-Z\s]+$'));
    final function = ValidatorFunction(
      function: (v) => v != 'Hitler',
      functionLiteral: 'bool fun(v) => v != \'Hitler\';',
    );
    //
    var list = <Failure>[];
    //
    list.addAll(notEmpty.failures(value: value));
    list.addAll(singleLine.failures(value: value));
    list.addAll(minLength.failures(value: value));
    list.addAll(maxLength.failures(value: value));
    list.addAll(regExp.failures(value: value));
    list.addAll(function.failures(value: value));
    //
    return list;
  }

  //
  // ===========================
  Name({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for URL Address
// #############################

class UrlAddress extends ValueLeaf<String> {
  //
  // ===========================
  static List<Failure> validators(String value) {
    //
    final notEmpty = ValidatorNotEmpty();
    final singleLine = ValidatorSingleLine();
    final minLength = ValidatorMinLength(min: 4);
    final maxLength = ValidatorMaxLength(max: 10);
    final regExp = ValidatorRegExp(regExp: RegExp(r'^[a-zA-Z\s]+$'));
    final function = ValidatorFunction(
      function: (v) => v != 'Hitler',
      functionLiteral: 'bool fun(v) => v != \'Hitler\';',
    );
    //
    var list = <Failure>[];
    //
    list.addAll(notEmpty.failures(value: value));
    list.addAll(singleLine.failures(value: value));
    list.addAll(minLength.failures(value: value));
    list.addAll(maxLength.failures(value: value));
    list.addAll(regExp.failures(value: value));
    list.addAll(function.failures(value: value));
    //
    return list;
  }

  //
  // ===========================
  UrlAddress({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Value Object Class for Local File
// #############################

class LocalFile extends ValueLeaf<String> {
  //
  // ===========================
  static List<Failure> validators(String value) {
    //
    final notEmpty = ValidatorNotEmpty();
    final singleLine = ValidatorSingleLine();
    final minLength = ValidatorMinLength(min: 4);
    final maxLength = ValidatorMaxLength(max: 10);
    final regExp = ValidatorRegExp(regExp: RegExp(r'^[a-zA-Z\s]+$'));
    final function = ValidatorFunction(
      function: (v) => v != 'Hitler',
      functionLiteral: 'bool fun(v) => v != \'Hitler\';',
    );
    //
    var list = <Failure>[];
    //
    list.addAll(notEmpty.failures(value: value));
    list.addAll(singleLine.failures(value: value));
    list.addAll(minLength.failures(value: value));
    list.addAll(maxLength.failures(value: value));
    list.addAll(regExp.failures(value: value));
    list.addAll(function.failures(value: value));
    //
    return list;
  }

  //
  // ===========================
  LocalFile({required super.value, required super.what})
      : super(
          failures: validators(value),
        );
}
//
//          ┈┈┈╭━━╮┈┈┈┈┈┈
//          ┈┈╭╯┊◣╰━━━━╮┈┈
//          ┈┈┃┊┊┊╱▽▽▽┛┈┈  
//          ┈┈┃┊┊┊~~~   ┈┈┈┈
//          ━━╯┊┊┊╲△△△┓┈┈
//          ┊┊┊┊╭━━━━━━╯┈┈  
//         _____   _   _____   
//        / ____| | | |  __ \  
//       | (___   | | | |  | | 
//        \___ \  | | | |  | | 
//        ____) | |_| | |__| | 
//       |_____/  (_) |_____/  
//     _______   ______    _____ 
//    |__   __| |  ____|  / ____|
//       | |    | |__    | |     
//       | |    |  __|   | |     
//       | |    | |____  | |____ 
//       |_|    |______|  \_____|
//
//-< Designed by Sedinir Consentini >-
//  -< Rio de Janeiro  @  MMXXIII >-  
//--> May the source be with you! <---
//13 */