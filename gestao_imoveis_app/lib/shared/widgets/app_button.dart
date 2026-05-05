import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary, outline, danger, ghost }

enum AppButtonSize { normal, small }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.normal,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final vertical = size == AppButtonSize.small ? 10.0 : 14.0;
    final fontSize = size == AppButtonSize.small ? 13.0 : 15.0;

    Widget child = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: _loaderColor(colorScheme),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: 8),
              ],
              Text(label, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600)),
            ],
          );

    if (isFullWidth) {
      child = Center(child: child);
    }

    final style = _buildStyle(context, colorScheme, vertical);
    final btn = switch (variant) {
      AppButtonVariant.outline => OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: style,
          child: child,
        ),
      AppButtonVariant.ghost => TextButton(
          onPressed: isLoading ? null : onPressed,
          style: style,
          child: child,
        ),
      _ => ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: style,
          child: child,
        ),
    };

    return isFullWidth ? SizedBox(width: double.infinity, child: btn) : btn;
  }

  Color _loaderColor(ColorScheme cs) => switch (variant) {
        AppButtonVariant.primary || AppButtonVariant.danger => Colors.white,
        _ => cs.primary,
      };

  ButtonStyle _buildStyle(BuildContext context, ColorScheme cs, double vertical) {
    final padding = EdgeInsets.symmetric(horizontal: 24, vertical: vertical);
    const shape = StadiumBorder();

    return switch (variant) {
      AppButtonVariant.primary => ElevatedButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          padding: padding,
          shape: shape,
          elevation: 0,
        ),
      AppButtonVariant.secondary => ElevatedButton.styleFrom(
          backgroundColor: cs.secondaryContainer,
          foregroundColor: cs.onSecondaryContainer,
          padding: padding,
          shape: shape,
          elevation: 0,
        ),
      AppButtonVariant.outline => OutlinedButton.styleFrom(
          foregroundColor: cs.primary,
          side: BorderSide(color: cs.primary),
          padding: padding,
          shape: shape,
        ),
      AppButtonVariant.danger => ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE74C3C),
          foregroundColor: Colors.white,
          padding: padding,
          shape: shape,
          elevation: 0,
        ),
      AppButtonVariant.ghost => TextButton.styleFrom(
          foregroundColor: cs.primary,
          padding: padding,
          shape: shape,
        ),
    };
  }
}
