import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_bloc.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';
import 'models/user_model.dart';
import 'repository/user_repository.dart';

class BlockHomePage extends StatelessWidget {
  const BlockHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(UserRepository()),
          ),
          /* BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(UserRepository()),
          ),*/
        ],
        child: Scaffold(
          appBar: AppBar(title: const Text('Bloc Pattern')),
          body: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "List one",
                ),
              ),
              Container(height: 300, child: blocBody()),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "List Two",
                    ),
                  )),
              Container(
                height: 300,
                child: blocBody(),
              ),
            ],
          ),
        ));
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        // color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Text(
                              '${userList[index].firstName}  ${userList[index].lastName}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                            subtitle: Text(
                              '${userList[index].email}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList[index].avatar.toString()),
                            ))),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
