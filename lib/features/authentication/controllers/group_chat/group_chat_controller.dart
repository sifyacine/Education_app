import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GroupController extends GetxController {
  var members = <Map<String, dynamic>>[].obs;
  var searchResults = <Map<String, dynamic>>[].obs;
  var allUsers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllUsers();
  }

  void addMember(Map<String, dynamic> member) {
    if (!members.contains(member)) {
      members.add(member);
    }
  }

  void removeMember(Map<String, dynamic> member) {
    members.remove(member);
  }

  Future<void> fetchAllUsers() async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/users/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      allUsers.value = List<Map<String, dynamic>>.from(data);
    } else {
      print('Error fetching users: ${response.body}');
    }
  }

  Future<void> createGroup(String groupName, String imagePath, int userId) async {
    final url = Uri.parse('http://localhost:8000/api/groups/');
    final request = http.MultipartRequest('POST', url);
    request.fields['name'] = groupName;
    request.fields['admin_id'] = userId.toString();
    request.fields['members'] = json.encode(members.map((m) => m['id']).toList());

    if (imagePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    }

    final response = await request.send();

    if (response.statusCode == 201) {
      print('Group created successfully');
    } else {
      print('Error creating group: ${response.statusCode}');
    }
  }
}
