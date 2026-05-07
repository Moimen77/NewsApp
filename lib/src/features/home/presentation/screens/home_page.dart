import 'package:newsapp/src/imports/core_imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppTopBar(
        title: 'home.home_title'.tr(),
        actions: [
          IconButton(
            onPressed: () {
              // For template purpose:
            },
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: false,
      ),
      body: SafeArea(
          child: Text(
        'home',
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ).center),
    );
  }
}
