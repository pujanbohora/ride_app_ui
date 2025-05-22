import 'package:flutter/material.dart';

class RideSelectionScreen extends StatefulWidget {
  const RideSelectionScreen({super.key});

  @override
  State<RideSelectionScreen> createState() => _RideSelectionScreenState();
}

class _RideSelectionScreenState extends State<RideSelectionScreen> {
  String _selectedRideType = 'Economy';
  String _selectedCarSize = 'Small';
  String _selectedTime = 'Now';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildMapSection(),
          _buildRideSelectionSection(),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.grey[200],
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Car icon on map
          Center(
            child: Icon(
              Icons.directions_car,
              color: Colors.indigo[900],
              size: 40,
            ),
          ),
          
          // Location pin
          Positioned(
            top: 80,
            left: 80,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber[700],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          
          // Time indicator
          Positioned(
            top: 80,
            left: 120,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '9 mins',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRideSelectionSection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your ride',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildRideTypeSelector(),
            const SizedBox(height: 16),
            _buildCarOptions(),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, -3),
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  _buildPaymentSection(),
                  const SizedBox(height: 16),
                  _buildBookButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRideTypeSelector() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _buildRideTypeOption('Economy', 'Economy'),
          _buildRideTypeOption('Luxury', 'Luxury'),
          _buildRideTypeOption('Taxicab', 'Taxicab'),
        ],
      ),
    );
  }

  Widget _buildRideTypeOption(String title, String value) {
    final isSelected = _selectedRideType == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedRideType = value;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE0F7FA) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarOptions() {
    return Row(
      children: [
        _buildCarOption('Small', '\$35.50', '4 min', true),
        const SizedBox(width: 8),
        _buildCarOption('Medium', '\$50.00', '3 min', false),
        const SizedBox(width: 8),
        _buildCarOption('Large', '\$150.43', '5 min', false),
      ],
    );
  }

  Widget _buildCarOption(String size, String price, String time, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCarSize = size;
          });
        },
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE0F7FA) : Colors.white,
            border: Border.all(
              color: isSelected ? const Color(0xFF00BCD4) : Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.directions_car,
                color: Colors.teal[700],
                size: 36,
              ),
              Text(
                size,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isSelected)
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.teal,
                      size: 16,
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const Text(' 3 '),
                  const Icon(
                    Icons.access_time,
                    size: 14,
                    color: Colors.grey,
                  ),
                  Text(' $time'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Row(
      children: [
        _buildSelectorTile(
          icon: Icons.credit_card,
          label: '****7539',
        ),
        const Spacer(),
        _buildSelectorTile(
          icon: Icons.access_time,
          label: _selectedTime,
          onTap: () {
            setState(() {
              _selectedTime = _selectedTime == 'Now' ? 'Schedule' : 'Now';
            });
          },
        ),
      ],
    );
  }


  Widget _buildSelectorTile({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[100], // optional background
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: icon == Icons.credit_card
                  ? BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(4),
              )
                  : null,
              child: Icon(
                icon,
                size: 16,
                color: icon == Icons.credit_card ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Text(label),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBookButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF263238),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Book this Car',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
