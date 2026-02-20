import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../repositories/business_repository.dart';
import '../services/business_service.dart';

/// Endpoint delgado para exponer operaciones CRUD de [Business].
class BusinessEndpoint extends Endpoint {
  final BusinessService _service = BusinessService(BusinessDataRepository());

  /// Crea un nuevo business.
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
  }) {
    return _service.create(
      session,
      name: name,
      ownerName: ownerName,
      ownerPhone: ownerPhone,
      ownerEmail: ownerEmail,
      address: address,
      phone: phone,
      rfc: rfc,
      latitude: latitude,
      longitude: longitude,
    );
  }

  /// Obtiene un business por su id.
  Future<Business> getById(Session session, UuidValue id) {
    return _service.getById(session, id);
  }

  /// Lista business registrados.
  Future<List<Business>> list(Session session, {bool onlyActive = true}) {
    return _service.list(session, onlyActive: onlyActive);
  }

  /// Actualiza los datos de un business.
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
  }) {
    return _service.update(
      session,
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
    );
  }

  /// Desactiva un business por id.
  Future<Business> deactivate(Session session, UuidValue id) {
    return _service.deactivate(session, id);
  }
}
