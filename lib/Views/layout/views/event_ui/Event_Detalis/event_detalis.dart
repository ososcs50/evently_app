import 'package:evently_app/Views/layout/views/event_ui/provider/eventpro.dart';
import 'package:evently_app/core/constant/extension/nav.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetalis extends StatelessWidget {
  final EventModel event;
  const EventDetalis({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Eventpro();
      },
      child: Consumer<Eventpro>(
        builder: (BuildContext context, Eventpro pro, Widget? child) =>
            Scaffold(
              appBar: AppBar(
                title: Text('Event Detalis', style: theme.textTheme.titleSmall),
                actionsPadding: EdgeInsets.all(8),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ApprouteName.editevent,
                        arguments: event,
                      );
                    },
                    icon: Icon(Iconsax.edit_2_bold),
                  ),

                  IconButton(
                    icon: Icon(Iconsax.trash_outline, color: Appcolors.red),
                    onPressed: () async {
                      await pro.delete_Event(event.id);
                      context.pop();
                    },
                  ),
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.asset(event.imageUrl),
                      ),
                      8.h,
                      Text(event.title, style: theme.textTheme.titleSmall),
                      8.h,
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Appcolors.primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          leading: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Appcolors.primary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Iconsax.calendar_2_bold,
                              color: Appcolors.light,
                              size: 32,
                            ),
                          ),
                          title: Text(
                            DateFormat(
                              'd-MMMM-y',
                            ).format(DateTime.parse(event.date)),
                            style: theme.textTheme.titleSmall!.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(event.time),
                          subtitleTextStyle: theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                      12.h,
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Appcolors.primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          leading: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Appcolors.primary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.my_location,
                              color: Appcolors.light,
                              size: 32,
                            ),
                          ),
                          title: Text(
                            'Egypt , Cairo',
                            style: theme.textTheme.titleSmall!.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      12.h,
                      Container(
                        height: 360,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Appcolors.primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          Iconsax.map_1_bold,
                          color: Appcolors.primary,
                          size: 55,
                        ),
                      ),
                      12.h,
                      Text('Description:\n ${event.desc}'),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
