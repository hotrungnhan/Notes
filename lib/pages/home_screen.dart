import 'package:chopper/chopper.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/viewmodels/game_list.dart';

import '../models/switch_game.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PlatformText(
                'Switch game table',
                style: platformThemeData(context,
                    material: (t) => t.textTheme.headlineMedium,
                    cupertino: (t) => t.textTheme.navTitleTextStyle),
              ),
              PlatformTextButton(
                onPressed: () => {context.go("/item/1")},
                child: PlatformText("google.com"),
              ),
              BlocBuilder<SwitchGameListBloc, SwitchGameListStateType>(
                  builder: (context, state) {
                return FutureBuilder(
                  future: state,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Flexible(
                          //       // height: 200,
                          child: DataTable2(
                        columns: const [
                          DataColumn2(
                              label: Text(
                                'Id',
                              ),
                              numeric: true,
                              size: ColumnSize.S),
                          DataColumn2(
                              label: Text(
                                'Name',
                              ),
                              size: ColumnSize.L),
                        ],
                        rows: snapshot.data != null
                            ? snapshot.data!.map((i) {
                                return DataRow2(
                                  cells: <DataCell>[
                                    DataCell(Text(i.id.toString())),
                                    DataCell(Text(i.name)),
                                  ],
                                );
                              }).toList()
                            : [],
                      ));
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error!.toString());
                    }
                    return const Text("pending");
                  },
                );
              })
            ],
          ),
        ));
  }
}
