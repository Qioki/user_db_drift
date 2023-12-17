import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_db_drift/presentation/cubits/user/user_cubit.dart';
import 'package:user_db_drift/presentation/screens/user_form.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          success: (users) => ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return ListTile(
                title: Text('${user.firstname} ${user.lastname}'),
                subtitle: Text('${user.birthday} ${user.phone}'),
                trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await cubit.deleteUser(user);
                    }),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserForm(
                                userId: users[index].userId,
                              )));
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: SizedBox(height: 700, child: UserForm()),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
