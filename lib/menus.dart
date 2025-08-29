import 'dart:io';
import 'services.dart';

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
    } else if (choice == "7" || choice == "8") {
      print("\n⬅ Returning to Main Menu...");
      break;
    } else {
      print("Invalid choice, try again.");
    }
  }
}
