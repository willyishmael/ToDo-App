import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/entities/unique_id.dart';

class EntryEntity extends Equatable {
  final EntryId id;
  final String description;
  final bool isDone;

  const EntryEntity({
    required this.id,
    required this.description,
    required this.isDone,
  });

  factory EntryEntity.empty() {
    return EntryEntity(
      id: EntryId(),
      description: '',
      isDone: false,
    );
  }

  EntryEntity copyWith({
    String? description,
    bool? isDone,
  }) {
    return EntryEntity(
      id: id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, description, isDone];
}
