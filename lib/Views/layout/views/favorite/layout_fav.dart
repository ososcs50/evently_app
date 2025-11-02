import 'package:animate_do/animate_do.dart';
import 'package:evently_app/Views/layout/manger/layout_pro.dart';
// import 'package:evently_app/Views/layout/service/layout_service.dart';
import 'package:evently_app/Views/layout/widgets/event_card.dart';
import 'package:evently_app/core/constant/extension/duration.dart';
import 'package:evently_app/core/constant/extension/sizeer.dart';
import 'package:evently_app/core/manger/app_provider.dart';
import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutFav extends StatelessWidget {
  const LayoutFav({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Consumer<LayoutPro>(
            builder:
                (BuildContext context, LayoutPro Layoutpro, Widget? child) =>
                    Column(
                      children: [
                        24.h,
                        TextField(
                          cursorHeight: 25,
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus!.unfocus(),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Appcolors.primary,
                              fontSize: 18,
                            ),
                            hintText: 'Search For Event',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Appcolors.primary,
                              size: 28,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Appcolors.primary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Appcolors.primary,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),

                              borderSide: BorderSide(
                                color: Appcolors.primary,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),

                        24.h,
                        Expanded(
                          child: ListView.builder(
                            itemCount: Layoutpro.favlist.length,
                            itemBuilder: (context, index) {
                              var eventdata = Layoutpro.favlist[index];
                              return index % 2 == 0
                                  ? FadeInLeft(
                                      duration: 350.mill,
                                      child: Event_Card(
                                        islight: pro.islight,

                                        eventdata: eventdata,
                                      ),
                                    )
                                  : FadeInRight(
                                      duration: 350.mill,
                                      child: Event_Card(
                                        islight: pro.islight,

                                        eventdata: eventdata,
                                      ),
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
