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
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Entidad de negocio para registrar información comercial.
abstract class Business implements _i1.SerializableModel {
  Business._({
    _i1.UuidValue? id,
    required this.name,
    this.ownerName,
    this.ownerPhone,
    this.ownerEmail,
    this.address,
    this.phone,
    this.rfc,
    this.latitude,
    this.longitude,
    bool? isActive,
    DateTime? createdAt,
    this.updatedAt,
  }) : id = id ?? const _i1.Uuid().v7obj(),
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now();

  factory Business({
    _i1.UuidValue? id,
    required String name,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? address,
    String? phone,
    String? rfc,
    double? latitude,
    double? longitude,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BusinessImpl;

  factory Business.fromJson(Map<String, dynamic> jsonSerialization) {
    return Business(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      ownerName: jsonSerialization['ownerName'] as String?,
      ownerPhone: jsonSerialization['ownerPhone'] as String?,
      ownerEmail: jsonSerialization['ownerEmail'] as String?,
      address: jsonSerialization['address'] as String?,
      phone: jsonSerialization['phone'] as String?,
      rfc: jsonSerialization['rfc'] as String?,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      isActive: jsonSerialization['isActive'] as bool?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// Identificador único del negocio.
  _i1.UuidValue id;

  /// Nombre comercial del negocio.
  String name;

  /// Nombre del propietario o responsable.
  String? ownerName;

  /// Teléfono del propietario o responsable.
  String? ownerPhone;

  /// Correo del propietario o responsable.
  String? ownerEmail;

  /// Dirección física del negocio.
  String? address;

  /// Teléfono principal del negocio.
  String? phone;

  /// RFC del negocio.
  String? rfc;

  /// Latitud geográfica del negocio.
  double? latitude;

  /// Longitud geográfica del negocio.
  double? longitude;

  /// Estado de activación lógica del negocio.
  bool isActive;

  /// Fecha de creación del registro.
  DateTime createdAt;

  /// Fecha de última actualización del registro.
  DateTime? updatedAt;

  /// Returns a shallow copy of this [Business]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Business copyWith({
    _i1.UuidValue? id,
    String? name,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? address,
    String? phone,
    String? rfc,
    double? latitude,
    double? longitude,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Business',
      'id': id.toJson(),
      'name': name,
      if (ownerName != null) 'ownerName': ownerName,
      if (ownerPhone != null) 'ownerPhone': ownerPhone,
      if (ownerEmail != null) 'ownerEmail': ownerEmail,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (rfc != null) 'rfc': rfc,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BusinessImpl extends Business {
  _BusinessImpl({
    _i1.UuidValue? id,
    required String name,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? address,
    String? phone,
    String? rfc,
    double? latitude,
    double? longitude,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         ownerName: ownerName,
         ownerPhone: ownerPhone,
         ownerEmail: ownerEmail,
         address: address,
         phone: phone,
         rfc: rfc,
         latitude: latitude,
         longitude: longitude,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Business]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Business copyWith({
    _i1.UuidValue? id,
    String? name,
    Object? ownerName = _Undefined,
    Object? ownerPhone = _Undefined,
    Object? ownerEmail = _Undefined,
    Object? address = _Undefined,
    Object? phone = _Undefined,
    Object? rfc = _Undefined,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    bool? isActive,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return Business(
      id: id ?? this.id,
      name: name ?? this.name,
      ownerName: ownerName is String? ? ownerName : this.ownerName,
      ownerPhone: ownerPhone is String? ? ownerPhone : this.ownerPhone,
      ownerEmail: ownerEmail is String? ? ownerEmail : this.ownerEmail,
      address: address is String? ? address : this.address,
      phone: phone is String? ? phone : this.phone,
      rfc: rfc is String? ? rfc : this.rfc,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
