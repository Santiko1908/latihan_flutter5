import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LayoutRulesExample()));
}

class LayoutRulesExample extends StatelessWidget {
  const LayoutRulesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tiga Aturan Layout Flutter')),
      body: const MyPages(),
    );
  }
}

class MyPages extends StatelessWidget {
  const MyPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [MyPages1(), SizedBox(height: 24), MyPages3()],
        ),
      ),
    );
  }
}

class MyPages1 extends StatelessWidget {
  const MyPages1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1 & 2. Aturan Constraints (Batas) dan Size (Ukuran)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Induk memaksa anak berada di batas 100x100 hingga 200x200. '
          'Anak meminta ukuran 500x50, tapi dipaksa mengikuti batas induk '
          '(mentok di lebar 200, tinggi 100).',
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 200,
            minHeight: 100,
            maxHeight: 200,
          ),
          child: Container(
            key: const ValueKey('constraint-example'),
            width: 500,
            height: 50,
            color: Colors.blue,
            child: const Text(
              'Saya minta 500x50, tapi dapatnya 200x100',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPages3 extends StatelessWidget {
  const MyPages3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3. Aturan Posisi (dengan Align)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Induk abu-abu berukuran 200x200. Kotak hijau 80x80 ditempatkan '
          'di pojok kanan bawah menggunakan widget Align.',
        ),
        const SizedBox(height: 10),
        Container(
          key: const ValueKey('alignment-parent'),
          width: 200,
          height: 200,
          color: Colors.grey[300],
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              key: const ValueKey('alignment-child'),
              width: 80,
              height: 80,
              color: Colors.green,
              child: const Text('Align', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
