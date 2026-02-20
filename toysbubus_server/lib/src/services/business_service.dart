import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../repositories/business_repository.dart';

/// Capa de lógica de negocio para gestión de [Business].
class BusinessService {
  /// Inicializa el servicio con su dependencia de repositorio.
  BusinessService(this._repository);

  final BusinessDataRepository _repository;

  /// Crea un nuevo negocio aplicando validaciones.
  Future<Business> create(
    Session session, {
    required String name,
    String? ownerName,
    String? ownerPhone,
    String? ownerEmail,
    String? address,
    String? phone,
    String? rfc,
    double? latitude,
    double? longitude,
  }) async {
    _validateName(name);
    _validateCoordinates(latitude: latitude, longitude: longitude);
    _validateEmail(ownerEmail);

    final normalizedBusiness = Business(
      name: name.trim(),
      ownerName: _normalizeNullable(ownerName),
      ownerPhone: _normalizeNullable(ownerPhone),
      ownerEmail: _normalizeNullable(ownerEmail),
      address: _normalizeNullable(address),
      phone: _normalizeNullable(phone),
      rfc: _normalizeNullable(rfc)?.toUpperCase(),
      latitude: latitude,
      longitude: longitude,
      isActive: true,
      createdAt: DateTime.now().toUtc(),
      updatedAt: null,
    );

    return _repository.create(session, normalizedBusiness);
  }

  /// Obtiene un negocio por id o lanza excepción si no existe.
  Future<Business> getById(Session session, UuidValue id) async {
    final business = await _repository.findById(session, id);
    if (business == null) {
      throw BusinessValidationException(message: 'Business no encontrado.');
    }
    return business;
  }

  /// Lista negocios con opción de filtrar solo activos.
  Future<List<Business>> list(Session session, {bool onlyActive = true}) {
    return _repository.findAll(session, onlyActive: onlyActive);
  }

  /// Actualiza un negocio existente con validaciones.
  Future<Business> update(
    Session session, {
    required UuidValue id,
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
  }) async {
    final existing = await _repository.findById(session, id);
    if (existing == null) {
      throw BusinessValidationException(message: 'Business no encontrado.');
    }

    if (name != null) {
      _validateName(name);
    }

    _validateCoordinates(latitude: latitude, longitude: longitude);
    _validateEmail(ownerEmail);

    final updated = existing.copyWith(
      name: name?.trim() ?? existing.name,
      ownerName: _normalizeNullable(ownerName) ?? existing.ownerName,
      ownerPhone: _normalizeNullable(ownerPhone) ?? existing.ownerPhone,
      ownerEmail: _normalizeNullable(ownerEmail) ?? existing.ownerEmail,
      address: _normalizeNullable(address) ?? existing.address,
      phone: _normalizeNullable(phone) ?? existing.phone,
      rfc: (_normalizeNullable(rfc)?.toUpperCase()) ?? existing.rfc,
      latitude: latitude ?? existing.latitude,
      longitude: longitude ?? existing.longitude,
      isActive: isActive ?? existing.isActive,
      updatedAt: DateTime.now().toUtc(),
    );

    return _repository.update(session, updated);
  }

  /// Desactiva lógicamente un negocio.
  Future<Business> deactivate(Session session, UuidValue id) async {
    return update(session, id: id, isActive: false);
  }

  void _validateName(String name) {
    if (name.trim().isEmpty) {
      throw BusinessValidationException(
        message: 'El nombre del business es obligatorio.',
      );
    }
  }

  void _validateEmail(String? ownerEmail) {
    if (ownerEmail == null || ownerEmail.trim().isEmpty) return;
    final normalized = ownerEmail.trim();
    if (!normalized.contains('@') ||
        normalized.startsWith('@') ||
        normalized.endsWith('@')) {
      throw BusinessValidationException(
        message: 'El ownerEmail no tiene un formato válido.',
      );
    }
  }

  void _validateCoordinates({double? latitude, double? longitude}) {
    if (latitude != null && (latitude < -90 || latitude > 90)) {
      throw BusinessValidationException(
        message: 'La latitude debe estar entre -90 y 90.',
      );
    }

    if (longitude != null && (longitude < -180 || longitude > 180)) {
      throw BusinessValidationException(
        message: 'La longitude debe estar entre -180 y 180.',
      );
    }
  }

  String? _normalizeNullable(String? value) {
    if (value == null) return null;
    final normalized = value.trim();
    return normalized.isEmpty ? null : normalized;
  }
}
