import 'package:crm/core/components/formfiledDeco.dart';
import 'package:crm/provider/FormProvider.dart';
import 'package:crm/provider/boxProvider.dart';
import 'package:crm/service/boxService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  TextEditingController editingController1 = TextEditingController();
  TextEditingController editingController2 = TextEditingController();
  // ignore: annotate_overrides
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          icon: const Icon(
            CupertinoIcons.add,
            size: 50,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: CupertinoColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('CRM for Educations'),
                            Form(
                                key: _key,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller: editingController1,
                                      decoration: FormFieldDeco.deco,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return 'fill the gap';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: editingController2,
                                      decoration: FormFieldDeco.deco,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return 'fill the gap';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                )),
                            IconButton(
                                onPressed: () async {
                                  if (_key.currentState!.validate()) {
                                    context.read<BoxProvider>().add({
                                      'name':
                                          editingController1.text.toString(),
                                      'surname':
                                          editingController2.text.toString()
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                                icon:
                                    const Icon(CupertinoIcons.chevron_forward))
                          ],
                        ),
                      ),
                    ));
          }),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, __) {
              return Slidable(
                  endActionPane: ActionPane(children: [
                    SlidableAction(
                      onPressed: (v) {
                        context.read<BoxProvider>().delate(__);
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ], motion: const ScrollMotion()),
                  child: Card(
                    child: ListTile(
                      title: Text(context
                          .watch<BoxProvider>()
                          .mybox
                          .getAt(__)!['name']
                          .toString()),
                      subtitle: Text(
                          Boxservice.mybox!.getAt(__)!['surname'].toString()),
                    ),
                  ));
            },
            itemCount: Boxservice.mybox!.length,
          ),
        ),
      ]),
    );
  }
}
