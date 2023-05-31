import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget(
      {Key? key,
      required this.image,
      this.amount,
      required this.discountedAmount,
      required this.title,
      this.margin,
      this.width})
      : super(key: key);

  final String title;
  final String? amount;
  final String discountedAmount;
  final String image;
  final EdgeInsets? margin;
  final double? width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffB59FF2),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              bottom: 14,
              top: 16,
              right: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "$title   ",
                    children: [
                      if (amount != null)
                        TextSpan(
                          text: "\$$amount",
                          style: textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      TextSpan(
                        text: "${amount != null ? "   " : ""}\$9.99",
                        style: textTheme.bodyMedium,
                      ),
                    ],
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  runAlignment: WrapAlignment.end,
                  children: outlines
                      .map((outline) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xffF0EBFF),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  outline.image,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                if (outline.number != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    child: Text(
                                      outline.number!,
                                      style: textTheme.labelSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                Text(
                                  outline.outline,
                                  style: textTheme.labelSmall
                                      ?.copyWith(letterSpacing: 0),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                backgroundColor: const Color(0xff32235A),
                foregroundColor: Colors.white,
              ),
              child: const Icon(
                Icons.play_arrow_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
