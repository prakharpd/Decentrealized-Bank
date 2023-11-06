import Debug "mo:base/Debug"; // <-- For getting access to the Debug.print()
import Time "mo:base/Time"; // <-- For getting access to the Time module.
import Float "mo:base/Float";


actor DBank {
  // We are adding 'orthogonally persistance' by saying 'stable'. Which means that It will held on to the previous values if if below this line of code changes.
  // And new canister gets created.
  stable var currentValue : Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));


  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  let id = 2321545212544132417;

  //Debug.print(debug_show (id));

  // In Order To Depostie Cryto Currency In Our Digital Bank We are creating a function.

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // Allow user to withdraw an amount from the currentValue
  // Decrease the currentValue by the amount

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero .");
    };
  };
  public query func checkBalance() : async Float {
    return currentValue;

  };
  // Below Code is for creating Compound Intrest.
  public func compound () {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    currentValue := currentValue + (1.01 **Float.fromInt(timeElapsedS)); 
    startTime := currentTime; // This code will negotiate the timelapse. 
    Debug.print(debug_show(currentValue));
  };
  //topUp();
};
