// Challenge 1
// Write test cases for the next challenges and make sure to include boundary conditions
// DO THIS FIRST

// Challenge 2
// Track the Robot
// This robot roams around a 2D grid. It starts at (0, 0) facing North.
// After each time it moves, the robot rotates 90 degrees clockwise.
// Given the amount the robot has moved each time, you have to calculate the robot's final position.
// Example
// trackRobot([20, 30, 10, 40]) ➞ [-10, 10]
List<int> trackRobot(List<int> movements) {
  int count = 0; //this will keep track of robot direction 0N,1E,2S,3W
  List<int> position = [0, 0];
  for (int i = 0; i < movements.length; i++) {
    if (count == 4) {
      count = 0;
    }

    if (count == 0) {
      position[1] = position[1] + movements[i];
    } else if (count == 1) {
      position[0] = position[0] + movements[i];
    } else if (count == 2) {
      position[1] = position[1] - movements[i];
    } else if (count == 3) {
      position[0] = position[0] - movements[i];
    }

    count++;
  }

  return position;
}

nextPoint(int mov, List curr) {}

// Challenge 3
// Vending Machine
// Your task is to create a function that simulates a vending machine.
// Given an amount of money (in cents ¢ to make it simpler) and a productNumber,
// the vending machine should output the correct product name and give back the
// correct amount of change.

// The coins used for the change are the following: [100, 50, 20, 10, 5]

// The return value is a map with 2 properties:
// product: the product name that the user selected.
// change: a list of coins returned (can be empty, must be sorted in descending order).

List<Map> products = [
  {'number': 1, 'price': 100, 'name': 'Orange juice'},
  {'number': 2, 'price': 200, 'name': 'Soda'},
  {'number': 3, 'price': 150, 'name': 'Chocolate snack'},
  {'number': 4, 'price': 250, 'name': 'Cookies'},
  {'number': 5, 'price': 180, 'name': 'Gummy bears'},
  {'number': 7, 'price': 120, 'name': 'Crackers'},
  {'number': 8, 'price': 220, 'name': 'Potato chips'},
  {'number': 9, 'price': 80, 'name': 'Small snack'},
];

Map vendingMachine(int money, int productNo) {
  try {
    products.firstWhere((x) => x['number'] == productNo);
  } catch (e) {
    return {'error': 'No Such Item,Please try again'};
  }
  Map subMap = products.firstWhere((x) => x['number'] == productNo);

  if (subMap['price'] > money) {
    return {'error': 'Invalid Amount'};
  }
  return {
    "product": subMap['name'],
    'change': getChange(money, subMap['price'])
  };
}

List<int> getChange(int totalMoney, int productPrice) {
  totalMoney = totalMoney - productPrice;
  List<int> change = [];
  while (totalMoney != 0) {
    if (totalMoney ~/ 100 != 0) {
      int numberOfNotes = totalMoney ~/ 100;
      for (int i = 0; i < numberOfNotes; i++) {
        change.add(100);
      }
      totalMoney = totalMoney - (numberOfNotes * 100);
    } else if (totalMoney ~/ 50 != 0) {
      int numberOfNotes = totalMoney ~/ 50;
      for (int i = 0; i < numberOfNotes; i++) {
        change.add(50);
      }
      totalMoney = totalMoney - (numberOfNotes * 50);
    } else if (totalMoney ~/ 20 != 0) {
      int numberOfNotes = totalMoney ~/ 20;
      for (int i = 0; i < numberOfNotes; i++) {
        change.add(20);
      }
      totalMoney = totalMoney - (numberOfNotes * 20);
    } else if (totalMoney ~/ 10 != 0) {
      int numberOfNotes = totalMoney ~/ 10;
      for (int i = 0; i < numberOfNotes; i++) {
        change.add(10);
      }
      totalMoney = totalMoney - (numberOfNotes * 10);
    } else if (totalMoney ~/ 5 != 0) {
      int numberOfNotes = totalMoney ~/ 5;
      for (int i = 0; i < numberOfNotes; i++) {
        change.add(5);
      }
      totalMoney = totalMoney - (numberOfNotes * 5);
    }
  }
  return change;
}

main() {
  print(trackRobot([20, 30, 10, 40, 10, 20]));
  print(vendingMachine(300, 3));
}
