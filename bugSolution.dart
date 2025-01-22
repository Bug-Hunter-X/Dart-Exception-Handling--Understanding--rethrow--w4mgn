```dart
import 'dart:async';

Future<void> fetchData() async {
  try {
    // Simulate an asynchronous operation that might throw an exception
    await Future.delayed(const Duration(seconds: 1));
    if (true) {
      throw Exception('Simulated network error');
    }
    // Process the data if the operation was successful
    print('Data fetched successfully');
  } on TimeoutException catch (e) {
    print('Timeout error: $e');
    //In this improved solution, we do not rethrow here because we have handled the timeout specifically 
  } on Exception catch (e) {
    // Handle other exceptions.  Still rethrow so higher level handler can handle it
    print('An error occurred: $e');
    rethrow; // Re-throw the exception to be handled at a higher level
  } catch (e) {
    // Handle any unexpected errors
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw the exception to be handled at a higher level
  }
}

void main() async {
  try {
    await fetchData();
  } catch (e) {
    print('Error caught in main function: $e');
  } finally {
    print('Main function complete');
  }
}
```