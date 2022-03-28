import 'package:bemall_app/app/app_colors.dart';
import 'package:bemall_app/app/app_controller.dart';
import 'package:bemall_app/app/app_theme.dart';
import 'package:bemall_app/app/entities/user_entity.dart';
import 'package:bemall_app/app/modules/shared_components/progress_indicators/custom_circular_progress_indicator.dart';
import 'package:bemall_app/app/repositories/rest_utils/users_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de usuários cadastrados'),
        actions: [IconButton(onPressed: AppController.to.signOut, icon: Icon(Icons.logout,),)],
      ),
      backgroundColor: AppTheme.appColors.primaryColor,
      body: Container(
        child: FutureBuilder(
          future: UsersRepository().getListUsersOnServer(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final listUsers = (snapshot.data) as List<UserEntity>;
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: listUsers.map((user) {
                  return Card(
                    child: ExpansionTile(
                      backgroundColor:
                          AppTheme.appColors.primaryColor.withOpacity(
                        .8,
                      ),
                      collapsedIconColor: AppTheme.appColors.primaryColor,
                      collapsedTextColor: AppTheme.appColors.primaryColor,
                      iconColor: AppTheme.appColors.lightColor,
                      textColor: AppTheme.appColors.lightColor,
                      leading: Icon(Icons.person),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      children: user.address.map((address) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.home_work_outlined,
                                size: 30,
                              ),
                              iconColor:
                                  AppTheme.appColors.secondaryColor.withOpacity(
                                .4,
                              ),
                              textColor: AppTheme.appColors.primaryColor,
                              title: Text(address.logradouro),
                              subtitle: Text(address.cep),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              );
            } else {
              return CustomCircularProgressIndicator(
                color: AppTheme.appColors.lightColor,
              );
            }
          }),
        ),
      ),
    );
  }
}
