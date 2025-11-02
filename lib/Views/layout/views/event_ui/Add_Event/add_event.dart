import 'package:evently_app/Views/layout/views/event_ui/provider/eventpro.dart';
import 'package:evently_app/Views/layout/widgets/tabs_row.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/models/Category_model.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:evently_app/core/widgets/C_Btn.dart';
import 'package:evently_app/core/widgets/appdialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Eventpro();
      },
      child: Consumer<Eventpro>(
        builder: (BuildContext context, pro, Widget? child) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios),
            ),

            title: Text('Add Event', style: theme.textTheme.titleSmall),
          ),

          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.h,
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.asset(
                        pro.selectedCategory.imageUrl,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      ),
                    ),
                    16.h,
                    Tabs_Row(
                      onTap: (p1) => pro.ontabchange(p1),
                      tabindex: pro.tabindex,
                      categorys: CategoryModel.categories,
                      primery: Appcolors.light,
                      secondry: Appcolors.primary,
                    ),
                    24.h,
                    Form(
                      key: pro.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Event Title',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                          12.h,
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Event Title';
                              }
                              return null;
                            },
                            controller: pro.TitleController,
                            cursorColor: Colors.black54,
                            cursorHeight: 25,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            decoration: InputDecoration(
                              hintText: 'Event Title',
                              prefixIcon: Icon(Icons.edit_note_outlined),
                            ),
                          ),
                          16.h,
                          Text(
                            'Event Description',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    12.h,
                    SizedBox(
                      height: 140,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Event Description';
                          }
                          return null;
                        },
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: null,
                        controller: pro.DescController,
                        cursorColor: Colors.black54,
                        cursorHeight: 25,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: 'Event Description',
                        ),
                      ),
                    ),
                    16.h,
                    Row(
                      children: [
                        Icon(Icons.date_range_outlined),
                        8.w,
                        Text('Event Date', style: theme.textTheme.bodyMedium),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              // lastDate: DateTime(DateTime.now().year + 50),
                              lastDate: DateTime.now().add(
                                Duration(days: 365 * 5),
                              ),
                              initialDate: pro.eventdate ?? DateTime.now(),
                              currentDate: pro.eventdate,
                            ).then(
                              (value) =>
                                  pro.changedate(value ?? DateTime.now()),
                            );
                          },
                          child: Text(
                            pro.eventdate == null
                                ? 'Selected Date'
                                : DateFormat(
                                    ' y/MMM/ d',
                                  ).format(pro.eventdate!),
                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                      ],
                    ),
                    12.h,
                    Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        8.w,
                        Text('Event Time', style: theme.textTheme.bodyMedium),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: pro.eventtime ?? TimeOfDay.now(),
                            ).then((value) {
                              pro.changetime(value ?? TimeOfDay.now());
                            });
                          },
                          child: Text(
                            pro.eventtime?.format(context).toString() ??
                                'Selected Time',

                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                      ],
                    ),
                    24.h,
                    Center(
                      child: SizedBox(
                        height: 60,
                        child: CustomBtn(
                          ontap: () async {
                            await pro
                                .addevent(context)
                                .then(
                                  (value) => value
                                      ? Navigator.pop(context)
                                      : Appdialog.ShowMessage(
                                          context,
                                          title:
                                              'Please Enter Data In ALL Fields',
                                          type: MessageType.error,
                                        ),
                                );
                          },
                          text: 'Add Event',
                          isloading: pro.isloading,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
