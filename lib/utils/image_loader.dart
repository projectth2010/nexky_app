// lib/utils/image_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class ImageLoader {
  static Future<List<String>> loadImagesFromJson() async {
    // Load the JSON file from assets
    final String jsonString = await rootBundle.loadString('assets/images.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    // Extract the URLs from the JSON data
    return jsonData.map((item) => item['url'] as String).toList();
  }

static List<String> loadNetworkImages()  {
    // Return a list of network image URLs
    return [
      'https://scontent.fbkk13-3.fna.fbcdn.net/v/t39.30808-6/466892348_550814307648448_2742082099644673029_n.png?_nc_cat=110&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeH57gn8MK2h1ZXhwmqrAFNp2b0yINElJAzZvTIg0SUkDPZv_QTiuJvBrKZXBfQyF7amplNt5mLh0v_uQNkEHyvF&_nc_ohc=VOkD9I_i5AkQ7kNvgH89yCO&_nc_oc=Adg2cP85zFRwoNJc7Eh_4kV9nHHQugro-r4f2vEgkhayapVJK1PdFgVCXzFfuZI3jdc&_nc_zt=23&_nc_ht=scontent.fbkk13-3.fna&_nc_gid=v6ClB7sppvozx3A_t0-GoQ&oh=00_AYEVx51ATISOmf6Idate6o0kjQAbUSpbWhKezHMC-Xhyrg&oe=67DDE042',
      'https://scontent.fbkk12-1.fna.fbcdn.net/v/t1.6435-9/69519159_2466630410064830_2205024587584897024_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=2285d6&_nc_eui2=AeFZu38BQ0vIbuDw1ROm4eIYgLUfJWg_MXmAtR8laD8xeWhAlPPHn-u_C8eRUzuL2B_HQFeWYrYciX5Eh6ai-LYc&_nc_ohc=9r7JOMFmcqIQ7kNvgHZYrfJ&_nc_oc=Adhy4souoJl9647MPvipcbpnsOHME-pJahAMwHOWAod28T2fpyx-m9wDsO_40gGHipw&_nc_zt=23&_nc_ht=scontent.fbkk12-1.fna&_nc_gid=xVM3lUsj9KLNmkHKGG-Ugw&oh=00_AYHII9Xk2rfzZYSbqWaRqGmuJhWNac_-AQQHtlhOkPdwfw&oe=67FF5FBA',
      'https://scontent.fbkk13-3.fna.fbcdn.net/v/t39.30808-6/466892348_550814307648448_2742082099644673029_n.png?_nc_cat=110&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeH57gn8MK2h1ZXhwmqrAFNp2b0yINElJAzZvTIg0SUkDPZv_QTiuJvBrKZXBfQyF7amplNt5mLh0v_uQNkEHyvF&_nc_ohc=VOkD9I_i5AkQ7kNvgH89yCO&_nc_oc=Adg2cP85zFRwoNJc7Eh_4kV9nHHQugro-r4f2vEgkhayapVJK1PdFgVCXzFfuZI3jdc&_nc_zt=23&_nc_ht=scontent.fbkk13-3.fna&_nc_gid=v6ClB7sppvozx3A_t0-GoQ&oh=00_AYEVx51ATISOmf6Idate6o0kjQAbUSpbWhKezHMC-Xhyrg&oe=67DDE042',
      'https://scontent.fbkk12-1.fna.fbcdn.net/v/t1.6435-9/69519159_2466630410064830_2205024587584897024_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=2285d6&_nc_eui2=AeFZu38BQ0vIbuDw1ROm4eIYgLUfJWg_MXmAtR8laD8xeWhAlPPHn-u_C8eRUzuL2B_HQFeWYrYciX5Eh6ai-LYc&_nc_ohc=9r7JOMFmcqIQ7kNvgHZYrfJ&_nc_oc=Adhy4souoJl9647MPvipcbpnsOHME-pJahAMwHOWAod28T2fpyx-m9wDsO_40gGHipw&_nc_zt=23&_nc_ht=scontent.fbkk12-1.fna&_nc_gid=xVM3lUsj9KLNmkHKGG-Ugw&oh=00_AYHII9Xk2rfzZYSbqWaRqGmuJhWNac_-AQQHtlhOkPdwfw&oe=67FF5FBA',
      'https://scontent.fbkk13-3.fna.fbcdn.net/v/t39.30808-6/466892348_550814307648448_2742082099644673029_n.png?_nc_cat=110&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeH57gn8MK2h1ZXhwmqrAFNp2b0yINElJAzZvTIg0SUkDPZv_QTiuJvBrKZXBfQyF7amplNt5mLh0v_uQNkEHyvF&_nc_ohc=VOkD9I_i5AkQ7kNvgH89yCO&_nc_oc=Adg2cP85zFRwoNJc7Eh_4kV9nHHQugro-r4f2vEgkhayapVJK1PdFgVCXzFfuZI3jdc&_nc_zt=23&_nc_ht=scontent.fbkk13-3.fna&_nc_gid=v6ClB7sppvozx3A_t0-GoQ&oh=00_AYEVx51ATISOmf6Idate6o0kjQAbUSpbWhKezHMC-Xhyrg&oe=67DDE042',
      'https://scontent.fbkk12-1.fna.fbcdn.net/v/t1.6435-9/69519159_2466630410064830_2205024587584897024_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=2285d6&_nc_eui2=AeFZu38BQ0vIbuDw1ROm4eIYgLUfJWg_MXmAtR8laD8xeWhAlPPHn-u_C8eRUzuL2B_HQFeWYrYciX5Eh6ai-LYc&_nc_ohc=9r7JOMFmcqIQ7kNvgHZYrfJ&_nc_oc=Adhy4souoJl9647MPvipcbpnsOHME-pJahAMwHOWAod28T2fpyx-m9wDsO_40gGHipw&_nc_zt=23&_nc_ht=scontent.fbkk12-1.fna&_nc_gid=xVM3lUsj9KLNmkHKGG-Ugw&oh=00_AYHII9Xk2rfzZYSbqWaRqGmuJhWNac_-AQQHtlhOkPdwfw&oe=67FF5FBA',
      
    ];
  }

  static List<String> loadCloudLevelLocalImages() {
    // Return a list of local asset paths
    return [
      'assets/ic_cloud_0.png',
      'assets/ic_cloud_1.png',
      'assets/ic_cloud_2.png',
      'assets/ic_cloud_3.png',
      'assets/ic_cloud_4.png',
      'assets/ic_cloud_5.png',
    ];
  }
}