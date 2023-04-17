import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_bloc.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';
import 'models/user_model.dart';
import 'repository/user_repository.dart';

class BlockHomePage extends StatelessWidget {
  final String Username;
  final String Password;

  BlockHomePage(
      {super.key,
      required this.Username,
      required this.Password,
      required String title});

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
          appBar: AppBar(title: const Text('Bloc Pattern List View')),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 15,
                      bottom: 0,
                      right: 0,
                      top: 10), //apply padding to some sides only

                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Username : ' + Username,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                /*  Text(
                  Align(
                    alignment: Alignment.topLeft,
                  )
                  'Username : ' + Username,
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Listview One',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                Container(
                    // height: MediaQuery.of(context).size.height / 1,
                    height: 300,
                    child: blocBody()),
                Divider(),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Listview Two',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    )),
                Container(
                  height: 300,
                  // height: MediaQuery.of(context).size.height / 1,
                  child: blocBody(),
                ),
              ],
            ),
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
