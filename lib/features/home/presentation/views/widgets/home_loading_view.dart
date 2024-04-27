import 'package:flutter/material.dart';
import 'package:jobizz/core/common_widgets/skelton.dart';
import 'package:jobizz/features/home/presentation/views/widgets/skelton_header.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Skelton(width: 30, height: 3, opacity: 0.3),
                        const SizedBox(
                          height: 5,
                        ),
                        Skelton(width: 20, height: 3, opacity: 0.3),
                        const SizedBox(
                          height: 5,
                        ),
                        Skelton(width: 30, height: 3, opacity: 0.3),
                      ],
                    ),
                    Skelton(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: 10,
                      opacity: 0.3,
                    ),
                    Skelton(
                        width: 50, height: 50, opacity: 0.3, borderRaduis: 50),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Skelton(
                  width: MediaQuery.sizeOf(context).width - 40,
                  height: 40,
                  opacity: 0.3,
                  borderRaduis: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skelton(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 130,
                      opacity: 0.3,
                      borderRaduis: 10,
                    ),
                    Skelton(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: 130,
                      opacity: 0.3,
                      borderRaduis: 10,
                    ),
                    Skelton(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 130,
                      opacity: 0.3,
                      borderRaduis: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const SkeltonHeader(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Skelton(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: 160,
                      opacity: 0.3,
                      borderRaduis: 10,
                    ),
                    Skelton(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: 160,
                      opacity: 0.3,
                      borderRaduis: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SkeltonHeader(),
              ],
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Skelton(
              width: MediaQuery.sizeOf(context).width,
              height: 110,
              opacity: 0.3,
            ),
          ),
        ),
      ],
    );
  }
}
