import 'package:news_bytes/src/view.dart';
import 'package:news_bytes/src/view/tabs/home_tab.dart';
import 'package:news_bytes/src/view/tabs/profile_tab.dart';
import 'package:news_bytes/src/view/tabs/settings_tab.dart';

/// Standard Counter Screen
///
class BuildPage extends StatelessWidget {
  const BuildPage({
    Key? key,
    required this.label,
    required this.count,
    required this.counter,
    this.column,
    required this.row,
    this.persistentFooterButtons,
  }) : super(key: key);

  final String label;
  final int count;
  final void Function() counter;
  final List<Widget> Function(BuildContext context)? column;
  final List<Widget> Function(BuildContext context) row;
  final List<Widget>? persistentFooterButtons;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: const Text('NewsBytes'),
        ),
        drawer: Drawer(
          child: Container(
              color: Colors.blue[100],
              child: ListView(
                children: [
                  const DrawerHeader(
                      child: Center(
                          child: Text(
                    'NewsBytes',
                    style: TextStyle(fontSize: 35),
                  ))),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Page 1', style: TextStyle(fontSize: 20)),
                    onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Page1()))
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Page 2', style: TextStyle(fontSize: 20)),
                    onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Page2()))
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Page 3', style: TextStyle(fontSize: 20)),
                    onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Page3()))
                    },
                  )
                ],
              )),
        ),
        persistentFooterButtons: persistentFooterButtons,
        floatingActionButton: FloatingActionButton(
          key: const Key('+'),
          onPressed: counter,
          child: const Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                )),
                Tab(
                    icon: Icon(
                  Icons.settings,
                  color: Colors.blue,
                )),
                Tab(
                    icon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ))
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HomeTab(),
                  SettingsTab(),
                  ProfileTab(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("You're on page:"),
            ),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(fontSize: 48),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            Flexible(
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: row(context),
              ),
            ),
            if (column == null)
              const Flexible(child: SizedBox())
            else
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: column!(context),
              ),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
