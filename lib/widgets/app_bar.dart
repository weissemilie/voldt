import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voldt/core/theme/app_pallete.dart';
import 'package:voldt/init_dependencies.dart';
import 'package:voldt/pages/faq_page.dart';

class VoldtAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showBack;
  final VoidCallback? onLogout;
  final bool showFaqButton;

  const VoldtAppBar({
    super.key,
    this.showBack = true,
    this.onLogout,
    this.showFaqButton = true,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBack,
      centerTitle: true,
      title: const Text(
        'voldt',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppPallete.white,
        ),
      ),
      backgroundColor: AppPallete.woltBlue,
      actions: [
        if (showFaqButton)
          IconButton(
            tooltip: 'FAQ',
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
            onPressed: () => context.push('/faq'),
          ),
        IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () async {
            await serviceLocator<SupabaseClient>().auth
                .signOut();

            onLogout?.call();

            if (context.mounted) context.go('/');
          },
        ),
      ],
    );
  }
}
