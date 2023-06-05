import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class NewsSkeleton extends StatelessWidget {
  const NewsSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SkeletonItem(
            child: Column(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  width: double.infinity,
                  height: 200,
                  borderRadius: BorderRadius.circular(16.0)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 4.0,
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                  height: 10,
                  width: MediaQuery.of(context).size.width / 2,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 6,
                      width: 64,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 20,
                      width: 64,
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
          ],
        )));
  }
}
