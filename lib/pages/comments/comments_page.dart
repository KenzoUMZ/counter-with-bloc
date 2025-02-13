import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'cubit/comments_cubit.dart';
import 'cubit/comments_cubit_state.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late CommentsCubit _cubit;

  @override
  void initState(){
    _cubit = CommentsCubit()..getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommentsCubit, CommentsCubitState>(
        bloc: _cubit,
        builder: (_, state){
          if(state.comments.isEmpty && state.isLoading == false){
            return Text('Comentarios não encontrados');
          }
          if(state.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: state.comments.length,
            separatorBuilder: (_, index) => const Gap(10),
            itemBuilder: (_, index){
              return ListTile(
                title: Text(
                  state.comments[index].name?? '',
                ),
                subtitle: Text(
                  state.comments[index].body ?? '',
                ),
              );
            },
          );
        },
      )
    );
  }
}