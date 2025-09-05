import 'package:door_app/logic/cubit/sign_up_cubit.dart';
import 'package:door_app/logic/cubit/sign_up_state.dart';
import 'package:door_app/presentation/widgets/btn_widget.dart';
import 'package:door_app/presentation/widgets/logo_widget.dart';
import 'package:door_app/presentation/widgets/sign_up_widget.dart';
import 'package:door_app/presentation/widgets/sub_title.dart';
import 'package:door_app/presentation/widgets/text_field_widget.dart';
import 'package:door_app/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phone = TextEditingController();
  final _login = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Катталуу ийгиликтүү ✅")),
                );
              } else if (state is SignUpError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const Center(child: LogoWidget()),
                  const SizedBox(height: 20),
                  const TitleWidget(title: "Катталуу"),
                  const SubTitle(subTitle: "Төмөндөгү маалыматты толтуруңуз"),
                  const SizedBox(height: 25),
                  TextFieldWidget(title: "Аты", controller: _firstName),
                  const SizedBox(height: 15),
                  TextFieldWidget(title: "Фамилия", controller: _lastName),
                  const SizedBox(height: 15),
                  TextFieldWidget(title: "Телефон номери", controller: _phone),
                  const SizedBox(height: 15),
                  TextFieldWidget(title: "Логин", controller: _login),
                  const SizedBox(height: 15),
                  TextFieldWidget(title: "Сыр сөз", controller: _password),
                  const SizedBox(height: 15),
                  TextFieldWidget(
                    title: "Сыр сөздү кайрадан жазыңыз",
                    controller: _confirmPassword,
                  ),
                  const SizedBox(height: 20),
                  BtnWidget(
                    title: state is SignUpLoading
                        ? "Жүктөлүүдө..."
                        : "Катталуу",
                    onPressed: state is SignUpLoading
                        ? null
                        : () {
                            context.read<SignUpCubit>().signUp(
                              firstName: _firstName.text,
                              lastName: _lastName.text,
                              phone: _phone.text,
                              login: _login.text,
                              password: _password.text,
                              confirmPassword: _confirmPassword.text,
                            );
                          },
                  ),
                  const SizedBox(height: 10),
                  const SignUpWidget(title: "Аккаунт барбы?  Кириниз"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
