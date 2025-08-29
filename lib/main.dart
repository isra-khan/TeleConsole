import 'dart:io';
import 'auth.dart';
import 'menus.dart';
import 'services.dart';

Map<String, String> users = {}; // username -> password
Map<String, double> userBalances = {}; // username -> balance
List<String> complaints = []; // store user complaints

void main() {
  mainMenu();
}

void mainMenu() {
  while (true) {
    print("\n--- MAIN MENU ---");
    print("1. Sign In");
    print("2. Sign Up");
    print("3. Exit");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      signIn();
    } else if (choice == "2") {
      signUp();
    } else if (choice == "3") {
      print("\n Exiting program. Goodbye!");
      break;
    } else {
      print(" Invalid choice, try again.");
    }
  }
}
