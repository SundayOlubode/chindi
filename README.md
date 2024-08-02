# Chindi: Simplifying Your Busy Life

Chindi is a user-friendly application designed for busy individuals in Kenya, enabling them to list and delegate errands effortlessly. Whether it's grocery shopping, picking up dry cleaning, or delivering documents, Chindi connects users with reliable runners ready to get tasks done efficiently. The app not only helps users save time and reduce stress but also creates employment opportunities, empowering local communities. With a focus on convenience, reliability, and job creation, Chindi is your go-to solution for managing everyday errands seamlessly.

# App Demo Video

- [Chindi App Demo](https://drive.google.com/file/d/1abBt_B1kWzED5qFe2DTUGQy-eYRgMEGe/view?usp=sharing)

# Authors

- [Anesu Kafesu](https://github.com/anesukafesu)
- [Nina Mwangi](https://github.com/NinaMwangi)
- [S. Samuel Olubode](https://github.com/SundayOlubode)

Description of criterion
To test the application, we wrote unit tests that covered the application models, validators, helpers, and utils. In our test cases, we took special care to include edge cases to increase confidence. We used the test package to cover all unit tests.
We also conducted widget testing to ensure the widgets functioned as intended. For this, we used the flutter_test feature. This included testing user interaction, visual consistency, and responsiveness across different states. We also tested how everything worked together(integration testing) using the integration_test package built into the Flutter SDK.
The application was tested across different devices with different screen sizes.

Outcomes
During testing, bugs, usability issues, and performance concerns were systematically identified and addressed. Some bugs we identified were not being redirected after logging in/signing in. We also added email verification which originally had not been added. We increased the font size following feedback that the text was hard to see. We added push notifications so that users are notified whenever someone registers for a task or a message is sent. We also parallelized asynchronous operations to improve performance. To prevent memory leaks, we made sure to dispose of all controllers. We also implemented the database service to follow the Singleton design pattern to reduce memory usage.

Creating APK File 
We chose not to distribute the application through the Play Store but to send it manually to participants in our beta testing. Therefore, we only generated the APK file using the following command: flutter build APK. This meant we did not need to do any release signing and security verification for the limited rollout we conducted. However, in the future, when we do a wide release, we will distribute the application using the Play Store and also compile the application for the iOS App Store.


