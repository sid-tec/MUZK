import 'package:sid_d_d/sid_d_d.dart';

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorIdDeezer implements Validator<int> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required int value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorPositive().failures(value: value));
    fList.addAll(ValidatorMinValue(min: 1).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorYear implements Validator<int> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required int value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorPositive().failures(value: value));
    fList.addAll(ValidatorMinValue(min: 1901).failures(value: value));
    fList.addAll(
        ValidatorMaxValue(max: DateTime.now().year).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorTitle implements Validator<String> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required String value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorNotEmpty().failures(value: value));
    fList.addAll(ValidatorSingleLine().failures(value: value));
    fList.addAll(ValidatorMinLength(min: 2).failures(value: value));
    fList.addAll(ValidatorMaxLength(max: 130).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorName implements Validator<String> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required String value}) {
    var fList = <Failure>[];
    fList.addAll(ValidatorNotEmpty().failures(value: value));
    fList.addAll(ValidatorSingleLine().failures(value: value));
    fList.addAll(ValidatorMinLength(min: 2).failures(value: value));
    fList.addAll(ValidatorMaxLength(max: 130).failures(value: value));
    return fList;
  }
}

// #############################
// #  Ver: 3.0 - last: 16/05/23
// #  Nullsafety
// #  Class to check if is valid
// #  a dynamic value
// #  with a costum FUNCTION
// #############################
class ValidatorArtists implements Validator<Iterable<int>> {
  //
  @override // FOR ValidatorChecker
  Iterable<Failure> failures({required Iterable<int> value}) {
    var fList = <Failure>[];
    if (value.isEmpty) {
      fList.add(Failure('An Album must have at least 1 Artist'));
    }
    for (var artist in value) {
      fList.addAll(ValidatorIdDeezer().failures(value: artist));
    }
    return fList;
  }
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
//13