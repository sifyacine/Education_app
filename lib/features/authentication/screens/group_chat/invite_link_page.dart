import 'package:flutter/material.dart';

class InviteLinkPage extends StatelessWidget {
  const InviteLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Link'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            OptionRow(
              icon: Icons.copy,
              name: 'Copy',
              onTap: () {
                // Implement the logic to copy the invite link
              },
            ),
            const SizedBox(height: 16.0),
            OptionRow(
              icon: Icons.qr_code,
              name: 'QR Code',
              onTap: () {
                // Implement the logic to show the QR code
              },
            ),
            const SizedBox(height: 16.0),
            OptionRow(
              icon: Icons.share,
              name: 'Share',
              onTap: () {
                // Implement the logic to share the invite link
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionRow extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onTap;

  const OptionRow({
    Key? key,
    required this.icon,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8.0),
          Text(name),
        ],
      ),
    );
  }
}