import 'package:bookmyshow/buzzpage/services/storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddBuzzPage extends StatefulWidget {
  final Animation<double>? transitionAnimation;
  const AddBuzzPage({this.transitionAnimation, super.key});

  @override
  State<AddBuzzPage> createState() => _AddBuzzPageState();
}

class _AddBuzzPageState extends State<AddBuzzPage> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return AnimatedBuilder(
      animation: widget.transitionAnimation!,
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                  .animate(
            CurvedAnimation(
                parent: widget.transitionAnimation!, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Buzz Page"),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg', 'jpeg'],
                );
                if (results == null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No file Selected"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                final path = results.files.single.path;
                final fileName = results.files.single.name;
                //  print(path);
                //  print(fileName);
                storage
                    .uploadFiles(path as String, fileName)
                    .then((value) => print("File Upload Done"));
                storage.listFiles();
              },
              child: const Text("Upload File")),
        ),
      ),
    );
  }
}
