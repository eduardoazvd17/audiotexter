import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/recording_model.dart';
import '../../../l10n/l10n.dart';

class RecordingTileWidget extends StatelessWidget {
  final RecordingModel recordingModel;
  final void Function()? onOpen;
  final void Function(RecordingModel, String)? onRename;
  final void Function(RecordingModel)? onDelete;
  final void Function(RecordingModel)? onRestore;
  final bool isFromDeleted;

  const RecordingTileWidget({
    super.key,
    required this.recordingModel,
    this.onOpen,
    this.onRename,
    this.onDelete,
    this.onRestore,
    this.isFromDeleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: recordingModel.name.isEmpty
              ? Opacity(
                  opacity: 0.25,
                  child: Text(AppLocalizations.of(context)!.noName),
                )
              : Text(recordingModel.name),
          subtitle: Text(recordingModel.formattedDate),
          onTap: onOpen,
          contentPadding: EdgeInsets.only(
            left: 15,
            right: onDelete == null ? 15 : 0,
          ),
          leading: onRestore != null
              ? IconButton(
                  onPressed: () => onRestore?.call(recordingModel),
                  icon: Icon(
                    CupertinoIcons.refresh,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : null,
          trailing: onRename != null || onDelete != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (onRename != null) _renameRecordingButton(context),
                    if (onDelete != null) _deleteRecordingButton(context),
                  ],
                )
              : null,
        ),
        const Divider(height: 0),
      ],
    );
  }

  IconButton _deleteRecordingButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog.adaptive(
              title: Text(
                AppLocalizations.of(context)!.deleteRecordingTitle,
              ),
              content: Text(
                isFromDeleted
                    ? AppLocalizations.of(context)!
                        .permanentDeleteRecordingContent(
                        recordingModel.name,
                      )
                    : AppLocalizations.of(context)!.deleteRecordingContent(
                        recordingModel.name,
                      ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    onDelete?.call(recordingModel);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.yes,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    AppLocalizations.of(context)!.no,
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(
        CupertinoIcons.delete,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  IconButton _renameRecordingButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final nameController = TextEditingController(
          text: recordingModel.name,
        );

        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Text(
                AppLocalizations.of(context)!.renameRecording,
              ),
              content: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    autofocus: true,
                    controller: nameController,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      onRename?.call(recordingModel, nameController.text);
                      Navigator.of(context).pop();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    onRename?.call(recordingModel, nameController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.save),
                ),
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(
        CupertinoIcons.pen,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
