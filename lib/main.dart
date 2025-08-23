import 'dart:io';

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
      print("\n👋 Exiting program. Goodbye!");
      break;
    } else {
      print(" Invalid choice, try again.");
    }
  }
}

void signUp() {
  stdout.write("\nEnter a username: ");
  String? username = stdin.readLineSync();

  if (username == null || username.isEmpty) {
    print(" Username cannot be empty!");
    return;
  }

  if (users.containsKey(username)) {
    print("⚠ Username already exists. Please sign in or choose another.");
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

void subMenu(String username) {
  while (true) {
    print("\n--- SERVICES MENU ---");
    print("1. Internet");
    print("2. SMS");
    print("3. Caller Tune");
    print("4. Complain");
    print("5. Balance Inquiry");
    print("6. Recharge");
    print("7. Logout");
    print("8. Back to Main Menu");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      internetMenu(username);
    } else if (choice == "2") {
      smsMenu(username);
    } else if (choice == "3") {
      callerTuneMenu(username);
    } else if (choice == "4") {
      addComplaint(username);
    } else if (choice == "5") {
      balanceInquiry(username);
    } else if (choice == "6") {
      recharge(username);
    } else if (choice == "7") {
      print("\n🚪 Logged out. Returning to Main Menu...");
      break;
    } else if (choice == "8") {
      print("\n⬅ Returning to Main Menu...");
      break;
    } else {
      print("Invalid choice, try again.");
    }
  }
}

void internetMenu(String username) {
  while (true) {
    print("\n--- INTERNET PACKAGES ---");
    print("1. 1GB for \$5");
    print("2. 5GB for \$20");
    print("3. Back to Services Menu");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      if (deductBalance(username, 5)) {
        print("\n You purchased 1GB for \$5");
      }
    } else if (choice == "2") {
      if (deductBalance(username, 20)) {
        print("\n You purchased 5GB for \$20");
      }
    } else if (choice == "3") {
      print("\n⬅ Returning to Services Menu...");
      break;
    } else {
      print("Invalid choice, try again.");
    }
  }
}

void smsMenu(String username) {
  while (true) {
    print("\n--- SMS PACKAGES ---");
    print("1. 100 SMS for \$2");
    print("2. Unlimited SMS for \$10");
    print("3. Back to Services Menu");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      if (deductBalance(username, 2)) {
        print("\n You purchased 100 SMS for \$2");
      }
    } else if (choice == "2") {
      if (deductBalance(username, 10)) {
        print("\n You purchased Unlimited SMS for \$10");
      }
    } else if (choice == "3") {
      print("\n⬅ Returning to Services Menu...");
      break;
    } else {
      print("❌ Invalid choice, try again.");
    }
  }
}

void callerTuneMenu(String username) {
  while (true) {
    print("\n--- CALLER TUNE OPTIONS ---");
    print("1. Pop Song (\$3)");
    print("2. Classical Tune (\$4)");
    print("3. Custom Ringtone (\$6)");
    print("4. Back to Services Menu");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      if (deductBalance(username, 3)) {
        print("\n You selected Pop Song");
      }
    } else if (choice == "2") {
      if (deductBalance(username, 4)) {
        print("\n You selected Classical Tune");
      }
    } else if (choice == "3") {
      if (deductBalance(username, 6)) {
        print("\n You selected Custom Ringtone");
      }
    } else if (choice == "4") {
      print("\n⬅ Returning to Services Menu...");
      break;
    } else {
      print(" Invalid choice, try again.");
    }
  }
}

void addComplaint(String username) {
  stdout.write("\n✍ Enter your complaint: ");
  String? complaint = stdin.readLineSync();

  if (complaint != null && complaint.isNotEmpty) {
    complaints.add("[$username] $complaint");
    print(" Complaint submitted successfully!");
  } else {
    print(" Complaint cannot be empty.");
  }
}

void balanceInquiry(String username) {
  print("\n Your current balance is: \$${userBalances[username]}");
}

void recharge(String username) {
  stdout.write("\nEnter amount to recharge: ");
  String? input = stdin.readLineSync();

  double? amount = double.tryParse(input ?? "");
  if (amount != null && amount > 0) {
    userBalances[username] = (userBalances[username] ?? 0) + amount;
    print("Recharge successful! New balance: \$${userBalances[username]}");
  } else {
    print("Invalid recharge amount.");
  }
}

bool deductBalance(String username, double cost) {
  double balance = userBalances[username] ?? 0;
  if (balance >= cost) {
    userBalances[username] = balance - cost;
    print("\$${cost} deducted. Remaining balance: \$${userBalances[username]}");
    return true;
  } else {
    print(" Insufficient balance! Please recharge first.");
    return false;
  }
}
