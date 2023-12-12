import 'dart:math';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String generatedPassword = '';

  int _sliderLength = 6;
  bool _isUpperCase = true;
  bool _isLowerCase = true;
  bool _isNumbers = true;
  bool _isSymbols = true;
  int _strengthLevel = 0;


  void generatePassword() {
    String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    String numberChars = '0123456789';
    String symbolChars = '!@#\$%^&*()';

    List<String> allowedChars = [];

    if (_isUpperCase) allowedChars.addAll(uppercaseChars.split(''));
    if (_isLowerCase) allowedChars.addAll(lowercaseChars.split(''));
    if (_isNumbers) allowedChars.addAll(numberChars.split(''));
    if (_isSymbols) allowedChars.addAll(symbolChars.split(''));
    if (allowedChars.isEmpty) {
      throw Exception('No se proporcionaron opciones válidas para generar la contraseña.');}

    Random random = Random();
    String password = '';

    // Generar caracteres requeridos
    if (_isUpperCase) {
      int randomIndex = random.nextInt(uppercaseChars.length);
      password += uppercaseChars[randomIndex];
    }
    if (_isLowerCase) {
      int randomIndex = random.nextInt(lowercaseChars.length);
      password += lowercaseChars[randomIndex];
    }
    if (_isNumbers) {
      int randomIndex = random.nextInt(numberChars.length);
      password += numberChars[randomIndex];
    }
    if (_isSymbols) {
      int randomIndex = random.nextInt(symbolChars.length);
      password += symbolChars[randomIndex];
    }

    // Generar caracteres restantes
    int remainingLength = _sliderLength - password.length;
    for (int i = 0; i < remainingLength; i++) {
      int randomIndex = random.nextInt(allowedChars.length);
      password += allowedChars[randomIndex];
    }
    generatedPassword = password;
    setState(() {

    });
  }

  // List of items in our dropdown menu
  var items = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,16,17,18,19,20];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Unique Passwords"),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 20,),

            CustomCard(
              leading: const CircleAvatar(
                radius: 15,
                child: Text("A")),
              title: Text("UpperCase",style:theme.textTheme.bodyMedium ,),
              action: Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: theme.colorScheme.onPrimary,
                  value:_isUpperCase, onChanged: (value){
                setState(() {
                  _isUpperCase=value;
                });
              }),
            ),
            const SizedBox(height: 10),

            CustomCard(
              leading: const CircleAvatar(
                  radius: 15,
                  child: Text("a")),
              title: Text("LowerCase",style:theme.textTheme.bodyMedium ,),
              action: Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: theme.colorScheme.onPrimary,
                  value:_isLowerCase, onChanged: (value){
                setState(() {
                  _isLowerCase=value;
                });
              }),
            ),
            const SizedBox(height: 10),

            CustomCard(
              leading: const CircleAvatar(
                radius: 15,
                child: Text("0")),
              title: Text("Digit",style:theme.textTheme.bodyMedium ,),
              action: Switch(
                activeColor: Colors.green,
                  inactiveTrackColor: theme.colorScheme.onPrimary,
                  value: _isNumbers, onChanged: (value){
                setState(() {
                  _isNumbers=value;
                });
              }),
            ),
            const SizedBox(height: 10),

            CustomCard(
              leading: const CircleAvatar(
                  radius: 15,
                  child: Text("#")),
              title: Text("Symbol",style:theme.textTheme.bodyMedium ,),
              action: Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: theme.colorScheme.onPrimary,
                  value: _isSymbols, onChanged: (value){
                setState(() {
                  _isSymbols=value;
                });
              }),
            ),
            const SizedBox(height: 10),

            CustomCard(
              leading: const CircleAvatar(
                  radius: 15,
                  child: Text("<>")),
              title: Text("Length",style:theme.textTheme.bodyMedium ,),

              action:DropdownButton(
                value: _sliderLength,
                menuMaxHeight: 200,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((int items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.toString()),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (int? newValue) {
                  setState(() {
                    _sliderLength = newValue!;
                  });
                },
              ),

            ),
            const SizedBox(height: 10),

            CustomCard(
              leading: const Text("Generated :",
                style: TextStyle(fontSize:16, fontWeight: FontWeight.normal),
              ),
              title: Text(generatedPassword,maxLines: 1,overflow: TextOverflow.ellipsis,style:theme.textTheme.bodyMedium,),
              action: IconButton(onPressed: (){}, icon: const Icon(Icons.copy_rounded)),
            ),
            const SizedBox(height: 30),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color:theme.colorScheme.primary
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                  onPressed: (){generatePassword();},
                  child: const Text("Password Generator")),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key, required this.leading, required this.title, required this.action,
  });
  final Widget leading;
  final Widget title;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
      padding: const EdgeInsets.only(left: 20,right: 10),
      child: Row(
        children: [
          leading,

          const SizedBox(width: 15),
          Expanded(child: title),

          action,

        ],
      ),
    );
  }
}
