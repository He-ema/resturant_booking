import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/common_widgets/custom_button.dart';
import 'package:jobizz/core/utils/app_router.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/profile/presentation/views/widgets/profile_list_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    tileColor: Colors.white,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const SpinKitSpinningLines(color: kPrimaryColor),
                        imageUrl: FirebaseAuth.instance.currentUser!.photoURL!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title:
                        Text(FirebaseAuth.instance.currentUser!.displayName!),
                    subtitle: Text(FirebaseAuth.instance.currentUser!.email!),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          size: 30,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    tileColor: Colors.white,
                    leading: const Icon(
                      Icons.person_pin,
                      color: Colors.black,
                      size: 40,
                    ),
                    title: const Text(
                      'Account Settings',
                      style: AppStyles.styleRegular18,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.penToSquare)),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    child: const Column(
                      children: [
                        ProfileListTile(
                          icon: Icons.translate,
                          title: 'Language',
                        ),
                        ProfileListTile(
                          icon: Icons.message_outlined,
                          title: 'Feedback',
                        ),
                        ProfileListTile(
                          icon: Icons.star_border_purple500_rounded,
                          title: 'Rate us',
                        ),
                        ProfileListTile(
                          icon: Icons.arrow_circle_up,
                          title: 'New version',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: CustomButton(
                    text: 'Logout',
                    color: Colors.red,
                    onPressed: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.welcomeRoute);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
