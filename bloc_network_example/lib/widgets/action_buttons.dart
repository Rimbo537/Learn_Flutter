import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // второй вариант получения доступа к блоку
    final UserBloc userBloc = context.read<UserBloc>();

    // в первом случае есть необязательный параметр listen: false,
    // он используется только в callback (в основном он используется только в кнопках)
    // final UserBloc _userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    // третий вариант получения доступа к блоку
    // final UserBloc userBloc = context.watch<UserBloc>();
    // final UserBloc _userBloc = BlocProvider.of<UserBloc>(context, listen: true);
    // подписываемся на прослушку нашего приложения, на изменение
    // если чтото изменилось, то блок будет слушать и сразу отображать в пользователськом интерфейсе
    // метод context.watch<UserBloc>() используется только в методе build!

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          child: Text('Load'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          child: Text('Clear'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
      ],
    );
  }
}
