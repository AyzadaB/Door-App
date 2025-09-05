import 'package:door_app/logic/cubit/login_cubit.dart';
import 'package:door_app/logic/cubit/login_state.dart';
import 'package:door_app/presentation/pages/home_page.dart';
import 'package:door_app/presentation/widgets/btn_widget.dart';
import 'package:door_app/presentation/widgets/logo_widget.dart';
import 'package:door_app/presentation/widgets/sign_up_widget.dart';
import 'package:door_app/presentation/widgets/sub_title.dart';
import 'package:door_app/presentation/widgets/text_field_widget.dart';
import 'package:door_app/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Кирүү ийгиликтүү! ${state.user.firstName}"),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              } else if (state is LoginError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoWidget(),
                  const SizedBox(height: 20),
                  const TitleWidget(title: "Доорго кош келиниз!"),
                  const SizedBox(height: 10),
                  const SubTitle(
                    subTitle: "Сынак тапшыруу үчүн платформага кириниз",
                  ),
                  const SizedBox(height: 30),
                  TextFieldWidget(title: "Логин", controller: _loginController),
                  const SizedBox(height: 15),
                  TextFieldWidget(
                    title: "Сыр сөз",
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 30),
                  BtnWidget(
                    title: state is LoginLoading ? "Жүктөлүүдө..." : "Кирүү",
                    onPressed: state is LoginLoading
                        ? () {}
                        : () {
                            context.read<LoginCubit>().login(
                              login: _loginController.text,
                              password: _passwordController.text,
                            );
                          },
                  ),
                  const SizedBox(height: 15),
                  const SignUpWidget(title: "Аккаунт жокпу? Катталыныз"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
