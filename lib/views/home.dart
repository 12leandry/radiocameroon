import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AudioPlayer _audioPlayer;
  String _audioUrl = 'URL_DU_FLUX_AUDIO_EN_DIRECT';
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Remove "AudioPlayer" before "_audioPlayer"
    _audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      if (state == AudioPlayerState.PLAYING) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  void _togglePlay() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(_audioUrl);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  // Rest of your code...
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JAMBO TV Radio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Now Playing'),
              leading: Icon(Icons.play_arrow),
              onTap: () {
                // Navigate to Now Playing screen
              },
            ),
            ListTile(
              title: Text('Song History'),
              leading: Icon(Icons.history),
              onTap: () {
                // Navigate to Song History screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications),
              trailing: Switch(
                value: false, // Replace with notification status
                onChanged: (bool value) {
                  // Handle notification toggle
                },
              ),
            ),
            ListTile(
              title: Text('Feedback'),
              leading: Icon(Icons.feedback),
              onTap: () {
                // Navigate to Feedback screen
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              leading: Icon(Icons.privacy_tip),
              onTap: () {
                // Navigate to Privacy Policy screen
              },
            ),
            ListTile(
              title: Text('Rate Us'),
              leading: Icon(Icons.star),
              onTap: () {
                // Navigate to Rate Us screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Website'),
              leading: Icon(Icons.web),
              onTap: () {
                // Open website URL
              },
            ),
            ListTile(
              title: Text('Facebook'),
              leading: Icon(Icons.facebook),
              onTap: () {
                // Open Facebook URL
              },
            ),
            ListTile(
              title: Text('WhatsApp'),
              leading: Icon(Icons.message),
              onTap: () {
                // Open WhatsApp chat
              },
            ),
            ListTile(
              title: Text('Instagram'),
              leading: Icon(Icons.instagram),
              onTap: () {
                // Open Instagram URL
              },
            ),
            ListTile(
              title: Text('Twitter'),
              leading: Icon(Icons.twitter),
              onTap: () {
                // Open Twitter URL
              },
            ),
            Divider(),
            ListTile(
              title: Text('Programs'),
              leading: Icon(Icons.calendar_today),
              onTap: () {
                // Navigate to Programs screen
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info),
              onTap: () {
                // Navigate to About screen
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'URL_DU_LOGO_DE_LA_RADIO',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Nom de la Radio',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(
                _isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                size: 64,
              ),
              onPressed: _togglePlay,
            ),
            SizedBox(height: 20),
            Text(
              'Song History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // TODO: Display song history here
          ],
        ),
      ),
    );
  }
}
