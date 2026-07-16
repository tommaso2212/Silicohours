import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

LayerLink useLayerLink() => use(_LayerLinkHook());

class _LayerLinkHook extends Hook<LayerLink> {
  @override
  HookState<LayerLink, Hook<LayerLink>> createState() => _LayerLinkHookState();
}

class _LayerLinkHookState extends HookState<LayerLink, _LayerLinkHook> {
  final layerLink = LayerLink();

  @override
  LayerLink build(BuildContext context) => layerLink;

  @override
  String get debugLabel => 'useLayerLink';
}
