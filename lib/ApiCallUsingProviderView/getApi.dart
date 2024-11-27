import 'package:flutter/material.dart';
import 'package:project/provider/AuthProvider.dart';
import 'package:provider/provider.dart';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Authprovider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Authprovider>(context);
    final apiResponse = authProvider.apiResponse;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text("Get API"),
      ),
      body: authProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : apiResponse == null || apiResponse.data == null
              ? const Center(
                  child: Text('Failed to load data.'),
                )
              : ListView.builder(
                  itemCount: apiResponse.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final user = apiResponse.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar ?? ''),
                      ),
                      title: Text(user.firstName ?? 'No Name'),
                      subtitle: Text(user.email ?? 'No Email'),
                    );
                  },
                ),
    );
  }
}
