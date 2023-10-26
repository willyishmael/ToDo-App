// Mocks generated by Mockito 5.4.2 from annotations
// in todo_app/test/domain/use_cases/todo_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:either_dart/either.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:todo_app/domain/entities/todo_entity.dart' as _i6;
import 'package:todo_app/domain/failures/failures.dart' as _i5;
import 'package:todo_app/domain/repository_protocols/todo_repository_protocol.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TodoRepositoryProtocol].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepositoryProtocol extends _i1.Mock
    implements _i2.TodoRepositoryProtocol {
  @override
  _i3.Future<_i4.Either<_i5.Failure, List<_i6.TodoEntity>>>
      readTodoCollections() => (super.noSuchMethod(
            Invocation.method(
              #readTodoCollections,
              [],
            ),
            returnValue: _i3
                .Future<_i4.Either<_i5.Failure, List<_i6.TodoEntity>>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, List<_i6.TodoEntity>>>(
              this,
              Invocation.method(
                #readTodoCollections,
                [],
              ),
            )),
            returnValueForMissingStub: _i3
                .Future<_i4.Either<_i5.Failure, List<_i6.TodoEntity>>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, List<_i6.TodoEntity>>>(
              this,
              Invocation.method(
                #readTodoCollections,
                [],
              ),
            )),
          ) as _i3.Future<_i4.Either<_i5.Failure, List<_i6.TodoEntity>>>);
}
