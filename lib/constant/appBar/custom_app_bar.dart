import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.leading,
      this.automaticallyImplyLeading = true,
      this.title,
      this.toolbarHeight,
      this.bottom,
      this.actions,
      this.backButtonColor,
      this.backGroundColor})
      : super(key: key);

  final Widget? leading;
  final Widget? title;
  final bool automaticallyImplyLeading;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Color? backButtonColor;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? leadingWidget = leading;

    if (leadingWidget == null && (automaticallyImplyLeading)) {
      if (canPop) {
        leadingWidget = CustomBackButton(
          close: useCloseButton,
          color: backButtonColor,
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        backgroundColor: backGroundColor ?? Colors.transparent,
        title: title ?? const Text(''),
        leading: leadingWidget,
        automaticallyImplyLeading: automaticallyImplyLeading,
        toolbarHeight: 50,
        leadingWidth: 50,
        bottom: bottom,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize =>
      _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class CustomBackButton extends StatelessWidget {
  /// Creates an [IconButton] with the appropriate "back" icon for the current
  /// target platform.
  const CustomBackButton(
      {Key? key, this.color = Colors.black, this.onPressed, this.close = false})
      : super(key: key);

  /// The color to use for the icon.
  ///
  /// Defaults to the [IconThemeData.color] specified in the ambient [IconTheme],
  /// which usually matches the ambient [Theme]'s [ThemeData.iconTheme].
  final Color? color;

  /// An override callback to perform instead of the default behavior which is
  /// to pop the [Navigator].
  ///
  /// It can, for instance, be used to pop the platform's navigation stack
  /// via [SystemNavigator] instead of Flutter's [Navigator] in add-to-app
  /// situations.
  ///
  /// Defaults to null.
  final VoidCallback? onPressed;

  /// If true show s close button instead of back
  final bool close;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: close
            ? Icon(
                Icons.close,
                color: color,
              )
            : Icon(
                Icons.arrow_back,
                color: color,
              ),
      ),
    );
  }
}

// tooltip: MaterialLocalizations.of(context).backButtonTooltip,
