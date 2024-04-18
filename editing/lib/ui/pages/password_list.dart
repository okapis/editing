import 'package:editing/service/password_service.dart';
import 'package:editing/store/password_list.dart';
import 'package:editing/ui/widgets/list_item_wrapper.dart';
import 'package:editing/ui/widgets/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/password.dart';

class PasswordListPage extends StatefulWidget {
  const PasswordListPage({super.key});

  @override
  State<PasswordListPage> createState() => _PasswordListPageState();
}

class _PasswordListPageState extends State<PasswordListPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  Future<void> onRefresh() async {
    return Provider.of<PasswordListStore>(context, listen: false).fetchAll();
  }

  Future<void> onItemClicked(int id) async {
    Navigator.of(context).pushNamed("/password/detail", arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final passwordListStore = Provider.of<PasswordListStore>(context);

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: onRefresh,
      child: Row(
        children: [
          Observer(
            builder: (_) => Expanded(
              child: ListView.builder(
                itemCount: passwordListStore.passwords.length,
                itemBuilder: (_, index) {
                  final item = passwordListStore.passwords[index];
                  final id = item.id!;
                  return ListItemWrapper(
                      onClick: () => onItemClicked(id),
                      child: PasswordListItem(
                        id: id,
                        title: item.title,
                        createTime: item.createTime,
                        remark: item.remark,
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
