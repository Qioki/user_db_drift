import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:user_db_drift/presentation/cubits/user_form/user_form_cubit.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;

class UserForm extends StatelessWidget {
  const UserForm({super.key, this.userId});
  final int? userId;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserFormCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('User form')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: FutureBuilder<FormGroup>(
            future: cubit.getUserForm(userId),
            builder: (context, snapshot) => !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : ReactiveFormBuilder(
                    form: () => snapshot.data!,
                    builder: (context, form, child) {
                      return SizedBox(
                        height: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReactiveTextField<String>(
                              formControlName: 'firstname',
                              decoration:
                                  const InputDecoration(labelText: 'Firstname'),
                            ),
                            ReactiveTextField<String>(
                              formControlName: 'lastname',
                              decoration:
                                  const InputDecoration(labelText: 'Lastname'),
                            ),
                            ReactiveTextField<DateTime>(
                              formControlName: 'birthday',
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Birthday',
                                suffixIcon: ReactiveDatePicker<DateTime>(
                                  formControlName: 'birthday',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  builder: (context, picker, child) =>
                                      IconButton(
                                    onPressed: picker.showPicker,
                                    icon: const Icon(Icons.date_range),
                                  ),
                                ),
                              ),
                            ),
                            ReactiveTextField<String>(
                              formControlName: 'phone',
                              decoration:
                                  const InputDecoration(labelText: 'Phone'),
                            ),
                            ReactiveTextField<String>(
                              formControlName: 'card',
                              decoration:
                                  const InputDecoration(labelText: 'Card'),
                            ),
                            ReactiveFormConsumer(
                              builder: (context, form, child) {
                                return ElevatedButton(
                                  onPressed: form.valid
                                      ? () {
                                          print(form.value);
                                          if (userId == null) {
                                            cubit.addUser(form.value);
                                            Navigator.pop(context);
                                          } else {
                                            cubit.updateUser(
                                                userId!, form.value);
                                          }
                                        }
                                      : null,
                                  child: const Text('CONTINUE'),
                                );
                              },
                            ),
                            ElevatedButton(
                              onPressed: () => form.reset(),
                              child: const Text('RESET'),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}
