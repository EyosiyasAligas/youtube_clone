This is a simple YouTube clone built using Flutter, which has features like video searching, video Playing, and Google sign in.



Contributors:

Eyosiyas Aligas 1201635 

Dereje Getachew 1201438

To get started with this project, follow the steps below:

Clone the repository

Use the git clone command to clone the repository to your local machine.

Install dependencies

Navigate to the project directory and run flutter pub get to install the necessary dependencies.

Run the app

Run the app using flutter run command in your terminal or through your preferred IDE.



This app includes the following features: 

Sign-in and Sign-out with Google

Users can sign in to the app using their Google account. Firebase authentication is used for Google sign-in. When a user signs in, their credentials are saved, and they
will remain signed in even if they close the app. When the user signs out an authentication screen appears and the user can again sign in with theier google account.


Video feed

The app fetches videos using the YouTube API. Users can scroll through a list of videos in the app. They can also search for videos using the search bar at the top of
the screen. The video feed displays a thumbnail image of each video along with its title and and other information related to the video. 


Video player 

The app uses the Youtube_player_flutter plugin to play videos. When a user taps on a video in the video feed, the video player screen opens. The video player screen
displays the video along with its title. Users can play, pause, and seek the video using the player controls.
