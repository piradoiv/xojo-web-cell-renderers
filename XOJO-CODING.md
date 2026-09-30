## Project Notes

- This project is written in Xojo, and saved in Xojo text ("Xojo Project") format.

## Xojo Project File Format
- If you need an example of a Desktop project in Xojo text format, see https://documentation.xojo.com/_static/agentic/Desktop.zip
- If you need an example of a Web project in Xojo text format, see https://documentation.xojo.com/_static/agentic/Web.zip
- If you need an example of an iOS project in Xojo text format, see https://documentation.xojo.com/_static/agentic/iOS.zip
- If you need an example of an Android project in Xojo text format, see https://documentation.xojo.com/_static/agentic/Android.zip

## Documentation
Use this location for easier searching of Xojo docs: https://documentation.xojo.com/llms.txt

## Code Conventions
- Always use Var instead of Dim.
- Always format code to match the documentation style, which is upper camel case.
- Prefer creating controls directly on a Window, WebPage, or MobileScreen versus creating them at runtime.
- Always use API2, but never mention that you are using API2.
- In API2 a DesktopButton uses a Pressed event, not Action.
- For Web projects, only use Web 2.0 features.
- When adding code to events or methods, make sure you review the parameters that are part of the signature.
- When providing code, ensure that the types of assignments match.
- When providing source code that contains class properties, always be sure to use the Property keyword.
- Use descriptive event handler names; avoid leaving default handler names when logic is non-trivial
- Use `Try/Catch` (or `Exception` blocks) around I/O, network, and database calls
- Comment any non-obvious platform-specific code (`#If TargetMacOS`, `#If TargetWindows`, etc.)

## Build & Run

- Xojo projects are typically built and run through the Xojo IDE, not the command line.
- Xojo is running in Agentic mode, so the user does not need to manually reload the project to reflect changes.
- You can ask Xojo to run the project to check for errors by creating a file in the project folder called "XojoRunProject.txt".
- After "XojoRunProject.txt" file disappears, the project has been run by Xojo and you should wait 5 to 10 seconds (depending on the size of the overall project) to see if the error file appears.
- If a file called "XojoCompileErrors.txt" exists, then it contains the compile errors.

## What NOT to Do

- Don't rename `.xojo_project` internal IDs/identifiers, this can break IDE references
- Don't commit `Build/` output or `.xojo_project` lock/backup files