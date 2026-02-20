import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Capa de acceso a datos para [Business].
class BusinessDataRepository {
  /// Inserta un negocio y retorna la fila persistida.
  Future<Business> create(Session session, Business business) {
    return Business.db.insertRow(session, business);
  }

  /// Busca un negocio por su identificador.
  Future<Business?> findById(Session session, UuidValue id) {
    return Business.db.findById(session, id);
  }

  /// Lista negocios, opcionalmente filtrando solo activos.
  Future<List<Business>> findAll(Session session, {bool onlyActive = true}) {
    return Business.db.find(
      session,
      where: onlyActive ? (table) => table.isActive.equals(true) : null,
      orderBy: (table) => table.createdAt,
      orderDescending: true,
    );
  }

  /// Actualiza y retorna un negocio existente.
  Future<Business> update(Session session, Business business) {
    return Business.db.updateRow(session, business);
  }
}
