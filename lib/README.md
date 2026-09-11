CampusPulse is a Flutter app built around a simple campus problem: sometimes you know what you want to do, but you don't know where to go.

You might want a quiet place to study, somewhere to work on a project, a place to meet friends, or just a spot that isn't too crowded. Instead of checking different places one by one, CampusPulse gives you a quick picture of what's happening around campus and helps you decide.

The idea

The main idea behind CampusPulse is the Campus Pulse Score.

Each location has a score based on things students would actually care about, such as crowd level, noise and how suitable the place is for studying or working.

For this version, the campus data is simulated so that the focus stays on the Flutter implementation and the user experience.

The app currently includes:

Central Library
Food Court
Tech Block
Student Park

For example, if the library currently has a high pulse score and is marked as quiet, it becomes an obvious choice for someone looking for a place to study.

What can you do?

Find a suitable place

The home page gives a quick view of campus spots and their current pulse scores.

Check a location

Tapping a location opens more information such as:

Noise level
Crowd level
Study suitability
Charging availability
Pulse score

It also gives a short explanation of why that location might be a good choice.

Report what's happening

Campus conditions can change quickly.

The Report feature lets a student say whether a place is:

Quiet
Moderate
Crowded
Having an event
Experiencing an issue

The selected report is then shown as a confirmation.

Watch the pulse change

The Live Pulse screen demonstrates how campus conditions could be updated continuously.

The current version uses a simulated stream that changes the pulse score every few seconds. In a future version, this could be connected to real student reports or live campus data.

Flutter concepts used

I built the project around the concepts mentioned in the recruitment task rather than adding unnecessary technologies.

The project uses:

Dart lists and maps
Functions and asynchronous functions
StatelessWidget
StatefulWidget
Screen navigation using Navigator
Future and FutureBuilder
Stream and StreamBuilder
Basic Material UI widgets
User interaction with setState()

Why the data is simulated

CampusPulse does not use Firebase, an external API, or a real-time database in this version.

I chose to keep the data local and simulated because the main goal of this version was to learn Flutter and demonstrate the required concepts properly. The structure can be extended later without changing the basic idea of the app.

A future version could collect real student reports and use them to calculate a more meaningful pulse score for each location.

Running the project

Make sure Flutter is installed and configured.

Clone the repository and open the project:

git clone <repository-url>
cd campus_pulse

Get the required packages:

flutter pub get

Run the application:

flutter run

Screenshots

Home

The home screen gives a quick overview of the campus and highlights a recommended location.

Location Details

Each campus location has its own pulse score and useful information.

Live Pulse

The Live Pulse screen demonstrates continuously changing campus data using a Flutter Stream.

APK

The Android APK is available in the Releases section of this repository.

What I would add next

The current version is a starting point. The next version could include:

Firebase for storing student reports
Real-time updates from student submissions
A campus map
User authentication
More detailed pulse calculations
Different recommendations based on whether the user wants to study, eat, relax or work
Historical data to show how campus locations change throughout the day

About the project

CampusPulse was built as part of the Android Club recruitment task to learn Flutter and explore how a relatively simple campus problem could be turned into a useful mobile experience.

Screenshots

Home Page

The main page shows the different campus locations and their current pulse scores.

Central Library

Shows the current pulse score and details for the Central Library.

Food Court

Shows the pulse information for the Food Court.

Tech Block

Shows the pulse information for the Tech Block.

Student Park

Shows the pulse information for the Student Park.

Report

Allows students to report what is currently happening at a campus location.

Live Pulse

Shows the pulse score changing over time using a stream.
