// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scroll_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScrollModelCollection on Isar {
  IsarCollection<ScrollModel> get scrollModels => this.collection();
}

const ScrollModelSchema = CollectionSchema(
  name: r'ScrollModel',
  id: -3930923126839589341,
  properties: {
    r'scrollNo': PropertySchema(
      id: 0,
      name: r'scrollNo',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 1,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _scrollModelEstimateSize,
  serialize: _scrollModelSerialize,
  deserialize: _scrollModelDeserialize,
  deserializeProp: _scrollModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _scrollModelGetId,
  getLinks: _scrollModelGetLinks,
  attach: _scrollModelAttach,
  version: '3.1.0+1',
);

int _scrollModelEstimateSize(
  ScrollModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scrollModelSerialize(
  ScrollModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.scrollNo);
  writer.writeDateTime(offsets[1], object.updatedAt);
}

ScrollModel _scrollModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScrollModel();
  object.id = id;
  object.scrollNo = reader.readLong(offsets[0]);
  object.updatedAt = reader.readDateTime(offsets[1]);
  return object;
}

P _scrollModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scrollModelGetId(ScrollModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scrollModelGetLinks(ScrollModel object) {
  return [];
}

void _scrollModelAttach(
    IsarCollection<dynamic> col, Id id, ScrollModel object) {
  object.id = id;
}

extension ScrollModelQueryWhereSort
    on QueryBuilder<ScrollModel, ScrollModel, QWhere> {
  QueryBuilder<ScrollModel, ScrollModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScrollModelQueryWhere
    on QueryBuilder<ScrollModel, ScrollModel, QWhereClause> {
  QueryBuilder<ScrollModel, ScrollModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ScrollModel, ScrollModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterWhereClause> idBetween(
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
}

extension ScrollModelQueryFilter
    on QueryBuilder<ScrollModel, ScrollModel, QFilterCondition> {
  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition> scrollNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scrollNo',
        value: value,
      ));
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition>
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

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition>
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

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition> scrollNoBetween(
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

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScrollModelQueryObject
    on QueryBuilder<ScrollModel, ScrollModel, QFilterCondition> {}

extension ScrollModelQueryLinks
    on QueryBuilder<ScrollModel, ScrollModel, QFilterCondition> {}

extension ScrollModelQuerySortBy
    on QueryBuilder<ScrollModel, ScrollModel, QSortBy> {
  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> sortByScrollNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.asc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> sortByScrollNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.desc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ScrollModelQuerySortThenBy
    on QueryBuilder<ScrollModel, ScrollModel, QSortThenBy> {
  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> thenByScrollNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.asc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> thenByScrollNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrollNo', Sort.desc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ScrollModelQueryWhereDistinct
    on QueryBuilder<ScrollModel, ScrollModel, QDistinct> {
  QueryBuilder<ScrollModel, ScrollModel, QDistinct> distinctByScrollNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrollNo');
    });
  }

  QueryBuilder<ScrollModel, ScrollModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ScrollModelQueryProperty
    on QueryBuilder<ScrollModel, ScrollModel, QQueryProperty> {
  QueryBuilder<ScrollModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScrollModel, int, QQueryOperations> scrollNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrollNo');
    });
  }

  QueryBuilder<ScrollModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
