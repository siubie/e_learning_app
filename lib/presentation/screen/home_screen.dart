import 'package:e_learning/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Api Calling From a Bloc"),
          centerTitle: true,
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is LoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PostBloc>().add(PullToRefreshEvent());
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final posts = state.posts[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(posts.id.toString())),
                        title: Text(posts.title),
                        subtitle: Text(posts.body),
                      ),
                    );
                  },
                  itemCount: state.posts.length,
                ),
              );
            }
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FailedToLoadState) {
              return Center(child: Text(state.message));
            }
            return const Center(
              child: Text("No Data"),
            );
          },
        ));
  }
}
