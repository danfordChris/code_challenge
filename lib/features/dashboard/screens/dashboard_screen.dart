import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/core/theme/custom_colors.dart';
import 'package:code_challenge/features/dashboard/controller/boards_controller.dart';
import 'package:code_challenge/features/dashboard/widgets/add_board_sheet.dart';
import 'package:code_challenge/features/dashboard/widgets/board_card.dart';
import 'package:code_challenge/features/dashboard/widgets/stats_card.dart';
import 'package:code_challenge/features/user_profile/screen/user_profile.dart';
import 'package:code_challenge/models/boards_model.dart';
import 'package:code_challenge/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(boardsProvider.notifier).loadBoards();
    });
  }

  @override
  Widget build(BuildContext context) {
    final boardsState = ref.watch(boardsProvider);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.colorScheme.surface,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(Strings.instance.taskBoards, style: context.textTheme.headlineSmall),
        actions: [
          IconButton(
            onPressed: () {},
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: context.colorScheme.onSurface),
          ),
          IconButton(
            onPressed: () {},
            icon: HugeIcon(icon: HugeIcons.strokeRoundedPreferenceHorizontal, color: context.colorScheme.onSurface),
          ),
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen())),
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSetting07, color: context.colorScheme.onSurface),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _editBoard(),
        backgroundColor: context.colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 24,
          children: [
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: StartsCards(
                    title: Strings.instance.active,
                    count: boardsState.activeTasksCount ?? 0,
                    textColor: context.colorScheme.primaryContainer,
                    cardColor: context.colorScheme.primaryContainer.withAlpha(20),
                    borderColor: context.colorScheme.primary.withAlpha(20),
                  ),
                ),
                Expanded(
                  child: StartsCards(
                    title: Strings.instance.total,
                    count: boardsState.pendingTasksCount ?? 0,
                    textColor: context.colorScheme.outline,
                    cardColor: context.colorScheme.outline.withAlpha(20),
                    borderColor: context.colorScheme.outlineVariant.withAlpha(20),
                  ),
                ),
                Expanded(
                  child: StartsCards(
                    title: Strings.instance.done,
                    count: boardsState.completedTasksCount ?? 0,
                    textColor: context.customColors.onSuccessContainer,
                    cardColor: context.customColors.onSuccessContainer.withAlpha(20),
                    borderColor: context.customColors.successContainer,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.instance.yourBoards, style: context.textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Expanded(
                    child: boardsState.boards.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                HugeIcon(icon: HugeIcons.strokeRoundedDashboardSquare02, size: 64, color: context.colorScheme.outline),
                                const SizedBox(height: 12),
                                Text(Strings.instance.noBoardsYet, style: context.textTheme.titleMedium),
                                const SizedBox(height: 4),
                                Text(
                                  Strings.instance.createBoardMessage,
                                  style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.outline),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              spacing: 12,
                              children: boardsState.boards
                                  .map(
                                    (board) => BoardCard(
                                      taskCount: board.taskCount ?? 0,
                                      completedTaskCount: board.completedTaskCount ?? 0,
                                      lastUpdated: DateTime.parse(board.updatedAt ?? ''),
                                      boardId: board.id ?? "",
                                      boardName: board.boardName ?? '',
                                      discription: board.description ?? '',
                                      onEdit: () => _editBoard(board: board),
                                      onDelete: () async => await ref.read(boardsProvider.notifier).deleteBoard(board),
                                    ),
                                  )
                                  .toList(),
                            ),
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

  void _editBoard({BoardsModel? board}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Material(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddBoardSheet(board: board),
          ),
        );
      },
    );
  }
}
