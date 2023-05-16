import 'package:sid_d_d/sid_d_d.dart';

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Composite Pattern
// #  Tree Classes for
// #  Validated Value Objects
// #############################

class Address extends ValueTree {
  //
  // ===========================
  Address._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory Address.create({
    required String logradouro,
    required String numero,
    required String what,
  }) =>
      Address._(
        what: what,
        values: [
          Name(
            what: 'logradouro',
            value: logradouro,
          ),
          Date(
            what: 'numero',
            value: numero,
          ),
        ],
      );

  String get logradouro => value.first.value;
  String get numero => value.last.value;
}

// #############################
// #  Ver: 3.0 - last: 30/01/23
// #  Nullsafety
// #  Composite Pattern
// #  Tree Classes for
// #  Validated Value Objects
// #############################

class Person extends ValueTree {
  //
  // ===========================
  Person._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory Person.create({
    String uid = '',
    required String nome,
    required String nascimento,
    required int idade,
    required String nome1,
    required String nascimento1,
    required String nome2,
    required String nascimento2,
  }) =>
      Person._(
        what: 'pessoa',
        values: [
          UniqueId(value: uid),
          Name(
            what: 'nome',
            value: nome,
          ),
          Upc(
            what: 'idade',
            value: idade,
          ),
          Date(
            what: 'nascimento',
            value: nascimento,
          ),
          Address.create(
            logradouro: nome1,
            numero: nascimento1,
            what: 'address1',
          ),
          Address.create(
            logradouro: nome2,
            numero: nascimento2,
            what: 'address2',
          ),
        ],
      );

  String get uid => value.first.value;
  String get nome => value.elementAt(1).value;
  int get idade => value.elementAt(2).value;
  String get nascimento => value.elementAt(3).value;
  Address get endereco1 => value.elementAt(4) as Address;
  Address get endereco2 => value.elementAt(5) as Address;
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