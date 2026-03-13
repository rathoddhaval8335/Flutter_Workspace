import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_might/tranction_model.dart';
import 'package:meet_might/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_tranction_details.dart';
import 'api_service/api_servuce.dart';
import 'login_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ApiService _apiService = ApiService();
  User? _user;
  List<Transaction> _transactions = [];
  TransactionSummary? _summary;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id');

    if (userId != null) {
      // Load user details
      final userResult = await _apiService.getUserById(userId);

      if (userResult['status'] == 'success' && mounted) {
        setState(() {
          _user = User.fromJson(userResult['user']);
        });
      }

      // Load transactions
      await _loadTransactions();
    } else {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  Future<void> _loadTransactions() async {
    if (_user == null) return;

    final result = await _apiService.getTransactions(_user!.id);

    if (result['status'] == 'success' && mounted) {
      setState(() {
        _transactions = (result['transactions'] as List)
            .map((json) => Transaction.fromJson(json))
            .toList();
        _summary = TransactionSummary.fromJson(result['totals']);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  Future<void> _deleteTransaction(int transactionId) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text('Are you sure you want to delete this transaction?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              setState(() {
                _isLoading = true;
              });

              final result = await _apiService.deleteTransaction(transactionId, _user!.id);

              if (result['status'] == 'success') {
                await _loadTransactions();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Transaction deleted'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                setState(() {
                  _isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result['message']),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _user == null
          ? const Center(child: Text('No user data found'))
          : RefreshIndicator(
        onRefresh: _loadTransactions,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // User Info Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.blue, size: 30),
                      title: const Text('Name', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      subtitle: Text(_user!.name, style: const TextStyle(fontSize: 18)),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.blue, size: 30),
                      title: const Text('Email', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      subtitle: Text(_user!.email, style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Summary Cards
            if (_summary != null)
              Row(
                children: [
                  Expanded(
                    child: _buildSummaryCard(
                      'Income',
                      '₹${_summary!.totalIncome.toStringAsFixed(2)}',
                      Colors.green,
                      Icons.trending_up,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSummaryCard(
                      'Expense',
                      '₹${_summary!.totalExpense.toStringAsFixed(2)}',
                      Colors.red,
                      Icons.trending_down,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 12),

            // Balance Card
            if (_summary != null)
              Card(
                color: _summary!.balance >= 0 ? Colors.green.shade50 : Colors.red.shade50,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Balance',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹${_summary!.balance.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _summary!.balance >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Transactions Header
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Transactions List
            _transactions.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'No transactions yet.\nTap + button to add your first transaction',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                return Dismissible(
                  key: Key(transaction.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    _deleteTransaction(transaction.id);
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: transaction.type == 'income'
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                        child: Icon(
                          transaction.type == 'income'
                              ? Icons.arrow_downward
                              : Icons.arrow_upward,
                          color: transaction.type == 'income'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      title: Text(
                        transaction.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_formatDate(transaction.date)),
                      trailing: Text(
                        '₹${transaction.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: transaction.type == 'income'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTransactionScreen(
                userId: _user!.id,
                onTransactionAdded: _loadTransactions,
              ),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildSummaryCard(String label, String amount, Color color, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}