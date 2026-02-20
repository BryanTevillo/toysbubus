/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// Excepción serializable para validaciones de negocio.
abstract class BusinessValidationException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  BusinessValidationException._({required this.message});

  factory BusinessValidationException({required String message}) =
      _BusinessValidationExceptionImpl;

  factory BusinessValidationException.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return BusinessValidationException(
      message: jsonSerialization['message'] as String,
    );
  }

  /// Mensaje de validación para el cliente.
  String message;

  /// Returns a shallow copy of this [BusinessValidationException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BusinessValidationException copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BusinessValidationException',
      'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BusinessValidationException',
      'message': message,
    };
  }

  @override
  String toString() {
    return 'BusinessValidationException(message: $message)';
  }
}

class _BusinessValidationExceptionImpl extends BusinessValidationException {
  _BusinessValidationExceptionImpl({required String message})
    : super._(message: message);

  /// Returns a shallow copy of this [BusinessValidationException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BusinessValidationException copyWith({String? message}) {
    return BusinessValidationException(message: message ?? this.message);
  }
}
