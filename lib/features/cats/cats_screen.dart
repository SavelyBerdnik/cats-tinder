// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cats_tinder/domain/model/cats_model.dart';
// import 'package:cats_tinder/features/cats/cats_cubit.dart';
// import 'package:cats_tinder/features/cats/cats_state.dart';
//
// class Cats extends StatefulWidget {
//   const Cats({super.key});
//
//   @override
//   State<Cats> createState() => _CatsState();
// }
//
// class _CatsState extends State<Cats> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text('HeroStats'),
//       ),
//       body: BlocProvider(
//         create: (context) => CatsCubit(),
//         child: BlocConsumer<CatsCubit, CatsState>(
//           listener: (context, state) {
//             if (state is CatsError) {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: const Text('error'),
//                     content: Text(state.error),
//                   );
//                 },
//               );
//             }
//           },
//           buildWhen: (previous, current) => current is CatsBuildState,
//           builder: (context, state) {
//             if (state is CatsLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.red,
//                 ),
//               );
//             } else if (state is CatsData) {
//               return CatsWidget(
//                 heroes: state.heroStats,
//               );
//             }
//             return const CatInitWidget();
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class CatInitWidget extends StatelessWidget {
//   const CatInitWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Справочник героев',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 30,
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               context.read<HeroStatsCubit>().getData();
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             child: const Text(
//               'Загрузить информацию',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CatsWidget extends StatelessWidget {
//   final service = CatsService();
//   CatsModel? cats;
//   String? randomCat;
//
//   @override
//   void initState() {
//     super.initState();
//     service.getCats().then((value) {
//       cats = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text('Котики'),
//       ),
//       backgroundColor: Colors.pink.shade200,
//       body: Column(
//         children: [
//           Flexible(
//             flex: 4,
//             child: Center(
//               child: Card(
//                 clipBehavior: Clip.hardEdge,
//                 elevation: 14,
//                 child: SizedBox.square(
//                   dimension: 300,
//                   child: Builder(
//                     builder: (context) {
//                       if (randomCat == null) {
//                         return Center(
//                           child: CircularProgressIndicator(color: Colors.pink.shade200),
//                         );
//                       }
//
//                       return Image.network(
//                         cat.url,
//                         fit: BoxFit.cover,
//                         loadingBuilder: (context, child, loadingProgress) {
//                           if (loadingProgress == null) return child;
//                           return Center(
//                             child: CircularProgressIndicator(color: Colors.pink.shade200),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 2,
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FloatingActionButton.large(
//                     onPressed: () {
//                       getRandomCat();
//                     },
//                     backgroundColor: Colors.red,
//                     child: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                     ),
//                   ),
//                   FloatingActionButton.large(
//                     onPressed: () {
//                       getRandomCat();
//                     },
//                     backgroundColor: Colors.green,
//                     child: const Icon(
//                       Icons.done,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Flexible(
//             child: Center(
//               child: ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.amber,
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//                 ),
//                 icon: const Icon(
//                   Icons.favorite_outline,
//                   size: 24,
//                   color: Colors.white,
//                 ),
//                 label: const Text(
//                   'Check favorites',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void getRandomCat() {
//     setState(() {
//       cats!.imgUrls.shuffle();
//       randomCat = cats!.imgUrls.first;
//     });
//   }
// }