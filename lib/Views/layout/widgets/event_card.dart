import 'package:evently_app/Views/layout/service/layout_service.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Event_Card extends StatelessWidget {
  const Event_Card({super.key, required this.eventdata, this.islight = true});
  final bool islight;

  final EventModel eventdata;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: islight ? Appcolors.light : Appcolors.dark,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            ApprouteName.eventdetalis,
            arguments: eventdata,
          ),
          child: Container(
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(color: Appcolors.primary),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(eventdata.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: islight ? Appcolors.light : Appcolors.dark,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${DateFormat.d().format(DateTime.parse(eventdata.date))}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primary,
                          ),
                        ),
                        Text(
                          '${DateFormat.MMM().format(DateTime.parse(eventdata.date))}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: islight ? Appcolors.light : Appcolors.dark,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        4.w,
                        Expanded(
                          child: Text(
                            eventdata.title,
                            style: TextStyle(
                              color: islight ? Appcolors.dark : Appcolors.light,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        IconButton(
                          icon: eventdata.isFav
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border_outlined),
                          color: Appcolors.primary,
                          onPressed: () {
                            LayoutServices.updateEventFav(eventdata);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
