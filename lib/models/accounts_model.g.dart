// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAccountsModelCollection on Isar {
  IsarCollection<AccountsModel> get accountsModels => this.collection();
}

const AccountsModelSchema = CollectionSchema(
  name: r'AccountsModel',
  id: 8289987660091086804,
  properties: {
    r'accountType': PropertySchema(
      id: 0,
      name: r'accountType',
      type: IsarType.string,
    ),
    r'bankAccountNo': PropertySchema(
      id: 1,
      name: r'bankAccountNo',
      type: IsarType.long,
    ),
    r'budget': PropertySchema(
      id: 2,
      name: r'budget',
      type: IsarType.double,
    ),
    r'defaultNarration': PropertySchema(
      id: 3,
      name: r'defaultNarration',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'hasChild': PropertySchema(
      id: 5,
      name: r'hasChild',
      type: IsarType.bool,
    ),
    r'isSystem': PropertySchema(
      id: 6,
      name: r'isSystem',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'openingBalance': PropertySchema(
      id: 8,
      name: r'openingBalance',
      type: IsarType.double,
    ),
    r'parent': PropertySchema(
      id: 9,
      name: r'parent',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _accountsModelEstimateSize,
  serialize: _accountsModelSerialize,
  deserialize: _accountsModelDeserialize,
  deserializeProp: _accountsModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'accountType': IndexSchema(
      id: -3462225300892969173,
      name: r'accountType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'accountType',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'hasChild': IndexSchema(
      id: -5953006075160360446,
      name: r'hasChild',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hasChild',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'parent': IndexSchema(
      id: 8742773298275793466,
      name: r'parent',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'parent',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isSystem': IndexSchema(
      id: -1621690232649493676,
      name: r'isSystem',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isSystem',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _accountsModelGetId,
  getLinks: _accountsModelGetLinks,
  attach: _accountsModelAttach,
  version: '3.1.0+1',
);

int _accountsModelEstimateSize(
  AccountsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accountType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.defaultNarration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _accountsModelSerialize(
  AccountsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountType);
  writer.writeLong(offsets[1], object.bankAccountNo);
  writer.writeDouble(offsets[2], object.budget);
  writer.writeString(offsets[3], object.defaultNarration);
  writer.writeString(offsets[4], object.description);
  writer.writeBool(offsets[5], object.hasChild);
  writer.writeBool(offsets[6], object.isSystem);
  writer.writeString(offsets[7], object.name);
  writer.writeDouble(offsets[8], object.openingBalance);
  writer.writeLong(offsets[9], object.parent);
  writer.writeLong(offsets[10], object.status);
}

AccountsModel _accountsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AccountsModel();
  object.accountType = reader.readStringOrNull(offsets[0]);
  object.bankAccountNo = reader.readLong(offsets[1]);
  object.budget = reader.readDouble(offsets[2]);
  object.defaultNarration = reader.readStringOrNull(offsets[3]);
  object.description = reader.readStringOrNull(offsets[4]);
  object.hasChild = reader.readBool(offsets[5]);
  object.id = id;
  object.isSystem = reader.readBool(offsets[6]);
  object.name = reader.readStringOrNull(offsets[7]);
  object.openingBalance = reader.readDouble(offsets[8]);
  object.parent = reader.readLong(offsets[9]);
  object.status = reader.readLong(offsets[10]);
  return object;
}

P _accountsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _accountsModelGetId(AccountsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _accountsModelGetLinks(AccountsModel object) {
  return [];
}

void _accountsModelAttach(
    IsarCollection<dynamic> col, Id id, AccountsModel object) {
  object.id = id;
}

extension AccountsModelByIndex on IsarCollection<AccountsModel> {
  Future<AccountsModel?> getByName(String? name) {
    return getByIndex(r'name', [name]);
  }

  AccountsModel? getByNameSync(String? name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String? name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String? name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<AccountsModel?>> getAllByName(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<AccountsModel?> getAllByNameSync(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(AccountsModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(AccountsModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<AccountsModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<AccountsModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension AccountsModelQueryWhereSort
    on QueryBuilder<AccountsModel, AccountsModel, QWhere> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhere> anyHasChild() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'hasChild'),
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhere> anyParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'parent'),
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhere> anyIsSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isSystem'),
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }
}

extension AccountsModelQueryWhere
    on QueryBuilder<AccountsModel, AccountsModel, QWhereClause> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> nameEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      accountTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'accountType',
        value: [null],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      accountTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'accountType',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      accountTypeEqualTo(String? accountType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'accountType',
        value: [accountType],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      accountTypeNotEqualTo(String? accountType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountType',
              lower: [],
              upper: [accountType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountType',
              lower: [accountType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountType',
              lower: [accountType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountType',
              lower: [],
              upper: [accountType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> hasChildEqualTo(
      bool hasChild) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hasChild',
        value: [hasChild],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      hasChildNotEqualTo(bool hasChild) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasChild',
              lower: [],
              upper: [hasChild],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasChild',
              lower: [hasChild],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasChild',
              lower: [hasChild],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasChild',
              lower: [],
              upper: [hasChild],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> parentEqualTo(
      int parent) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parent',
        value: [parent],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      parentNotEqualTo(int parent) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parent',
              lower: [],
              upper: [parent],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parent',
              lower: [parent],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parent',
              lower: [parent],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parent',
              lower: [],
              upper: [parent],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      parentGreaterThan(
    int parent, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parent',
        lower: [parent],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> parentLessThan(
    int parent, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parent',
        lower: [],
        upper: [parent],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> parentBetween(
    int lowerParent,
    int upperParent, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parent',
        lower: [lowerParent],
        includeLower: includeLower,
        upper: [upperParent],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> isSystemEqualTo(
      bool isSystem) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isSystem',
        value: [isSystem],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      isSystemNotEqualTo(bool isSystem) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSystem',
              lower: [],
              upper: [isSystem],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSystem',
              lower: [isSystem],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSystem',
              lower: [isSystem],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSystem',
              lower: [],
              upper: [isSystem],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> statusEqualTo(
      int status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      statusNotEqualTo(int status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause>
      statusGreaterThan(
    int status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [status],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> statusLessThan(
    int status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [],
        upper: [status],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> statusBetween(
    int lowerStatus,
    int upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [lowerStatus],
        includeLower: includeLower,
        upper: [upperStatus],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AccountsModelQueryFilter
    on QueryBuilder<AccountsModel, AccountsModel, QFilterCondition> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountType',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountType',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountType',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountType',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      bankAccountNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccountNo',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      bankAccountNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankAccountNo',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      bankAccountNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankAccountNo',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      bankAccountNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankAccountNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      budgetEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'budget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      budgetGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'budget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      budgetLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'budget',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      budgetBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'budget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defaultNarration',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defaultNarration',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultNarration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultNarration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultNarration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultNarration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultNarration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultNarration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultNarration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultNarration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultNarration',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      defaultNarrationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultNarration',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      hasChildEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasChild',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      isSystemEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSystem',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      openingBalanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openingBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      openingBalanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openingBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      openingBalanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openingBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      openingBalanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openingBalance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      parentEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parent',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      parentGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parent',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      parentLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parent',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      parentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      statusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      statusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AccountsModelQueryObject
    on QueryBuilder<AccountsModel, AccountsModel, QFilterCondition> {}

extension AccountsModelQueryLinks
    on QueryBuilder<AccountsModel, AccountsModel, QFilterCondition> {}

extension AccountsModelQuerySortBy
    on QueryBuilder<AccountsModel, AccountsModel, QSortBy> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByAccountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByAccountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByBankAccountNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNo', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByBankAccountNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNo', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByDefaultNarration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultNarration', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByDefaultNarrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultNarration', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByHasChild() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasChild', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByHasChildDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasChild', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByIsSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystem', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByIsSystemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystem', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByOpeningBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingBalance', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByOpeningBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingBalance', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parent', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByParentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parent', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension AccountsModelQuerySortThenBy
    on QueryBuilder<AccountsModel, AccountsModel, QSortThenBy> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByAccountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByAccountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByBankAccountNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNo', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByBankAccountNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountNo', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByDefaultNarration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultNarration', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByDefaultNarrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultNarration', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByHasChild() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasChild', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByHasChildDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasChild', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByIsSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystem', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByIsSystemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSystem', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByOpeningBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingBalance', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByOpeningBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingBalance', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parent', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByParentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parent', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension AccountsModelQueryWhereDistinct
    on QueryBuilder<AccountsModel, AccountsModel, QDistinct> {
  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByAccountType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct>
      distinctByBankAccountNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankAccountNo');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'budget');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct>
      distinctByDefaultNarration({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultNarration',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByHasChild() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasChild');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByIsSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSystem');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct>
      distinctByOpeningBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openingBalance');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parent');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension AccountsModelQueryProperty
    on QueryBuilder<AccountsModel, AccountsModel, QQueryProperty> {
  QueryBuilder<AccountsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations> accountTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountType');
    });
  }

  QueryBuilder<AccountsModel, int, QQueryOperations> bankAccountNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankAccountNo');
    });
  }

  QueryBuilder<AccountsModel, double, QQueryOperations> budgetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'budget');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations>
      defaultNarrationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultNarration');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<AccountsModel, bool, QQueryOperations> hasChildProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasChild');
    });
  }

  QueryBuilder<AccountsModel, bool, QQueryOperations> isSystemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSystem');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<AccountsModel, double, QQueryOperations>
      openingBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openingBalance');
    });
  }

  QueryBuilder<AccountsModel, int, QQueryOperations> parentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parent');
    });
  }

  QueryBuilder<AccountsModel, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
