// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransactionsModelCollection on Isar {
  IsarCollection<TransactionsModel> get transactionsModels => this.collection();
}

const TransactionsModelSchema = CollectionSchema(
  name: r'TransactionsModel',
  id: -8075682519511147535,
  properties: {
    r'accountName': PropertySchema(
      id: 0,
      name: r'accountName',
      type: IsarType.string,
    ),
    r'accountNo': PropertySchema(
      id: 1,
      name: r'accountNo',
      type: IsarType.long,
    ),
    r'amount': PropertySchema(
      id: 2,
      name: r'amount',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'narration': PropertySchema(
      id: 5,
      name: r'narration',
      type: IsarType.string,
    ),
    r'onAccount': PropertySchema(
      id: 6,
      name: r'onAccount',
      type: IsarType.long,
    ),
    r'onAccountCurrentBalance': PropertySchema(
      id: 7,
      name: r'onAccountCurrentBalance',
      type: IsarType.double,
    ),
    r'onAccountName': PropertySchema(
      id: 8,
      name: r'onAccountName',
      type: IsarType.string,
    ),
    r'scrollNo': PropertySchema(
      id: 9,
      name: r'scrollNo',
      type: IsarType.long,
    ),
    r'scrollSlNo': PropertySchema(
      id: 10,
      name: r'scrollSlNo',
      type: IsarType.long,
    ),
    r'scrollType': PropertySchema(
      id: 11,
      name: r'scrollType',
      type: IsarType.byte,
      enumMap: _TransactionsModelscrollTypeEnumValueMap,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.long,
    ),
    r'txnDate': PropertySchema(
      id: 13,
      name: r'txnDate',
      type: IsarType.dateTime,
    ),
    r'txnType': PropertySchema(
      id: 14,
      name: r'txnType',
      type: IsarType.byte,
      enumMap: _TransactionsModeltxnTypeEnumValueMap,
    )
  },
  estimateSize: _transactionsModelEstimateSize,
  serialize: _transactionsModelSerialize,
  deserialize: _transactionsModelDeserialize,
  deserializeProp: _transactionsModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'txnDate': IndexSchema(
      id: -6221194621367964075,
      name: r'txnDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'txnDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'scrollSlNo_scrollType_scrollNo': IndexSchema(
      id: 8149499543265683350,
      name: r'scrollSlNo_scrollType_scrollNo',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scrollSlNo',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'scrollType',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'scrollNo',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'txnType': IndexSchema(
      id: -4182913122218904575,
      name: r'txnType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'txnType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'accountNo': IndexSchema(
      id: 2373833044851941512,
      name: r'accountNo',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'accountNo',
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
    ),
    r'onAccount': IndexSchema(
      id: -7877998232683459520,
      name: r'onAccount',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'onAccount',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _transactionsModelGetId,
  getLinks: _transactionsModelGetLinks,
  attach: _transactionsModelAttach,
  version: '3.1.0+1',
);

int _transactionsModelEstimateSize(
  TransactionsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accountName;
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
    final value = object.narration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.onAccountName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _transactionsModelSerialize(
  TransactionsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountName);
  writer.writeLong(offsets[1], object.accountNo);
  writer.writeDouble(offsets[2], object.amount);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.narration);
  writer.writeLong(offsets[6], object.onAccount);
  writer.writeDouble(offsets[7], object.onAccountCurrentBalance);
  writer.writeString(offsets[8], object.onAccountName);
  writer.writeLong(offsets[9], object.scrollNo);
  writer.writeLong(offsets[10], object.scrollSlNo);
  writer.writeByte(offsets[11], object.scrollType.index);
  writer.writeLong(offsets[12], object.status);
  writer.writeDateTime(offsets[13], object.txnDate);
  writer.writeByte(offsets[14], object.txnType.index);
}

TransactionsModel _transactionsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionsModel();
  object.accountName = reader.readStringOrNull(offsets[0]);
  object.accountNo = reader.readLong(offsets[1]);
  object.amount = reader.readDouble(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.description = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.narration = reader.readStringOrNull(offsets[5]);
  object.onAccount = reader.readLong(offsets[6]);
  object.onAccountCurrentBalance = reader.readDouble(offsets[7]);
  object.onAccountName = reader.readStringOrNull(offsets[8]);
  object.scrollNo = reader.readLong(offsets[9]);
  object.scrollSlNo = reader.readLong(offsets[10]);
  object.scrollType = _TransactionsModelscrollTypeValueEnumMap[
          reader.readByteOrNull(offsets[11])] ??
      ScrollType.hc;
  object.status = reader.readLong(offsets[12]);
  object.txnDate = reader.readDateTimeOrNull(offsets[13]);
  object.txnType = _TransactionsModeltxnTypeValueEnumMap[
          reader.readByteOrNull(offsets[14])] ??
      TxnType.dr;
  return object;
}

P _transactionsModelDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (_TransactionsModelscrollTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ScrollType.hc) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (_TransactionsModeltxnTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TxnType.dr) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TransactionsModelscrollTypeEnumValueMap = {
  'HC': 0,
  'BC': 1,
  'HD': 2,
  'BD': 3,
  'TC': 4,
  'TD': 5,
};
const _TransactionsModelscrollTypeValueEnumMap = {
  0: ScrollType.hc,
  1: ScrollType.bc,
  2: ScrollType.hd,
  3: ScrollType.bd,
  4: ScrollType.tc,
  5: ScrollType.td,
};
const _TransactionsModeltxnTypeEnumValueMap = {
  'DR': 0,
  'CR': 1,
};
const _TransactionsModeltxnTypeValueEnumMap = {
  0: TxnType.dr,
  1: TxnType.cr,
};

Id _transactionsModelGetId(TransactionsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionsModelGetLinks(
    TransactionsModel object) {
  return [];
}

void _transactionsModelAttach(
    IsarCollection<dynamic> col, Id id, TransactionsModel object) {
  object.id = id;
}

extension TransactionsModelQueryWhereSort
    on QueryBuilder<TransactionsModel, TransactionsModel, QWhere> {
  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere> anyTxnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'txnDate'),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere>
      anyScrollSlNoScrollTypeScrollNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(
            indexName: r'scrollSlNo_scrollType_scrollNo'),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere> anyTxnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'txnType'),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere>
      anyAccountNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'accountNo'),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhere>
      anyOnAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'onAccount'),
      );
    });
  }
}

extension TransactionsModelQueryWhere
    on QueryBuilder<TransactionsModel, TransactionsModel, QWhereClause> {
  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'txnDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'txnDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnDateEqualTo(DateTime? txnDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'txnDate',
        value: [txnDate],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnDateNotEqualTo(DateTime? txnDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnDate',
              lower: [],
              upper: [txnDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnDate',
              lower: [txnDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnDate',
              lower: [txnDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnDate',
              lower: [],
              upper: [txnDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnDateGreaterThan(
    DateTime? txnDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'txnDate',
        lower: [txnDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnDateLessThan(
    DateTime? txnDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'txnDate',
        lower: [],
        upper: [txnDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnDateBetween(
    DateTime? lowerTxnDate,
    DateTime? upperTxnDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'txnDate',
        lower: [lowerTxnDate],
        includeLower: includeLower,
        upper: [upperTxnDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoEqualToAnyScrollTypeScrollNo(int scrollSlNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        value: [scrollSlNo],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoNotEqualToAnyScrollTypeScrollNo(int scrollSlNo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [],
              upper: [scrollSlNo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [],
              upper: [scrollSlNo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoGreaterThanAnyScrollTypeScrollNo(
    int scrollSlNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [scrollSlNo],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoLessThanAnyScrollTypeScrollNo(
    int scrollSlNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [],
        upper: [scrollSlNo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoBetweenAnyScrollTypeScrollNo(
    int lowerScrollSlNo,
    int upperScrollSlNo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [lowerScrollSlNo],
        includeLower: includeLower,
        upper: [upperScrollSlNo],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoScrollTypeEqualToAnyScrollNo(
          int scrollSlNo, ScrollType scrollType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        value: [scrollSlNo, scrollType],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoEqualToScrollTypeNotEqualToAnyScrollNo(
          int scrollSlNo, ScrollType scrollType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo],
              upper: [scrollSlNo, scrollType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo, scrollType],
              includeLower: false,
              upper: [scrollSlNo],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo, scrollType],
              includeLower: false,
              upper: [scrollSlNo],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo],
              upper: [scrollSlNo, scrollType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoEqualToScrollTypeGreaterThanAnyScrollNo(
    int scrollSlNo,
    ScrollType scrollType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [scrollSlNo, scrollType],
        includeLower: include,
        upper: [scrollSlNo],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoEqualToScrollTypeLessThanAnyScrollNo(
    int scrollSlNo,
    ScrollType scrollType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [scrollSlNo],
        upper: [scrollSlNo, scrollType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoEqualToScrollTypeBetweenAnyScrollNo(
    int scrollSlNo,
    ScrollType lowerScrollType,
    ScrollType upperScrollType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [scrollSlNo, lowerScrollType],
        includeLower: includeLower,
        upper: [scrollSlNo, upperScrollType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoScrollTypeScrollNoEqualTo(
          int scrollSlNo, ScrollType scrollType, int scrollNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        value: [scrollSlNo, scrollType, scrollNo],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoScrollTypeEqualToScrollNoNotEqualTo(
          int scrollSlNo, ScrollType scrollType, int scrollNo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo, scrollType],
              upper: [scrollSlNo, scrollType, scrollNo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo, scrollType, scrollNo],
              includeLower: false,
              upper: [scrollSlNo, scrollType],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo, scrollType, scrollNo],
              includeLower: false,
              upper: [scrollSlNo, scrollType],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'scrollSlNo_scrollType_scrollNo',
              lower: [scrollSlNo, scrollType],
              upper: [scrollSlNo, scrollType, scrollNo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoScrollTypeEqualToScrollNoGreaterThan(
    int scrollSlNo,
    ScrollType scrollType,
    int scrollNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [scrollSlNo, scrollType, scrollNo],
        includeLower: include,
        upper: [scrollSlNo, scrollType],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoScrollTypeEqualToScrollNoLessThan(
    int scrollSlNo,
    ScrollType scrollType,
    int scrollNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [scrollSlNo, scrollType],
        upper: [scrollSlNo, scrollType, scrollNo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      scrollSlNoScrollTypeEqualToScrollNoBetween(
    int scrollSlNo,
    ScrollType scrollType,
    int lowerScrollNo,
    int upperScrollNo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'scrollSlNo_scrollType_scrollNo',
        lower: [scrollSlNo, scrollType, lowerScrollNo],
        includeLower: includeLower,
        upper: [scrollSlNo, scrollType, upperScrollNo],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnTypeEqualTo(TxnType txnType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'txnType',
        value: [txnType],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnTypeNotEqualTo(TxnType txnType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnType',
              lower: [],
              upper: [txnType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnType',
              lower: [txnType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnType',
              lower: [txnType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'txnType',
              lower: [],
              upper: [txnType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnTypeGreaterThan(
    TxnType txnType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'txnType',
        lower: [txnType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnTypeLessThan(
    TxnType txnType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'txnType',
        lower: [],
        upper: [txnType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      txnTypeBetween(
    TxnType lowerTxnType,
    TxnType upperTxnType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'txnType',
        lower: [lowerTxnType],
        includeLower: includeLower,
        upper: [upperTxnType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      accountNoEqualTo(int accountNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'accountNo',
        value: [accountNo],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      accountNoNotEqualTo(int accountNo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNo',
              lower: [],
              upper: [accountNo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNo',
              lower: [accountNo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNo',
              lower: [accountNo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNo',
              lower: [],
              upper: [accountNo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      accountNoGreaterThan(
    int accountNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'accountNo',
        lower: [accountNo],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      accountNoLessThan(
    int accountNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'accountNo',
        lower: [],
        upper: [accountNo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      accountNoBetween(
    int lowerAccountNo,
    int upperAccountNo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'accountNo',
        lower: [lowerAccountNo],
        includeLower: includeLower,
        upper: [upperAccountNo],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      statusEqualTo(int status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      statusLessThan(
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      statusBetween(
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      onAccountEqualTo(int onAccount) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'onAccount',
        value: [onAccount],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      onAccountNotEqualTo(int onAccount) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'onAccount',
              lower: [],
              upper: [onAccount],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'onAccount',
              lower: [onAccount],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'onAccount',
              lower: [onAccount],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'onAccount',
              lower: [],
              upper: [onAccount],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      onAccountGreaterThan(
    int onAccount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'onAccount',
        lower: [onAccount],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      onAccountLessThan(
    int onAccount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'onAccount',
        lower: [],
        upper: [onAccount],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterWhereClause>
      onAccountBetween(
    int lowerOnAccount,
    int upperOnAccount, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'onAccount',
        lower: [lowerOnAccount],
        includeLower: includeLower,
        upper: [upperOnAccount],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TransactionsModelQueryFilter
    on QueryBuilder<TransactionsModel, TransactionsModel, QFilterCondition> {
  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountName',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountName',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      accountNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'narration',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'narration',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'narration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'narration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'narration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'narration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'narration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'narration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'narration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'narration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'narration',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      narrationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'narration',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onAccount',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'onAccount',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'onAccount',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'onAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountCurrentBalanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onAccountCurrentBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountCurrentBalanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'onAccountCurrentBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountCurrentBalanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'onAccountCurrentBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountCurrentBalanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'onAccountCurrentBalance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'onAccountName',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'onAccountName',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onAccountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'onAccountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'onAccountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'onAccountName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'onAccountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'onAccountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'onAccountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'onAccountName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onAccountName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      onAccountNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'onAccountName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scrollNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scrollNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scrollNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scrollNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollSlNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scrollSlNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollSlNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scrollSlNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollSlNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scrollSlNo',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollSlNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scrollSlNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollTypeEqualTo(ScrollType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scrollType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollTypeGreaterThan(
    ScrollType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scrollType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollTypeLessThan(
    ScrollType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scrollType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      scrollTypeBetween(
    ScrollType lower,
    ScrollType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scrollType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
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

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'txnDate',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'txnDate',
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'txnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'txnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'txnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'txnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnTypeEqualTo(TxnType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'txnType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnTypeGreaterThan(
    TxnType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'txnType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnTypeLessThan(
    TxnType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'txnType',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterFilterCondition>
      txnTypeBetween(
    TxnType lower,
    TxnType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'txnType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TransactionsModelQueryObject
    on QueryBuilder<TransactionsModel, TransactionsModel, QFilterCondition> {}

extension TransactionsModelQueryLinks
    on QueryBuilder<TransactionsModel, TransactionsModel, QFilterCondition> {}

extension TransactionsModelQuerySortBy
    on QueryBuilder<TransactionsModel, TransactionsModel, QSortBy> {
  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByAccountNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNo', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByAccountNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNo', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByNarration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narration', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByNarrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narration', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByOnAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccount', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByOnAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccount', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByOnAccountCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountCurrentBalance', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByOnAccountCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountCurrentBalance', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByOnAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountName', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByOnAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountName', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByScrollNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByScrollNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByScrollSlNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollSlNo', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByScrollSlNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollSlNo', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByScrollType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollType', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByScrollTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollType', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByTxnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByTxnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByTxnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      sortByTxnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.desc);
    });
  }
}

extension TransactionsModelQuerySortThenBy
    on QueryBuilder<TransactionsModel, TransactionsModel, QSortThenBy> {
  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByAccountNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNo', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByAccountNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNo', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByNarration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narration', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByNarrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'narration', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByOnAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccount', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByOnAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccount', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByOnAccountCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountCurrentBalance', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByOnAccountCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountCurrentBalance', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByOnAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountName', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByOnAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onAccountName', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByScrollNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByScrollNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByScrollSlNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollSlNo', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByScrollSlNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollSlNo', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByScrollType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollType', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByScrollTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollType', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByTxnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnDate', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByTxnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnDate', Sort.desc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByTxnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.asc);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QAfterSortBy>
      thenByTxnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txnType', Sort.desc);
    });
  }
}

extension TransactionsModelQueryWhereDistinct
    on QueryBuilder<TransactionsModel, TransactionsModel, QDistinct> {
  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByAccountName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByAccountNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNo');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByNarration({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'narration', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByOnAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onAccount');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByOnAccountCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onAccountCurrentBalance');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByOnAccountName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onAccountName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByScrollNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrollNo');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByScrollSlNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrollSlNo');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByScrollType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrollType');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByTxnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'txnDate');
    });
  }

  QueryBuilder<TransactionsModel, TransactionsModel, QDistinct>
      distinctByTxnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'txnType');
    });
  }
}

extension TransactionsModelQueryProperty
    on QueryBuilder<TransactionsModel, TransactionsModel, QQueryProperty> {
  QueryBuilder<TransactionsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionsModel, String?, QQueryOperations>
      accountNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountName');
    });
  }

  QueryBuilder<TransactionsModel, int, QQueryOperations> accountNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNo');
    });
  }

  QueryBuilder<TransactionsModel, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<TransactionsModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TransactionsModel, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TransactionsModel, String?, QQueryOperations>
      narrationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'narration');
    });
  }

  QueryBuilder<TransactionsModel, int, QQueryOperations> onAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onAccount');
    });
  }

  QueryBuilder<TransactionsModel, double, QQueryOperations>
      onAccountCurrentBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onAccountCurrentBalance');
    });
  }

  QueryBuilder<TransactionsModel, String?, QQueryOperations>
      onAccountNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onAccountName');
    });
  }

  QueryBuilder<TransactionsModel, int, QQueryOperations> scrollNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrollNo');
    });
  }

  QueryBuilder<TransactionsModel, int, QQueryOperations> scrollSlNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrollSlNo');
    });
  }

  QueryBuilder<TransactionsModel, ScrollType, QQueryOperations>
      scrollTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrollType');
    });
  }

  QueryBuilder<TransactionsModel, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TransactionsModel, DateTime?, QQueryOperations>
      txnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'txnDate');
    });
  }

  QueryBuilder<TransactionsModel, TxnType, QQueryOperations> txnTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'txnType');
    });
  }
}
