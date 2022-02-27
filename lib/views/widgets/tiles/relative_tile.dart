import '../alert_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/models/relative_model.dart';
import '../../../logic/bloc/relative_bloc/relative_bloc.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';
import '../../../utilities/text_styles.dart';

class RelativeTile extends StatelessWidget {
  final SingleRelativeData? relativeDetails;
  final Function onTapEditButton;

  const RelativeTile(
      {Key? key, required this.relativeDetails, required this.onTapEditButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: unselectedColor,
              blurRadius: 0.5,
              offset: Offset.fromDirection(0.5),
            ),
          ],
        ),
        height: 58,
        child: Row(
          children: [
            const SizedBox(width: 5),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      relativeDetails?.fullName ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: tableDataHeading,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      DateFormat('d-M-yyyy').format(
                          relativeDetails?.dateAndTimeOfBirth ??
                              DateTime.now()),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: tableDataHeading,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      DateFormat('H:m').format(
                          relativeDetails?.dateAndTimeOfBirth ??
                              DateTime.now()),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: tableDataHeading,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      relativeDetails?.relation ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: tableDataHeading,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.27,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => onTapEditButton(relativeDetails),
                      icon: Icon(
                        Icons.edit,
                        color: primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                      onPressed: () {
                        var deletionDialog = AlertDialogBox(
                            content: "Do you really want to Delete?",
                            yesOnPressed: () {
                              BlocProvider.of<RelativeBloc>(context).add(
                                  RelativeDeletionEvent(
                                      deleteRelativeUUID:
                                          relativeDetails?.uuid ?? ""));
                              Navigator.pop(context);
                            },
                            noOnPressed: () {
                              Navigator.pop(context);
                            },
                            yes: "Yes",
                            no: "No");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => deletionDialog);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
