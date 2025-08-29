import 'dart:io';
import 'main.dart';

void internetMenu(String username) {
  while (true) {
    print("\n--- INTERNET PACKAGES ---");
    print("1. 1GB for \$5");
    print("2. 5GB for \$20");
    print("3. Back");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      if (deductBalance(username, 5)) print("\n You purchased 1GB for \$5");
    } else if (choice == "2") {
      if (deductBalance(username, 20)) print("\n You purchased 5GB for \$20");
    } else if (choice == "3") {
      break;
    }
  }
}

void smsMenu(String username) {
  while (true) {
    print("\n--- SMS PACKAGES ---");
    print("1. 100 SMS for \$2");
    print("2. Unlimited SMS for \$10");
    print("3. Back");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      if (deductBalance(username, 2)) print("\n You purchased 100 SMS for \$2");
    } else if (choice == "2") {
      if (deductBalance(username, 10))
        print("\n You purchased Unlimited SMS for \$10");
    } else if (choice == "3") {
      break;
    }
  }
}

void callerTuneMenu(String username) {
  while (true) {
    print("\n--- CALLER TUNE OPTIONS ---");
    print("1. Pop Song (\$3)");
    print("2. Classical Tune (\$4)");
    print("3. Custom Ringtone (\$6)");
    print("4. Back");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      if (deductBalance(username, 3)) print("\n You selected Pop Song");
    } else if (choice == "2") {
      if (deductBalance(username, 4)) print("\n You selected Classical Tune");
    } else if (choice == "3") {
      if (deductBalance(username, 6)) print("\n You selected Custom Ringtone");
    } else if (choice == "4") {
      break;
    }
  }
}

void addComplaint(String username) {
  stdout.write("\n Enter your complaint: ");
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
