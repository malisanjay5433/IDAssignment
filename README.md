# IDAssignment [Tech Presentation](https://tin-ixora-70e.notion.site/Technical-Presentation-943a4cb4143a4855871455d0a9374fe5)
## SwiftUI Server Communication Example
This iOS application demonstrates basic client-server communication using SwiftUI and Combine. The server is integrated into the application and acknowledges requests. The example adheres to SOLID, DRY, and KISS principles, promoting a clean and modular architecture.

## Project Structure
### Model:

### ServerService.swift: 
  Manages server communication.
### View Model:
  RequestViewModel.swift: Handles business logic and communicates with the server.
### View:
  ContentView.swift: SwiftUI view displaying UI components.

### Tests:

ServerServiceTests.swift: Unit tests for the ServerService.
Usage
Clone the repository and open it in Xcode. Run the app on a simulator or a real device. The app includes a simple interface with buttons to send single and multiple requests to the server.

Dependencies
SwiftUI
Combine
How to Run
Open the Xcode project file.
Select a simulator or connect a real device.
Press the "Run" button in Xcode.

## Acknowledgments
The application uses a ServerService to simulate server responses. Unit tests for the server service are included in ServerServiceTests.swift. The project follows best practices, including SOLID, DRY, and KISS principles, to ensure a maintainable and readable codebase.
