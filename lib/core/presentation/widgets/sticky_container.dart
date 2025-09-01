import 'package:flutter/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../const/size.dart';

class StickyContainer extends StatelessWidget {
  final Widget? title;
  final double? titleBottomSpace;
  final bool stickyHeader;
  final double? width;
  final Color? color;
  final List<BoxShadow>? shadow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final bool overlapHeaders;
  final Widget child;
  const StickyContainer({
    super.key,
    this.title,
    this.titleBottomSpace,
    this.stickyHeader = false,
    this.width,
    this.color,
    this.shadow,
    this.padding,
    this.contentPadding,
    this.overlapHeaders = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    const defaultPadding = EdgeInsets.symmetric(
      horizontal: AppSize.indentDense,
      vertical: AppSize.indentLoose,
    );
    const contentDefaultPadding = EdgeInsets.only(
      bottom: AppSize.indentLoose,
      left: AppSize.indentDense,
      right: AppSize.indentDense,
    );

    Widget containerPane({Widget? child}) {
      return Container(
        width: width,
        padding: padding ?? defaultPadding,
        decoration: stickyHeader
            ? BoxDecoration(color: color)
            : BoxDecoration(color: color, boxShadow: shadow),
        child: child,
      );
    }

    return stickyHeader && (title != null)
        ? Container(
            decoration: BoxDecoration(color: color, boxShadow: shadow),
            child: StickyHeader(
              overlapHeaders: overlapHeaders,
              header: containerPane(child: title),
              content: Padding(
                padding: contentPadding ?? contentDefaultPadding,
                child: child,
              ),
            ),
          )
        : containerPane(
            child: title == null
                ? child
                : Column(children: [
                    title!,
                    SizedBox(height: titleBottomSpace ?? AppSize.indentLoose),
                    child,
                  ]),
          );
  }
}
