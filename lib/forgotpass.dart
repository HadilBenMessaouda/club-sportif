import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Forgot Password'),
      // ),
      body: Container(
        
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 128, 4, 4),
        ),
        child: Center(
          
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/ess.png',
                  height: 90, // Définissez la hauteur souhaitée de l'image
                ),
                SizedBox(height: 40),
                Text("Reset Password",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,),
                ),
                SizedBox(height: 50,),
                
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.email_outlined),),
                      hintText: '  Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      
                    ),
                  ),
                
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implémentez ici la logique de réinitialisation du mot de passe
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: Text(
                              'Password reset email sent to email.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'RESET ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 96, 96),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 254, 254),
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              
                Text("Already have an account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,),
                ),
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}
