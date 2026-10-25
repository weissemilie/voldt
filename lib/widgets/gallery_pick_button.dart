import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voldt/core/theme/app_pallete.dart';

/// Lille kompakt knap som åbner fotobiblioteket.
/// Returnerer den valgte [XFile] via [onPicked].
class GalleryPickButton extends StatefulWidget {
  final ValueChanged<XFile?> onPicked;
  const GalleryPickButton({
    super.key,
    required this.onPicked,
  });

  @override
  State<GalleryPickButton> createState() =>
      _GalleryPickButtonState();
}

class _GalleryPickButtonState
    extends State<GalleryPickButton> {
  final _picker = ImagePicker();
  bool _busy = false;

  Future<void> _pick() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      widget.onPicked(file);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _busy ? null : _pick,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 9,
        ),
        decoration: BoxDecoration(
          color: AppPallete.lightGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 5),
            Text(
              'Vælg fra kamerarulle',
              style: TextStyle(
                fontSize: 11,
                color: const Color.fromARGB(
                  255,
                  130,
                  130,
                  131,
                ),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
