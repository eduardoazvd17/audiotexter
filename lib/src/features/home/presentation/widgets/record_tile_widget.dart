import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../audio/data/models/record_model.dart';

class RecordTileWidget extends StatelessWidget {
  final RecordModel recordModel;
  final void Function()? onOpen;
  final void Function()? onDelete;

  const RecordTileWidget({
    super.key,
    required this.recordModel,
    this.onOpen,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(recordModel.title),
          subtitle: Text(recordModel.formattedDate),
          onTap: onOpen,
          contentPadding: EdgeInsets.only(
            left: 15,
            right: onDelete == null ? 15 : 0,
          ),
          trailing: onDelete != null
              ? IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                )
              : null,
        ),
        const Divider(height: 0),
      ],
    );
  }
}