import 'dart:async';

import 'package:flutter/material.dart';

class SearchableDropdown<T> extends StatefulWidget {
  const SearchableDropdown({
    required this.fetchItems,
    required this.itemLabel,
    required this.onSelected,
    this.selectedItem,
    this.label,
    this.hint,
    this.leadingIconBuilder,
    super.key,
  });

  final Future<List<T>> Function(int page, int pageSize, String? query) fetchItems;
  final String Function(T item) itemLabel;
  final Widget Function(T item)? leadingIconBuilder;
  final ValueChanged<T?> onSelected;
  final T? selectedItem;
  final String? label;
  final String? hint;

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  static const _pageSize = 20;
  static const _scrollThreshold = 80.0;

  final _layerLink = LayerLink();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();

  late final TextEditingController _textController;

  Timer? _debounce;
  OverlayEntry? _overlayEntry;

  List<T> _items = [];
  int _page = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _query;
  bool _isOpen = false;
  double _fieldWidth = 200;

  @override
  void initState() {
    super.initState();
    final selected = widget.selectedItem;
    _textController = TextEditingController(
      text: selected != null ? widget.itemLabel(selected) : '',
    );
    _textController.addListener(_onTextChanged);
    _scrollController.addListener(_onScroll);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(SearchableDropdown<T> old) {
    super.didUpdateWidget(old);
    if (old.selectedItem != widget.selectedItem && !_isOpen) {
      final selected = widget.selectedItem;
      _textController.text = selected != null ? widget.itemLabel(selected) : '';
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _textController.removeListener(_onTextChanged);
    _scrollController.removeListener(_onScroll);
    _focusNode.removeListener(_onFocusChanged);
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus && _isOpen) {
      // Defer by one frame so item taps can fire before we close.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_focusNode.hasFocus && _isOpen) {
          _close(restoreText: true);
        }
      });
    }
  }

  void _onTextChanged() {
    if (!_isOpen) return;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      final query = _textController.text.trim().isEmpty ? null : _textController.text.trim();
      if (query == _query) return;
      _query = query;
      _items = [];
      _page = 0;
      _hasMore = true;
      _fetchPage(0);
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _isLoading || !_hasMore) return;
    final position = _scrollController.position;
    if (position.maxScrollExtent - position.pixels <= _scrollThreshold) {
      _fetchPage(_page + 1);
    }
  }

  Future<void> _fetchPage(int page) async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    _overlayEntry?.markNeedsBuild();
    try {
      final results = await widget.fetchItems(page, _pageSize, _query);
      if (!mounted) return;
      setState(() {
        _items = page == 0 ? results : [..._items, ...results];
        _page = page;
        _hasMore = results.length == _pageSize;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
    _overlayEntry?.markNeedsBuild();
  }

  void _open() {
    if (_isOpen) return;
    final renderBox = context.findRenderObject() as RenderBox?;
    _fieldWidth = renderBox?.size.width ?? 200;
    _isOpen = true;
    _query = null;
    _items = [];
    _page = 0;
    _hasMore = true;
    _overlayEntry = OverlayEntry(builder: _buildOverlay);
    Overlay.of(context).insert(_overlayEntry!);
    _fetchPage(0);
  }

  void _close({bool restoreText = false}) {
    if (!_isOpen) return;
    _isOpen = false;
    _debounce?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (restoreText) {
      final selected = widget.selectedItem;
      _textController.text = selected != null ? widget.itemLabel(selected) : '';
    }
  }

  void _select(T item) {
    widget.onSelected(item);
    _textController.text = widget.itemLabel(item);
    _close();
    _focusNode.unfocus();
  }

  Widget _buildOverlay(BuildContext overlayContext) {
    return CompositedTransformFollower(
      link: _layerLink,
      showWhenUnlinked: false,
      targetAnchor: Alignment.bottomLeft,
      followerAnchor: Alignment.topLeft,
      offset: const Offset(0, 4),
      child: Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: _fieldWidth,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: _buildList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    if (_items.isEmpty && !_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('No results found.', textAlign: TextAlign.center),
      );
    }
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 4),
      itemCount: _items.length + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _items.length) {
          return const Padding(
            padding: EdgeInsets.all(12),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }
        final item = _items[index];
        return ListTile(
          dense: true,
          leading: widget.leadingIconBuilder?.call(item),
          title: Text(widget.itemLabel(item)),
          onTap: () => _select(item),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: _textController,
        focusNode: _focusNode,
        onTap: _open,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
