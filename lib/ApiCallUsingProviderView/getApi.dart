import 'package:flutter/material.dart';
import 'package:project/provider/AuthProvider.dart';
import 'package:provider/provider.dart';

class Getapi extends StatefulWidget {
  const Getapi({super.key});

  @override
  State<Getapi> createState() => _GetapiState();
}

class _GetapiState extends State<Getapi> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Authprovider>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text("Get Api"),
      ),
      body: Provider.of<Authprovider>(context).isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : ListView.builder(
            itemCount: Provider.of<Authprovider>(context).apiResponse['data'].length,
              itemBuilder: (icontext, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(Provider.of<Authprovider>(context).apiResponse['data'][index]['avatar']),
                  ),
                  title: Text(Provider.of<Authprovider>(context).apiResponse['data'][index]['first_name'].toString()) ,
                  subtitle: Text(Provider.of<Authprovider>(context).apiResponse['data'][index]['email'].toString()),
                );
              },
            ),
    );
  }
}
