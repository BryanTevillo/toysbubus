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

/// Entidad de negocio para registrar información comercial.
abstract class Business
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = BusinessTable();

  static const db = BusinessRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static BusinessInclude include() {
    return BusinessInclude._();
  }

  static BusinessIncludeList includeList({
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    BusinessInclude? include,
  }) {
    return BusinessIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Business.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Business.t),
      include: include,
    );
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

class BusinessUpdateTable extends _i1.UpdateTable<BusinessTable> {
  BusinessUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> ownerName(String? value) => _i1.ColumnValue(
    table.ownerName,
    value,
  );

  _i1.ColumnValue<String, String> ownerPhone(String? value) => _i1.ColumnValue(
    table.ownerPhone,
    value,
  );

  _i1.ColumnValue<String, String> ownerEmail(String? value) => _i1.ColumnValue(
    table.ownerEmail,
    value,
  );

  _i1.ColumnValue<String, String> address(String? value) => _i1.ColumnValue(
    table.address,
    value,
  );

  _i1.ColumnValue<String, String> phone(String? value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> rfc(String? value) => _i1.ColumnValue(
    table.rfc,
    value,
  );

  _i1.ColumnValue<double, double> latitude(double? value) => _i1.ColumnValue(
    table.latitude,
    value,
  );

  _i1.ColumnValue<double, double> longitude(double? value) => _i1.ColumnValue(
    table.longitude,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class BusinessTable extends _i1.Table<_i1.UuidValue> {
  BusinessTable({super.tableRelation}) : super(tableName: 'business') {
    updateTable = BusinessUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    ownerName = _i1.ColumnString(
      'ownerName',
      this,
    );
    ownerPhone = _i1.ColumnString(
      'ownerPhone',
      this,
    );
    ownerEmail = _i1.ColumnString(
      'ownerEmail',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    rfc = _i1.ColumnString(
      'rfc',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final BusinessUpdateTable updateTable;

  /// Nombre comercial del negocio.
  late final _i1.ColumnString name;

  /// Nombre del propietario o responsable.
  late final _i1.ColumnString ownerName;

  /// Teléfono del propietario o responsable.
  late final _i1.ColumnString ownerPhone;

  /// Correo del propietario o responsable.
  late final _i1.ColumnString ownerEmail;

  /// Dirección física del negocio.
  late final _i1.ColumnString address;

  /// Teléfono principal del negocio.
  late final _i1.ColumnString phone;

  /// RFC del negocio.
  late final _i1.ColumnString rfc;

  /// Latitud geográfica del negocio.
  late final _i1.ColumnDouble latitude;

  /// Longitud geográfica del negocio.
  late final _i1.ColumnDouble longitude;

  /// Estado de activación lógica del negocio.
  late final _i1.ColumnBool isActive;

  /// Fecha de creación del registro.
  late final _i1.ColumnDateTime createdAt;

  /// Fecha de última actualización del registro.
  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    ownerName,
    ownerPhone,
    ownerEmail,
    address,
    phone,
    rfc,
    latitude,
    longitude,
    isActive,
    createdAt,
    updatedAt,
  ];
}

class BusinessInclude extends _i1.IncludeObject {
  BusinessInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => Business.t;
}

class BusinessIncludeList extends _i1.IncludeList {
  BusinessIncludeList._({
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Business.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Business.t;
}

class BusinessRepository {
  const BusinessRepository._();

  /// Returns a list of [Business]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Business>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Business>(
      where: where?.call(Business.t),
      orderBy: orderBy?.call(Business.t),
      orderByList: orderByList?.call(Business.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Business] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Business?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Business>(
      where: where?.call(Business.t),
      orderBy: orderBy?.call(Business.t),
      orderByList: orderByList?.call(Business.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Business] by its [id] or null if no such row exists.
  Future<Business?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Business>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Business]s in the list and returns the inserted rows.
  ///
  /// The returned [Business]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Business>> insert(
    _i1.Session session,
    List<Business> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Business>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Business] and returns the inserted row.
  ///
  /// The returned [Business] will have its `id` field set.
  Future<Business> insertRow(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Business>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Business]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Business>> update(
    _i1.Session session,
    List<Business> rows, {
    _i1.ColumnSelections<BusinessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Business>(
      rows,
      columns: columns?.call(Business.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Business]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Business> updateRow(
    _i1.Session session,
    Business row, {
    _i1.ColumnSelections<BusinessTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Business>(
      row,
      columns: columns?.call(Business.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Business] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Business?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<BusinessUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Business>(
      id,
      columnValues: columnValues(Business.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Business]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Business>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<BusinessUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<BusinessTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusinessTable>? orderBy,
    _i1.OrderByListBuilder<BusinessTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Business>(
      columnValues: columnValues(Business.t.updateTable),
      where: where(Business.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Business.t),
      orderByList: orderByList?.call(Business.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Business]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Business>> delete(
    _i1.Session session,
    List<Business> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Business>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Business].
  Future<Business> deleteRow(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Business>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Business>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BusinessTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Business>(
      where: where(Business.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusinessTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Business>(
      where: where?.call(Business.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
