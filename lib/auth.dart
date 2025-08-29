import 'dart:io';
import 'main.dart';
import 'menus.dart';

void signUp() {
  stdout.write("\nEnter a username: ");
  String? username = stdin.readLineSync();

  if (username == null || username.isEmpty) {
    print(" Username cannot be empty!");
    return;
  }

  if (users.containsKey(username)) {
    print(" Username already exists. Please sign in or choose another.");
    return;
  }

  stdout.write("Enter a password: ");
  String? password = stdin.readLineSync();

  if (password == null || password.isEmpty) {
    print(" Password cannot be empty!");
    return;
  }

  users[username] = password;
  userBalances[username] = 100; // default balance
  print("Sign up successful! You can now sign in.");
}

void signIn() {
  stdout.write("\nEnter username: ");
  String? username = stdin.readLineSync();

  stdout.write("Enter password: ");
  String? password = stdin.readLineSync();

  if (users.containsKey(username) && users[username] == password) {
    print("\n Login successful! Welcome, $username.");
    subMenu(username!); // pass username to menu
  } else {
    print("Invalid username or password. Try again.");
  }
}
