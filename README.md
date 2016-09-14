# README

#### Blocmetrics

An analytics service and reporting tool that you can use with web apps to track user activity.

User Case:
* A client-side JavaScript snippet that allows a user to track events on their website.
* A server-side API that captures and saves those events to a database.
* A Rails application that displays the captured event data for a user.

### Application Features

#### User Story:
* A user can sign up for a free account by providing a name, password and email.
* A user can sign in and out of Blocmetrics.
* A user can register an application for tracking.
* A user can associate events with a registered application.
* A user can see a graph of events for each registered application.

#### Authentication with Devise:
Blocmetrics incorporates [Devise](https://github.com/plataformatec/devise) for user authentication. The authentication system allows users to sign up and sends emails for account confirmation. Users can sign in and out of Blocmetrics.

#### CORS
Client-side JavaScript sends an AJAX request to the Blocmetrics API so that it can store events. Browsers normally do not allow such cross-origin requests to occur. This is to prevent security vulnerabilities such as cross-site scripting. CORS allows us to allow cross-origin requests in a controlled manner without opening up security vulnerabilities.

CORS works by making a preliminary request to the target server, asking if the cross-domain request will be permitted.

#### Chartkick & Groupdate
To show events for each registered application Blocmetrics uses [Chartkick](https://github.com/ankane/chartkick#installation) and [Groupdate](https://github.com/ankane/groupdate). Using Groupdate, Chartkick allows for a line chart of events over time.

#### Create a JavaScript Snippet

Use JavaScript to capture and track events in your application by using the
following snippet in your application.js file:

```
  blocmetrics.report = function(eventName) {
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "http://localhost:3000/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  }
```
Additionally add the following code inside the desired view pages  you want to track. This example has the event name "User Profile". Feel free to use any name that best describes the page you are tracking:

```
<script type="text/javascript">
     $(document).on("ready page:load", function () {
        blocmetrics.report("Users Profile");
      })
</script>
```

#### Video Walk Through
<iframe width="560" height="315" src="https://www.youtube.com/embed/Gjd3QbME2-E/0" frameborder="0" allowfullscreen></iframe>

#### Heroku Link
[Blocmetrics](https://still-reaches-71761.herokuapp.com/)
