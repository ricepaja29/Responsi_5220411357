import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Untuk validasi form

  // Fungsi untuk memeriksa data login
  Future<void> _login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    String inputEmail = _emailController.text;
    String inputPassword = _passwordController.text;

    // Validasi apakah email dan password sesuai dengan data yang disimpan
    if (savedEmail == inputEmail && savedPassword == inputPassword) {
      // Jika email dan password sesuai, navigasi ke halaman Home
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Tampilkan pesan error jika email atau password salah
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email atau Password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey, // Menyimpan status form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo aplikasi
                Image.asset(
                  'assets/images/image.png', // Ganti dengan path logo Anda
                  height: 100,
                ),
                SizedBox(height: 16),
                // Judul halaman
                Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),
                // TextField untuk Email dengan validasi
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Email',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // TextField untuk Password dengan validasi
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Masukan Password',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                // Teks bawah untuk "Belum punya akun?" dan "Daftar"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Belum punya akun?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registration');
                          },
                          child: Text(
                            "Daftar",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: Text(
                        "Lupa password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Tombol "Masuk" dengan ukuran sesuai permintaan
                SizedBox(
                  width: 218, // Lebar tombol sesuai permintaan
                  height: 55,  // Tinggi tombol sesuai permintaan
                  child: ElevatedButton(
                    onPressed: () {
                      // Cek apakah form valid sebelum melakukan login
                      if (_formKey.currentState!.validate()) {
                        _login(context); // Panggil fungsi login
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
