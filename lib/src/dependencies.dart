import 'package:clothing_store_firestore_crud/src/data/repositorys/auth_repository_impl.dart';
import 'package:clothing_store_firestore_crud/src/data/repositorys/bag_repository_impl.dart';
import 'package:clothing_store_firestore_crud/src/data/repositorys/categorie_repository_impl.dart';
import 'package:clothing_store_firestore_crud/src/data/repositorys/local_repository_impl.dart';
import 'package:clothing_store_firestore_crud/src/data/repositorys/product_repository_impl.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/auth_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/bag_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/categorie_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/local_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/repositorys/product_repository.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/auth_usecase.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/bag_usecase.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/categorie_usecase.dart';
import 'package:clothing_store_firestore_crud/src/domain/usecase/product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// List of RepositoryProvider widgets for building repositories
List<RepositoryProvider> buildRepositories = [
  // Repository providers
  RepositoryProvider<ProductRepositoryInterface>(
    create: (context) => ProductRepositoryImpl(),
  ),
  RepositoryProvider<CategorieRepositoryInterface>(
    create: (context) => CategorieRepositoryImpl(),
  ),
  RepositoryProvider<AuthRepositoryInterface>(
    create: (context) => AuthRepositoryImpl(),
  ),
  RepositoryProvider<BagRepositoryInterface>(
    create: (context) => BagRepositoryImpl(),
  ),
  RepositoryProvider<LocalRepositoryInterface>(
    create: (context) => LocalRepositoryImpl(),
  ),

  // UseCase providers
  RepositoryProvider<ProductUseCase>(
    create: (context) => ProductUseCase(
      context.read(),
    ),
  ),
  RepositoryProvider<CategorieUseCase>(
    create: (context) => CategorieUseCase(
      context.read(),
    ),
  ),
  RepositoryProvider<AuthUseCase>(
    create: (context) => AuthUseCase(
      context.read(),
      context.read(),
    ),
  ),
  RepositoryProvider<BagUseCase>(
    create: (context) => BagUseCase(
      context.read(),
      context.read(),
    ),
  ),
];
