import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  OrderProvider() {
    _loadOrders(); // Load orders from SharedPreferences when the provider is created
  }

  // Add an order and save to SharedPreferences
  void addOrder(OrderModel order) {
    _orders.add(order);
    _saveOrders(); // Save the updated order list
    notifyListeners();
  }

  // Remove an order and update SharedPreferences
  void removeOrder(OrderModel order) {
    _orders.remove(order);
    _saveOrders(); // Save the updated order list
    notifyListeners();
  }

  // Save orders to SharedPreferences
  void _saveOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> ordersJson =
        _orders.map((order) => json.encode(order.toJson())).toList();
    await prefs.setStringList('orders', ordersJson);
  }

  // Load orders from SharedPreferences
  void _loadOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? ordersJson = prefs.getStringList('orders');

    if (ordersJson != null) {
      _orders = ordersJson
          .map((order) => OrderModel.fromJson(json.decode(order)))
          .toList();
      notifyListeners();
    }
  }
}
