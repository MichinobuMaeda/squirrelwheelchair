import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../env.dart';
import '../../models/app_state.dart';
import '../../view_models/app_state_provider.dart';
import '../../view_models/ui_version_provider.dart';
import '../widgets/sliver_loading_message.dart';
import '../widgets/sliver_error_message.dart';
import 'sliver_header.dart';
import 'sliver_update_app.dart';
import 'sliver_footer.dart';

const guardNone = [
  AppState.loading,
  AppState.loaded,
  AppState.user,
  AppState.admin,
];

const guardLoaded = [
  AppState.loaded,
  AppState.user,
  AppState.admin,
];

const guardUser = [
  AppState.user,
  AppState.admin,
];

const guardAdmin = [
  AppState.admin,
];

class ScreenBase extends HookConsumerWidget {
  final List<AppState> guard;
  final List<Widget> slivers;

  const ScreenBase(this.guard, this.slivers, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = AppLocalizations.of(context);
    final appState = ref.watch(appStateProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverHeader(intl.appName),
          ...ref.watch(uiVersionProvider).when(
                data: (newVersion) =>
                    newVersion != version ? [const SliverUpdateApp()] : [],
                error: (error, stackTrace) =>
                    [SliverErrorMessage(error, stackTrace)],
                loading: () => [const SliverLoadingMessage()],
              ),
          ...appState.when(
            data: (appState) => slivers,
            error: (error, stackTrace) =>
                [SliverErrorMessage(error, stackTrace)],
            loading: () => guard.contains(AppState.loading)
                ? slivers
                : [const SliverLoadingMessage()],
          ),
          SliverFooter(intl.copyright),
        ],
      ),
    );
  }
}
