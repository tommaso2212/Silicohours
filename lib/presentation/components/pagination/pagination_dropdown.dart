import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/presentation/components/pagination/pagination_list.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/theme/app_theme.dart';
import 'package:silicohours/presentation/utils/hooks/layer_link_hook.dart';

class PaginationDropdown<T> extends HookWidget {
  const PaginationDropdown({
    required this.label,
    required this.controller,
    required this.fetchItems,
    required this.itemBuilder,
    this.enabled = true,
    super.key,
  });

  final String label;
  final DropdownController<T> controller;
  final Future<List<T>> Function(int page, int limit, String? query) fetchItems;
  final Widget Function(T item) itemBuilder;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final overlayController = useOverlayPortalController();
    final layerLink = useLayerLink();

    controller._itemBuilder = itemBuilder;

    return OverlayPortal(
      controller: overlayController,
      overlayChildBuilder: (_) {
        final renderBox = context.findRenderObject() as RenderBox?;
        final size = renderBox?.size;
        final targetBottom = renderBox == null ? 0.0 : renderBox.localToGlobal(Offset(0, size!.height)).dy;
        final screenHeight = MediaQuery.sizeOf(context).height;
        final availableHeight = screenHeight - targetBottom - AppSpacing.xs - AppSpacing.lg;

        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(behavior: HitTestBehavior.translucent, onTap: overlayController.hide),
            ),
            CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              targetAnchor: Alignment.bottomLeft,
              offset: const Offset(0, AppSpacing.xs),
              child: Align(
                alignment: Alignment.topLeft,
                child: _PaginationDropdownMenu(
                  fetchItems: fetchItems,
                  itemBuilder: itemBuilder,
                  onSelected: (value) {
                    overlayController.hide();
                    controller.item = value;
                  },
                  width: size?.width ?? 0,
                  maxMenuHeight: availableHeight.clamp(0.0, 280.0),
                ),
              ),
            ),
          ],
        );
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: TextField(
          readOnly: true,
          enabled: enabled,
          controller: controller,
          onTap: () => overlayController.isShowing ? overlayController.hide() : overlayController.show(),
          decoration: InputDecoration(labelText: label, suffixIcon: const Icon(Icons.arrow_drop_down)),
        ),
      ),
    );
  }
}

class _PaginationDropdownMenu<T> extends StatefulWidget {
  const _PaginationDropdownMenu({
    required this.fetchItems,
    required this.itemBuilder,
    required this.onSelected,
    required this.width,
    this.maxMenuHeight = 280,
  });

  final Future<List<T>> Function(int page, int limit, String? query) fetchItems;
  final Widget Function(T item) itemBuilder;
  final ValueChanged<T> onSelected;

  final double width;

  final double maxMenuHeight;

  @override
  State<_PaginationDropdownMenu<T>> createState() => _PaginationDropdownMenuState<T>();
}

class _PaginationDropdownMenuState<T> extends State<_PaginationDropdownMenu<T>> with DebounceMixin {
  final _scrollController = ScrollController();
  final _filterController = TextEditingController();
  String? _query;

  @override
  void initState() {
    super.initState();
    _filterController.addListener(() {
      debounce(
        () => setState(() => _query = _filterController.text.isEmpty ? null : _filterController.text),
        delay: Duration(milliseconds: 500),
      );
    });
  }

  @override
  void dispose() {
    cancelDebounce();
    _scrollController.dispose();
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      color: AppColors.background,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        width: widget.width,
        constraints: BoxConstraints(maxHeight: widget.maxMenuHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpacing.md,
          children: [
            TextField(
              controller: _filterController,
              autofocus: true,
              decoration: InputDecoration(isDense: true, hintText: 'Search', prefixIcon: const Icon(Icons.search)),
            ),
            Flexible(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: PaginationList<T>(
                  fetchItems: (page, limit) => widget.fetchItems(page, limit, _query),
                  scrollController: _scrollController,
                  itemBuilder: (item) => InkWell(
                    borderRadius: AppTheme.borderRadius,
                    onTap: () {
                      widget.onSelected(item);
                    },
                    child: Padding(padding: EdgeInsetsGeometry.all(AppSpacing.xs), child: widget.itemBuilder(item)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownController<T> extends TextEditingController {
  T? _item;

  set item(T? item) {
    _item = item;
    text = item == null ? '' : ' ';
  }

  T? get item => _item;

  Widget Function(T item)? _itemBuilder;

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    if (_item == null) return TextSpan(style: style);

    return TextSpan(
      style: style,
      children: [
        if (_itemBuilder != null) WidgetSpan(alignment: PlaceholderAlignment.middle, child: _itemBuilder!(item as T)),
      ],
    );
  }
}
