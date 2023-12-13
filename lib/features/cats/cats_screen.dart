import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cats_tinder/domain/model/cats_model.dart';
import 'package:cats_tinder/features/cats/cats_cubit.dart';
import 'package:cats_tinder/features/cats/cats_state.dart';

class Cats extends StatefulWidget {
  const Cats({super.key});

  @override
  State<Cats> createState() => _CatsState();
}

class _CatsState extends State<Cats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Cats Favourites'),
      ),
      body: BlocProvider(
        create: (context) => CatsCubit(),
        child: BlocConsumer<CatsCubit, CatsState>(
          listener: (context, state) {
            if (state is CatsError) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('error'),
                    content: Text(state.error),
                  );
                },
              );
            }
          },
          buildWhen: (previous, current) => current is CatsBuildState,
          builder: (context, state) {
            if (state is CatsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (state is FavouritesData) {
              return FavouritesWidget(
                cats: state.cats,
              );
            }
            return const CatInitWidget();
          },
        ),
      ),
    );
  }
}

// Обязательно переписать!!!
class CatInitWidget extends StatelessWidget {
  const CatInitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Справочник героев',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<CatsCubit>().getFavourites();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text(
              'Загрузить информацию',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavouritesWidget extends StatelessWidget {
  final List<CatsModel> cats;

  const FavouritesWidget({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return SingleCatWidget(
            cat: cats[index],
          );
        },
      ),
    );
  }
}

class SingleCatWidget extends StatelessWidget {
  final CatsModel cat;

  const SingleCatWidget({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Image.network(
          cat.url,
          height: cat.height.toDouble(),
          width: cat.width.toDouble(),
      ),
    );
  }
}
