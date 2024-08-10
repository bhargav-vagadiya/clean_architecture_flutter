import 'package:clean_arch_flutter/src/features/home/presentation/bloc/photos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosBloc, PhotosState>(
      listener: (context, state) {},
      builder: (context, state) {
        return switch (state) {
          PhotoLoading _ => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          PhotoSuccessState state => Scaffold(
              body: ListView.builder(
                itemBuilder: (context, index) =>
                    Text(state.photos[index].title.toString()),
                itemCount: state.photos.length,
              ),
            ),
          PhotoErrorState state => Scaffold(
              body: Center(
                child: Text(state.error),
              ),
            ),
          _ => const Scaffold()
        };
      },
    );
  }
}
