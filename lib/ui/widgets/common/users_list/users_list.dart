import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'users_list_model.dart';

class UsersList extends StackedView<UsersListModel> {
  const UsersList({super.key});

  @override
  Widget builder(
    BuildContext context,
    UsersListModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  UsersListModel viewModelBuilder(
    BuildContext context,
  ) =>
      UsersListModel();
}
