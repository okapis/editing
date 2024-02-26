// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Configuration extends Table
    with TableInfo<Configuration, ConfigurationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Configuration(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _lastUpdateTimeMeta =
      const VerificationMeta('lastUpdateTime');
  late final GeneratedColumn<String> lastUpdateTime = GeneratedColumn<String>(
      'last_update_time', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [name, value, createTime, lastUpdateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'configuration';
  @override
  VerificationContext validateIntegrity(Insertable<ConfigurationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('last_update_time')) {
      context.handle(
          _lastUpdateTimeMeta,
          lastUpdateTime.isAcceptableOrUnknown(
              data['last_update_time']!, _lastUpdateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  ConfigurationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfigurationData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time']),
      lastUpdateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_update_time']),
    );
  }

  @override
  Configuration createAlias(String alias) {
    return Configuration(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ConfigurationData extends DataClass
    implements Insertable<ConfigurationData> {
  final String name;
  final String value;
  final String? createTime;
  final String? lastUpdateTime;
  const ConfigurationData(
      {required this.name,
      required this.value,
      this.createTime,
      this.lastUpdateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['value'] = Variable<String>(value);
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<String>(createTime);
    }
    if (!nullToAbsent || lastUpdateTime != null) {
      map['last_update_time'] = Variable<String>(lastUpdateTime);
    }
    return map;
  }

  ConfigurationCompanion toCompanion(bool nullToAbsent) {
    return ConfigurationCompanion(
      name: Value(name),
      value: Value(value),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
      lastUpdateTime: lastUpdateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdateTime),
    );
  }

  factory ConfigurationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigurationData(
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
      createTime: serializer.fromJson<String?>(json['create_time']),
      lastUpdateTime: serializer.fromJson<String?>(json['last_update_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
      'create_time': serializer.toJson<String?>(createTime),
      'last_update_time': serializer.toJson<String?>(lastUpdateTime),
    };
  }

  ConfigurationData copyWith(
          {String? name,
          String? value,
          Value<String?> createTime = const Value.absent(),
          Value<String?> lastUpdateTime = const Value.absent()}) =>
      ConfigurationData(
        name: name ?? this.name,
        value: value ?? this.value,
        createTime: createTime.present ? createTime.value : this.createTime,
        lastUpdateTime:
            lastUpdateTime.present ? lastUpdateTime.value : this.lastUpdateTime,
      );
  @override
  String toString() {
    return (StringBuffer('ConfigurationData(')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('createTime: $createTime, ')
          ..write('lastUpdateTime: $lastUpdateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, value, createTime, lastUpdateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigurationData &&
          other.name == this.name &&
          other.value == this.value &&
          other.createTime == this.createTime &&
          other.lastUpdateTime == this.lastUpdateTime);
}

class ConfigurationCompanion extends UpdateCompanion<ConfigurationData> {
  final Value<String> name;
  final Value<String> value;
  final Value<String?> createTime;
  final Value<String?> lastUpdateTime;
  final Value<int> rowid;
  const ConfigurationCompanion({
    this.name = const Value.absent(),
    this.value = const Value.absent(),
    this.createTime = const Value.absent(),
    this.lastUpdateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConfigurationCompanion.insert({
    required String name,
    required String value,
    this.createTime = const Value.absent(),
    this.lastUpdateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        value = Value(value);
  static Insertable<ConfigurationData> custom({
    Expression<String>? name,
    Expression<String>? value,
    Expression<String>? createTime,
    Expression<String>? lastUpdateTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (value != null) 'value': value,
      if (createTime != null) 'create_time': createTime,
      if (lastUpdateTime != null) 'last_update_time': lastUpdateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConfigurationCompanion copyWith(
      {Value<String>? name,
      Value<String>? value,
      Value<String?>? createTime,
      Value<String?>? lastUpdateTime,
      Value<int>? rowid}) {
    return ConfigurationCompanion(
      name: name ?? this.name,
      value: value ?? this.value,
      createTime: createTime ?? this.createTime,
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    if (lastUpdateTime.present) {
      map['last_update_time'] = Variable<String>(lastUpdateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigurationCompanion(')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('createTime: $createTime, ')
          ..write('lastUpdateTime: $lastUpdateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Journals extends Table with TableInfo<Journals, Journal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Journals(this.attachedDatabase, [this._alias]);
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
      'title', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
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
  static const VerificationMeta _weatherMeta =
      const VerificationMeta('weather');
  late final GeneratedColumn<String> weather = GeneratedColumn<String>(
      'weather', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
      'mood', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _lastUpdateTimeMeta =
      const VerificationMeta('lastUpdateTime');
  late final GeneratedColumn<String> lastUpdateTime = GeneratedColumn<String>(
      'last_update_time', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        format,
        title,
        content,
        tags,
        location,
        weather,
        mood,
        createTime,
        lastUpdateTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journals';
  @override
  VerificationContext validateIntegrity(Insertable<Journal> instance,
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
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('weather')) {
      context.handle(_weatherMeta,
          weather.isAcceptableOrUnknown(data['weather']!, _weatherMeta));
    }
    if (data.containsKey('mood')) {
      context.handle(
          _moodMeta, mood.isAcceptableOrUnknown(data['mood']!, _moodMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('last_update_time')) {
      context.handle(
          _lastUpdateTimeMeta,
          lastUpdateTime.isAcceptableOrUnknown(
              data['last_update_time']!, _lastUpdateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Journal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Journal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}format'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      weather: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}weather']),
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mood']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time']),
      lastUpdateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_update_time']),
    );
  }

  @override
  Journals createAlias(String alias) {
    return Journals(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Journal extends DataClass implements Insertable<Journal> {
  final int id;
  final int format;
  final String? title;
  final String? content;
  final String? tags;
  final String? location;
  final String? weather;
  final String? mood;
  final String? createTime;
  final String? lastUpdateTime;
  const Journal(
      {required this.id,
      required this.format,
      this.title,
      this.content,
      this.tags,
      this.location,
      this.weather,
      this.mood,
      this.createTime,
      this.lastUpdateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['format'] = Variable<int>(format);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || weather != null) {
      map['weather'] = Variable<String>(weather);
    }
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<String>(mood);
    }
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<String>(createTime);
    }
    if (!nullToAbsent || lastUpdateTime != null) {
      map['last_update_time'] = Variable<String>(lastUpdateTime);
    }
    return map;
  }

  JournalsCompanion toCompanion(bool nullToAbsent) {
    return JournalsCompanion(
      id: Value(id),
      format: Value(format),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      weather: weather == null && nullToAbsent
          ? const Value.absent()
          : Value(weather),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
      lastUpdateTime: lastUpdateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdateTime),
    );
  }

  factory Journal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Journal(
      id: serializer.fromJson<int>(json['id']),
      format: serializer.fromJson<int>(json['format']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      tags: serializer.fromJson<String?>(json['tags']),
      location: serializer.fromJson<String?>(json['location']),
      weather: serializer.fromJson<String?>(json['weather']),
      mood: serializer.fromJson<String?>(json['mood']),
      createTime: serializer.fromJson<String?>(json['create_time']),
      lastUpdateTime: serializer.fromJson<String?>(json['last_update_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'format': serializer.toJson<int>(format),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<String?>(content),
      'tags': serializer.toJson<String?>(tags),
      'location': serializer.toJson<String?>(location),
      'weather': serializer.toJson<String?>(weather),
      'mood': serializer.toJson<String?>(mood),
      'create_time': serializer.toJson<String?>(createTime),
      'last_update_time': serializer.toJson<String?>(lastUpdateTime),
    };
  }

  Journal copyWith(
          {int? id,
          int? format,
          Value<String?> title = const Value.absent(),
          Value<String?> content = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> weather = const Value.absent(),
          Value<String?> mood = const Value.absent(),
          Value<String?> createTime = const Value.absent(),
          Value<String?> lastUpdateTime = const Value.absent()}) =>
      Journal(
        id: id ?? this.id,
        format: format ?? this.format,
        title: title.present ? title.value : this.title,
        content: content.present ? content.value : this.content,
        tags: tags.present ? tags.value : this.tags,
        location: location.present ? location.value : this.location,
        weather: weather.present ? weather.value : this.weather,
        mood: mood.present ? mood.value : this.mood,
        createTime: createTime.present ? createTime.value : this.createTime,
        lastUpdateTime:
            lastUpdateTime.present ? lastUpdateTime.value : this.lastUpdateTime,
      );
  @override
  String toString() {
    return (StringBuffer('Journal(')
          ..write('id: $id, ')
          ..write('format: $format, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags, ')
          ..write('location: $location, ')
          ..write('weather: $weather, ')
          ..write('mood: $mood, ')
          ..write('createTime: $createTime, ')
          ..write('lastUpdateTime: $lastUpdateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, format, title, content, tags, location,
      weather, mood, createTime, lastUpdateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Journal &&
          other.id == this.id &&
          other.format == this.format &&
          other.title == this.title &&
          other.content == this.content &&
          other.tags == this.tags &&
          other.location == this.location &&
          other.weather == this.weather &&
          other.mood == this.mood &&
          other.createTime == this.createTime &&
          other.lastUpdateTime == this.lastUpdateTime);
}

class JournalsCompanion extends UpdateCompanion<Journal> {
  final Value<int> id;
  final Value<int> format;
  final Value<String?> title;
  final Value<String?> content;
  final Value<String?> tags;
  final Value<String?> location;
  final Value<String?> weather;
  final Value<String?> mood;
  final Value<String?> createTime;
  final Value<String?> lastUpdateTime;
  const JournalsCompanion({
    this.id = const Value.absent(),
    this.format = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
    this.location = const Value.absent(),
    this.weather = const Value.absent(),
    this.mood = const Value.absent(),
    this.createTime = const Value.absent(),
    this.lastUpdateTime = const Value.absent(),
  });
  JournalsCompanion.insert({
    this.id = const Value.absent(),
    required int format,
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
    this.location = const Value.absent(),
    this.weather = const Value.absent(),
    this.mood = const Value.absent(),
    this.createTime = const Value.absent(),
    this.lastUpdateTime = const Value.absent(),
  }) : format = Value(format);
  static Insertable<Journal> custom({
    Expression<int>? id,
    Expression<int>? format,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? tags,
    Expression<String>? location,
    Expression<String>? weather,
    Expression<String>? mood,
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
      if (weather != null) 'weather': weather,
      if (mood != null) 'mood': mood,
      if (createTime != null) 'create_time': createTime,
      if (lastUpdateTime != null) 'last_update_time': lastUpdateTime,
    });
  }

  JournalsCompanion copyWith(
      {Value<int>? id,
      Value<int>? format,
      Value<String?>? title,
      Value<String?>? content,
      Value<String?>? tags,
      Value<String?>? location,
      Value<String?>? weather,
      Value<String?>? mood,
      Value<String?>? createTime,
      Value<String?>? lastUpdateTime}) {
    return JournalsCompanion(
      id: id ?? this.id,
      format: format ?? this.format,
      title: title ?? this.title,
      content: content ?? this.content,
      tags: tags ?? this.tags,
      location: location ?? this.location,
      weather: weather ?? this.weather,
      mood: mood ?? this.mood,
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
    if (weather.present) {
      map['weather'] = Variable<String>(weather.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
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
    return (StringBuffer('JournalsCompanion(')
          ..write('id: $id, ')
          ..write('format: $format, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags, ')
          ..write('location: $location, ')
          ..write('weather: $weather, ')
          ..write('mood: $mood, ')
          ..write('createTime: $createTime, ')
          ..write('lastUpdateTime: $lastUpdateTime')
          ..write(')'))
        .toString();
  }
}

class JournalImages extends Table with TableInfo<JournalImages, JournalImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  JournalImages(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _journalsIdMeta =
      const VerificationMeta('journalsId');
  late final GeneratedColumn<int> journalsId = GeneratedColumn<int>(
      'journals_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES journals(id)');
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _thumbnailPathMeta =
      const VerificationMeta('thumbnailPath');
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
      'thumbnail_path', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [id, journalsId, filePath, thumbnailPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_images';
  @override
  VerificationContext validateIntegrity(Insertable<JournalImage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('journals_id')) {
      context.handle(
          _journalsIdMeta,
          journalsId.isAcceptableOrUnknown(
              data['journals_id']!, _journalsIdMeta));
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
          _thumbnailPathMeta,
          thumbnailPath.isAcceptableOrUnknown(
              data['thumbnail_path']!, _thumbnailPathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalImage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      journalsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}journals_id']),
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      thumbnailPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_path']),
    );
  }

  @override
  JournalImages createAlias(String alias) {
    return JournalImages(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class JournalImage extends DataClass implements Insertable<JournalImage> {
  final int id;
  final int? journalsId;
  final String filePath;
  final String? thumbnailPath;
  const JournalImage(
      {required this.id,
      this.journalsId,
      required this.filePath,
      this.thumbnailPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || journalsId != null) {
      map['journals_id'] = Variable<int>(journalsId);
    }
    map['file_path'] = Variable<String>(filePath);
    if (!nullToAbsent || thumbnailPath != null) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath);
    }
    return map;
  }

  JournalImagesCompanion toCompanion(bool nullToAbsent) {
    return JournalImagesCompanion(
      id: Value(id),
      journalsId: journalsId == null && nullToAbsent
          ? const Value.absent()
          : Value(journalsId),
      filePath: Value(filePath),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
    );
  }

  factory JournalImage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalImage(
      id: serializer.fromJson<int>(json['id']),
      journalsId: serializer.fromJson<int?>(json['journals_id']),
      filePath: serializer.fromJson<String>(json['file_path']),
      thumbnailPath: serializer.fromJson<String?>(json['thumbnail_path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'journals_id': serializer.toJson<int?>(journalsId),
      'file_path': serializer.toJson<String>(filePath),
      'thumbnail_path': serializer.toJson<String?>(thumbnailPath),
    };
  }

  JournalImage copyWith(
          {int? id,
          Value<int?> journalsId = const Value.absent(),
          String? filePath,
          Value<String?> thumbnailPath = const Value.absent()}) =>
      JournalImage(
        id: id ?? this.id,
        journalsId: journalsId.present ? journalsId.value : this.journalsId,
        filePath: filePath ?? this.filePath,
        thumbnailPath:
            thumbnailPath.present ? thumbnailPath.value : this.thumbnailPath,
      );
  @override
  String toString() {
    return (StringBuffer('JournalImage(')
          ..write('id: $id, ')
          ..write('journalsId: $journalsId, ')
          ..write('filePath: $filePath, ')
          ..write('thumbnailPath: $thumbnailPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, journalsId, filePath, thumbnailPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalImage &&
          other.id == this.id &&
          other.journalsId == this.journalsId &&
          other.filePath == this.filePath &&
          other.thumbnailPath == this.thumbnailPath);
}

class JournalImagesCompanion extends UpdateCompanion<JournalImage> {
  final Value<int> id;
  final Value<int?> journalsId;
  final Value<String> filePath;
  final Value<String?> thumbnailPath;
  const JournalImagesCompanion({
    this.id = const Value.absent(),
    this.journalsId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
  });
  JournalImagesCompanion.insert({
    this.id = const Value.absent(),
    this.journalsId = const Value.absent(),
    required String filePath,
    this.thumbnailPath = const Value.absent(),
  }) : filePath = Value(filePath);
  static Insertable<JournalImage> custom({
    Expression<int>? id,
    Expression<int>? journalsId,
    Expression<String>? filePath,
    Expression<String>? thumbnailPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (journalsId != null) 'journals_id': journalsId,
      if (filePath != null) 'file_path': filePath,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
    });
  }

  JournalImagesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? journalsId,
      Value<String>? filePath,
      Value<String?>? thumbnailPath}) {
    return JournalImagesCompanion(
      id: id ?? this.id,
      journalsId: journalsId ?? this.journalsId,
      filePath: filePath ?? this.filePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (journalsId.present) {
      map['journals_id'] = Variable<int>(journalsId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalImagesCompanion(')
          ..write('id: $id, ')
          ..write('journalsId: $journalsId, ')
          ..write('filePath: $filePath, ')
          ..write('thumbnailPath: $thumbnailPath')
          ..write(')'))
        .toString();
  }
}

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
      'title', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
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
      'create_time', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _lastUpdateTimeMeta =
      const VerificationMeta('lastUpdateTime');
  late final GeneratedColumn<String> lastUpdateTime = GeneratedColumn<String>(
      'last_update_time', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
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
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
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
    }
    if (data.containsKey('last_update_time')) {
      context.handle(
          _lastUpdateTimeMeta,
          lastUpdateTime.isAcceptableOrUnknown(
              data['last_update_time']!, _lastUpdateTimeMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time']),
      lastUpdateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_update_time']),
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
  final String? title;
  final String? content;
  final String? tags;
  final String? location;
  final String? createTime;
  final String? lastUpdateTime;
  const Note(
      {required this.id,
      required this.format,
      this.title,
      this.content,
      this.tags,
      this.location,
      this.createTime,
      this.lastUpdateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['format'] = Variable<int>(format);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<String>(createTime);
    }
    if (!nullToAbsent || lastUpdateTime != null) {
      map['last_update_time'] = Variable<String>(lastUpdateTime);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      format: Value(format),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
      lastUpdateTime: lastUpdateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdateTime),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      format: serializer.fromJson<int>(json['format']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<String?>(json['content']),
      tags: serializer.fromJson<String?>(json['tags']),
      location: serializer.fromJson<String?>(json['location']),
      createTime: serializer.fromJson<String?>(json['create_time']),
      lastUpdateTime: serializer.fromJson<String?>(json['last_update_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'format': serializer.toJson<int>(format),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<String?>(content),
      'tags': serializer.toJson<String?>(tags),
      'location': serializer.toJson<String?>(location),
      'create_time': serializer.toJson<String?>(createTime),
      'last_update_time': serializer.toJson<String?>(lastUpdateTime),
    };
  }

  Note copyWith(
          {int? id,
          int? format,
          Value<String?> title = const Value.absent(),
          Value<String?> content = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> createTime = const Value.absent(),
          Value<String?> lastUpdateTime = const Value.absent()}) =>
      Note(
        id: id ?? this.id,
        format: format ?? this.format,
        title: title.present ? title.value : this.title,
        content: content.present ? content.value : this.content,
        tags: tags.present ? tags.value : this.tags,
        location: location.present ? location.value : this.location,
        createTime: createTime.present ? createTime.value : this.createTime,
        lastUpdateTime:
            lastUpdateTime.present ? lastUpdateTime.value : this.lastUpdateTime,
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
  final Value<String?> title;
  final Value<String?> content;
  final Value<String?> tags;
  final Value<String?> location;
  final Value<String?> createTime;
  final Value<String?> lastUpdateTime;
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
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
    this.location = const Value.absent(),
    this.createTime = const Value.absent(),
    this.lastUpdateTime = const Value.absent(),
  }) : format = Value(format);
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
      Value<String?>? title,
      Value<String?>? content,
      Value<String?>? tags,
      Value<String?>? location,
      Value<String?>? createTime,
      Value<String?>? lastUpdateTime}) {
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
  late final Configuration configuration = Configuration(this);
  late final Journals journals = Journals(this);
  late final JournalImages journalImages = JournalImages(this);
  late final Notes notes = Notes(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [configuration, journals, journalImages, notes];
}
