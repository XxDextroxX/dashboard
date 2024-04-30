import 'package:dashboard_app/config/config.dart';
import 'package:dashboard_app/domain/domain.dart';
import 'package:dashboard_app/infrastructure/infrastructure.dart';
import 'package:dashboard_app/shared/services/key_values_impl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GeneralUtils {
  static Future<String> checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionPhone = packageInfo.version;
    return versionPhone;
  }

  static Future<bool> validateResponse(
      Map<String, dynamic> response, BuildContext context) async {
    if (!response['status'] && response['code'] == 401) {
      GeneralUtils.logout(context);
      return false;
    } else if (!response['status'] && response['code'] != 401) {
      if (response['accessToken'] != null) {
        await GeneralUtils.updateToken(response['accessToken']);
      }
      return false;
    } else if (response['status']) {
      if (response['accessToken'] != null) {
        await GeneralUtils.updateToken(response['accessToken']);
      }
      return true;
    } else {
      return false;
    }
  }

  static Future<void> updateToken(String token) async {
    final keyValueStorage = KeyValuesImplementation();
    final currentToken = await keyValueStorage.getValue<String>('accessToken');
    if (currentToken != token) {
      await keyValueStorage.removeKey('accessToken');
      await keyValueStorage.setKeyValue('accessToken', token);
    }
  }

  static Future<void> logout(BuildContext context) async {
    final RepositoryAuth respository =
        RepositoryAuthI(datasource: DatasourceAuthI());
    final useCaseAuth = UseCaseAuth(repository: respository);
    final keyValueStorage = KeyValuesImplementation();
    final accessToken = await GeneralUtils.getToken();
    await useCaseAuth.callLogout(accessToken ?? '');
    await keyValueStorage.removeKey('accessToken');
  }

  static Future<void> setToken(String token) async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.setKeyValue('accessToken', token);
  }

  static Future<String?> getToken() async {
    final keyValueStorage = KeyValuesImplementation();
    return await keyValueStorage.getValue<String>('accessToken');
  }

  static Future<void> removeToken() async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.removeKey('accessToken');
  }

  static String getImage(String path) {
    final apiUrl = Environment.apiUrl;
    final url = '$apiUrl/assets/$path';
    return url;
  }

  static String limitText({required int limit, required String text}) {
    if (text.length <= limit) {
      return text;
    } else {
      return '${text.substring(0, limit)}...';
    }
  }

  static getAmoutFormat(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatearComoDinero(double numero) {
    final formatoMoneda = NumberFormat("#,##0.00", "es_ES");
    return formatoMoneda.format(numero);
  }

  static String getDateFormat(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static customButton(Color color, Color colorBorder, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: colorBorder),
          borderRadius: const BorderRadius.all(Radius.circular(35.0)),
        ),
        child: Center(
          child: Text(text,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }

  static Future<void> setColorTheme(int value) async {
    final keyValueStorage = KeyValuesImplementation();
    await keyValueStorage.setKeyValue('themeColor', value);
  }

  static Future<Color> getColorTheme() async {
    final keyValueStorage = KeyValuesImplementation();
    final value = await keyValueStorage.getValue<int>('themeColor');
    Color color = const Color(0xFF01579B);
    if (value != null) {
      color = Color(value);
    }
    return color;
  }
}
