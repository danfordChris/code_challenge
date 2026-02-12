import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/core/theme/custom_colors.dart';
import 'package:code_challenge/features/board_view/screens/task_board_screen.dart';
import 'package:code_challenge/features/dashboard/controller/boards_controller.dart';
import 'package:code_challenge/features/dashboard/widgets/add_board_sheet.dart';
import 'package:code_challenge/features/dashboard/widgets/board_card.dart';
import 'package:code_challenge/features/dashboard/widgets/stats_card.dart';
import 'package:code_challenge/features/user_profile/screen/user_profile.dart';
import 'package:code_challenge/models/boards_model.dart';
import 'package:code_challenge/models/task_model.dart';
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
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(boardsProvider.notifier).loadBoards();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boardsState = ref.watch(boardsProvider);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.colorScheme.surface,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: Strings.instance.searchHint,
                  border: InputBorder.none,
                  hintStyle: context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.outline),
                ),
                style: context.textTheme.bodyLarge,
                onChanged: (value) {
                  ref.read(boardsProvider.notifier).updateSearchQuery(value);
                },
              )
            : Text(Strings.instance.taskBoards, style: context.textTheme.headlineSmall),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  ref.read(boardsProvider.notifier).updateSearchQuery('');
                }
              });
            },
            icon: HugeIcon(
              icon: _isSearching ? HugeIcons.strokeRoundedCancel01 : HugeIcons.strokeRoundedSearch01,
              color: context.colorScheme.onSurface,
            ),
          ),
          IconButton(
            onPressed: () => _showFilterSheet(),
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedPreferenceHorizontal,
              color: boardsState.filterStatus != null ? context.colorScheme.primary : context.colorScheme.onSurface,
            ),
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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 24,
              children: [
                if (!_isSearching && boardsState.filterStatus == null)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _isSearching || boardsState.filterStatus != null ? Strings.instance.results : Strings.instance.yourBoards,
                            style: context.textTheme.titleMedium,
                          ),
                          if (boardsState.filterStatus != null)
                            TextButton(
                              onPressed: () => ref.read(boardsProvider.notifier).updateFilterStatus(null),
                              child: Text(Strings.instance.clearFilter),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: boardsState.filteredBoards.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    HugeIcon(icon: HugeIcons.strokeRoundedDashboardSquare02, size: 64, color: context.colorScheme.outline),
                                    const SizedBox(height: 12),
                                    Text(
                                      _isSearching || boardsState.filterStatus != null
                                          ? Strings.instance.noResultsFound
                                          : Strings.instance.noBoardsYet,
                                      style: context.textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 4),
                                    if (!(_isSearching || boardsState.filterStatus != null))
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
                                  children: boardsState.filteredBoards
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
          if (_isSearching && _searchController.text.isNotEmpty)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: context.colorScheme.surface,
                child: ListView.builder(
                  itemCount: boardsState.searchSuggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = boardsState.searchSuggestions[index];
                    return ListTile(
                      leading: Icon(
                        suggestion.type == SuggestionType.board ? Icons.dashboard_outlined : Icons.check_circle_outline,
                        color: context.colorScheme.primary,
                      ),
                      title: Text(suggestion.title),
                      subtitle: suggestion.subtitle != null ? Text(suggestion.subtitle!) : null,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskBoardScreen(
                              boardId: suggestion.boardId,
                              boardName: suggestion.boardName,
                              highlightTaskId: suggestion.type == SuggestionType.task ? suggestion.id : null,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final currentFilter = ref.watch(boardsProvider).filterStatus;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(Strings.instance.filterByStatus, style: context.textTheme.titleLarge),
              ),
              ListTile(
                title: Text(Strings.instance.all),
                trailing: currentFilter == null ? Icon(Icons.check, color: context.colorScheme.primary) : null,
                onTap: () {
                  ref.read(boardsProvider.notifier).updateFilterStatus(null);
                  Navigator.pop(context);
                },
              ),
              ...TaskStatus.values.map((status) {
                return ListTile(
                  title: Text(status.title),
                  trailing: currentFilter == status ? Icon(Icons.check, color: context.colorScheme.primary) : null,
                  onTap: () {
                    ref.read(boardsProvider.notifier).updateFilterStatus(status);
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
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
