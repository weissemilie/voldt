import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voldt/init_dependencies.dart';

class JobHeaderImage extends StatelessWidget {
  final Map<String, dynamic> job;
  final String bucket;
  const JobHeaderImage({
    super.key,
    required this.job,
    this.bucket = 'job-images',
  });

  @override
  Widget build(BuildContext context) {
    final raw =
        (job['image_url'] ?? job['job_image_url'])
            ?.toString();

    // Lav evt. public URL hvis det er en storage-sti
    final url =
        (raw != null && raw.isNotEmpty)
            ? (raw.startsWith('http')
                ? raw
                : serviceLocator<SupabaseClient>().storage
                    .from(bucket)
                    .getPublicUrl(raw))
            : null;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child:
            (url == null || url.isEmpty)
                ? const _HeaderPlaceholder()
                : Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) =>
                          const _HeaderPlaceholder(),
                ),
      ),
    );
  }
}

class _HeaderPlaceholder extends StatelessWidget {
  const _HeaderPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.image,
            size: 40,
            color: Colors.black38,
          ),
          const SizedBox(height: 8),
          Text(
            'Billede kommer snart',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
