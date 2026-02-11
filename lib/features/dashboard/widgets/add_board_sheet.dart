import 'package:code_challenge/features/dashboard/controller/boards_controller.dart';
import 'package:code_challenge/models/boards_model.dart';
import 'package:code_challenge/shared/components/app_button.dart';
import 'package:code_challenge/shared/components/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBoardSheet extends ConsumerStatefulWidget {
  final BoardsModel? board;

  const AddBoardSheet({super.key, this.board});

  @override
  ConsumerState<AddBoardSheet> createState() => _AddBoardSheetState();
}

class _AddBoardSheetState extends ConsumerState<AddBoardSheet> {
  late TextEditingController _boardNameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _boardNameController = TextEditingController(text: widget.board?.boardName ?? '');
    _descriptionController = TextEditingController(text: widget.board?.description ?? '');
  }

  @override
  void dispose() {
    _boardNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveBoard() {
    if (_boardNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Board name is required')));
      return;
    }

    BoardsModel board = BoardsModel(
      id: widget.board?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      boardName: _boardNameController.text,
      description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
      createdAt: widget.board?.createdAt ?? DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );

    widget.board != null ? ref.read(boardsProvider.notifier).updateBoard(board) : ref.read(boardsProvider.notifier).saveBoard(board);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                AppTextField(label: widget.board == null ? 'Create Board' : 'Edit Board', controller: _boardNameController, hint: 'Board Name *'),
                const SizedBox(height: 16),
                AppTextField(label: 'Description', controller: _descriptionController, hint: 'Description'),
                const SizedBox(height: 16),

                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton.text(onPressed: () => Navigator.pop(context), expands: false, title: "Cancel"),
                      const SizedBox(width: 12),
                      AppButton.primary(onPressed: _saveBoard, expands: false, title: "Save"),
                    ],
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
