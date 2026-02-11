import 'package:code_challenge/features/board_view/controller/task_controller.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:code_challenge/shared/components/app_button.dart';
import 'package:code_challenge/shared/components/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskSheet extends ConsumerStatefulWidget {
  final TaskModel? task;
  final String? boardId;

  const TaskSheet({super.key, this.task, required this.boardId});

  @override
  ConsumerState<TaskSheet> createState() => _TaskSheetState();
}

class _TaskSheetState extends ConsumerState<TaskSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late TaskPriority _selectedPriority;
  late TaskStatus _selectedStatus;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController = TextEditingController(text: widget.task?.description ?? '');
    _selectedPriority = TaskPriority.fromValue(widget.task?.priority);
    _selectedStatus = TaskStatus.fromValue(widget.task?.status);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveTask() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Title is required')));
      return;
    }

    setState(() => _isLoading = true);

    final task = TaskModel(
      id: widget.task?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      boardId: widget.boardId ?? widget.task?.boardId ?? 'default_board',
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim().isNotEmpty ? _descriptionController.text.trim() : null,
      priority: _selectedPriority.value,
      status: _selectedStatus.value,
      createdAt: widget.task?.createdAt ?? DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    if (widget.task != null) {
      await ref.read(tasksProvider.notifier).updateTask(task);
    } else {
      await ref.read(tasksProvider.notifier).saveTask(task);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;

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
                AppTextField(
                  label: isEditing ? 'Edit Task' : 'Create Task',
                  controller: _titleController,
                  hint: 'Task title *',
                  // enabled: !_isLoading,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Description',
                  controller: _descriptionController,
                  hint: 'Add description (optional)',
                  // maxLines: 3,
                  // enabled: !_isLoading,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField.dropdown(
                        hint: 'Priority',
                        label: 'Task Priority',
                        initialValue: _selectedPriority,
                        itemLabel: (priority) => priority.title,
                        items: TaskPriority.values,
                        onChanged: _isLoading
                            ? null
                            : (value) {
                                if (value != null) {
                                  setState(() => _selectedPriority = value as TaskPriority);
                                }
                              },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppTextField.dropdown(
                        hint: 'Status',
                        label: 'Task Status',
                        initialValue: _selectedStatus,
                        itemLabel: (status) => status.title,
                        items: TaskStatus.values,
                        onChanged: _isLoading
                            ? null
                            : (value) {
                                if (value != null) {
                                  setState(() => _selectedStatus = value as TaskStatus);
                                }
                              },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton.text(onPressed: _isLoading ? null : () => Navigator.pop(context), expands: false, title: 'Cancel'),
                      const SizedBox(width: 12),
                      AppButton.primary(
                        onPressed: _isLoading ? null : _saveTask,
                        expands: false,
                        title: 'Save',
                        // isLoading: _isLoading
                      ),
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
