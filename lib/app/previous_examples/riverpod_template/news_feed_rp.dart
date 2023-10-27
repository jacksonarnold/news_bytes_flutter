import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_bytes/app/newsfeed/newsfeed_model.dart';
import '../../newsfeed/newsfeed_provider.dart';

class NewsFeedRp extends ConsumerStatefulWidget {
  const NewsFeedRp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsFeedRpState();
}

// Notice how instead of "State", we are extending "ConsumerState".
// This uses the same principle as "ConsumerWidget" vs "StatelessWidget".
class _NewsFeedRpState extends ConsumerState<NewsFeedRp> {
  @override
  void initState() {
    super.initState();

    // State life-cycles have access to "ref" too.
    // This enables things such as adding a listener on a specific provider
    // to show dialogs/snackbars.
    ref.listenManual(newsFeedProvider, (previous, next) {});
  }

  @override
  Widget build(BuildContext context) {
    // "ref" is not passed as parameter anymore, but is instead a property of "ConsumerState".
    // We can therefore keep using "ref.watch" inside "build".
    final AsyncValue<NewsFeedModel> activity = ref.watch(newsFeedProvider);

    return const Center(child: Text("Hello world"));
  }
}
