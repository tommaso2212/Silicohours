import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:silicohours/presentation/components/icons/app_icons.dart';
import 'package:silicohours/presentation/components/page/sidebar.dart';
import 'package:silicohours/presentation/router/app_router/app_router.dart';
import 'package:silicohours/presentation/theme/app_breakpoints.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

final _extendSidebar = StateProvider<bool>((ref) {
  final context = ref.watch(navigatorKeyProvider).currentContext;
  return context?.onLayout(onMobile: () => false, onTablet: () => false, onDesktop: () => true) ?? false;
});

class AppScreen extends ConsumerWidget {
  const AppScreen({this.scrollController, this.actions = const [], this.slivers = const [], super.key});

  final ScrollController? scrollController;
  final List<Widget> actions;
  final List<Widget> slivers;

  void toggleSidebar(WidgetRef ref) {
    final currentValue = ref.read(_extendSidebar);
    ref.read(_extendSidebar.notifier).state = !currentValue;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSidebarExtended = ref.watch(_extendSidebar);
    final hasBack = Navigator.of(context).canPop();
    return Scaffold(
      drawer: context.onMobile(onMobile: () => !hasBack ? Sidebar() : null, orElse: () => null),
      body: Row(
        children: [
          if (!context.isMobile() && !hasBack) _AnimatedSidebar(isVisible: isSidebarExtended),
          Expanded(
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: AppSpacing.sm,
                  ).add(EdgeInsetsGeometry.only(left: AppSpacing.xl - 10, right: AppSpacing.xl)),
                  sliver: SliverToBoxAdapter(
                    child: _Appbar(isBack: hasBack, actions: actions),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(AppSpacing.xl).copyWith(top: 0),
                  sliver: SliverMainAxisGroup(slivers: slivers),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSidebar extends StatefulWidget {
  const _AnimatedSidebar({required this.isVisible});

  final bool isVisible;

  @override
  State<_AnimatedSidebar> createState() => _AnimatedSidebarState();
}

class _AnimatedSidebarState extends State<_AnimatedSidebar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      value: widget.isVisible ? 1.0 : 0.0,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(_AnimatedSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      widget.isVisible ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(_animation),
          child: const Sidebar(),
        ),
      ),
    );
  }
}

class _Appbar extends ConsumerWidget {
  const _Appbar({this.isBack = true, required this.actions});

  final bool isBack;
  final List<Widget> actions;

  void toggleSidebar(WidgetRef ref) {
    final currentValue = ref.read(_extendSidebar);
    ref.read(_extendSidebar.notifier).state = !currentValue;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSidebarExtended = ref.watch(_extendSidebar);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBack
            ? IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back))
            : context.onMobile(
                onMobile: () => IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: Icon(Icons.menu)),
                orElse: () => IconButton(
                  onPressed: () => toggleSidebar(ref),
                  icon: isSidebarExtended ? AppIcons.leftPanelClose : AppIcons.leftPanelOpen,
                ),
              ),
        Row(mainAxisSize: MainAxisSize.min, children: actions),
      ],
    );
  }
}
