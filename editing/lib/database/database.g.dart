// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Notes extends Table with TableInfo<Notes, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Notes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  late final GeneratedColumn<int> format = GeneratedColumn<int>(
      'format', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastUpdateTimeMeta =
      const VerificationMeta('lastUpdateTime');
  late final GeneratedColumn<String> lastUpdateTime = GeneratedColumn<String>(
      'last_update_time', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, format, title, content, tags, location, createTime, lastUpdateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('format')) {
      context.handle(_formatMeta,
          format.isAcceptableOrUnknown(data['format']!, _formatMeta));
    } else if (isInserting) {
      context.missing(_formatMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    if (data.containsKey('last_update_time')) {
      context.handle(
          _lastUpdateTimeMeta,
          lastUpdateTime.isAcceptableOrUnknown(
              data['last_update_time']!, _lastUpdateTimeMeta));
    } else if (isInserting) {
      context.missing(_lastUpdateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}format'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time'])!,
      lastUpdateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_update_time'])!,
    );
  }

  @override
  Notes createAlias(String alias) {
    return Notes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final int format;
  final String title;
  final String content;
  final String? tags;
  final String? location;
  final String createTime;
  final String lastUpdateTime;
  const Note(
      {required this.id,
      required this.format,
      required this.title,
      required this.content,
      this.tags,
      this.location,
      required this.createTime,
      required this.lastUpdateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['format'] = Variable<int>(format);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['create_time'] = Variable<String>(createTime);
    map['last_update_time'] = Variable<String>(lastUpdateTime);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      format: Value(format),
      title: Value(title),
      content: Value(content),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      createTime: Value(createTime),
      lastUpdateTime: Value(lastUpdateTime),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      format: serializer.fromJson<int>(json['format']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      tags: serializer.fromJson<String?>(json['tags']),
      location: serializer.fromJson<String?>(json['location']),
      createTime: serializer.fromJson<String>(json['create_time']),
      lastUpdateTime: serializer.fromJson<String>(json['last_update_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'format': serializer.toJson<int>(format),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'tags': serializer.toJson<String?>(tags),
      'location': serializer.toJson<String?>(location),
      'create_time': serializer.toJson<String>(createTime),
      'last_update_time': serializer.toJson<String>(lastUpdateTime),
    };
  }

  Note copyWith(
          {int? id,
          int? format,
          String? title,
          String? content,
          Value<String?> tags = const Value.absent(),
          Value<String?> location = const Value.absent(),
          String? createTime,
          String? lastUpdateTime}) =>
      Note(
        id: id ?? this.id,
        format: format ?? this.format,
        title: title ?? this.title,
        content: content ?? this.content,
        tags: tags.present ? tags.value : this.tags,
        location: location.present ? location.value : this.location,
        createTime: createTime ?? this.createTime,
        lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('format: $format, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags, ')
          ..write('location: $location, ')
          ..write('createTime: $createTime, ')
          ..write('lastUpdateTime: $lastUpdateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, format, title, content, tags, location, createTime, lastUpdateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.format == this.format &&
          other.title == this.title &&
          other.content == this.content &&
          other.tags == this.tags &&
          other.location == this.location &&
          other.createTime == this.createTime &&
          other.lastUpdateTime == this.lastUpdateTime);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<int> format;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> tags;
  final Value<String?> location;
  final Value<String> createTime;
  final Value<String> lastUpdateTime;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.format = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
    this.location = const Value.absent(),
    this.createTime = const Value.absent(),
    this.lastUpdateTime = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required int format,
    required String title,
    required String content,
    this.tags = const Value.absent(),
    this.location = const Value.absent(),
    required String createTime,
    required String lastUpdateTime,
  })  : format = Value(format),
        title = Value(title),
        content = Value(content),
        createTime = Value(createTime),
        lastUpdateTime = Value(lastUpdateTime);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<int>? format,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? tags,
    Expression<String>? location,
    Expression<String>? createTime,
    Expression<String>? lastUpdateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (format != null) 'format': format,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (tags != null) 'tags': tags,
      if (location != null) 'location': location,
      if (createTime != null) 'create_time': createTime,
      if (lastUpdateTime != null) 'last_update_time': lastUpdateTime,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<int>? format,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? tags,
      Value<String?>? location,
      Value<String>? createTime,
      Value<String>? lastUpdateTime}) {
    return NotesCompanion(
      id: id ?? this.id,
      format: format ?? this.format,
      title: title ?? this.title,
      content: content ?? this.content,
      tags: tags ?? this.tags,
      location: location ?? this.location,
      createTime: createTime ?? this.createTime,
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (format.present) {
      map['format'] = Variable<int>(format.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    if (lastUpdateTime.present) {
      map['last_update_time'] = Variable<String>(lastUpdateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('format: $format, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags, ')
          ..write('location: $location, ')
          ..write('createTime: $createTime, ')
          ..write('lastUpdateTime: $lastUpdateTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final Notes notes = Notes(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes];
}
