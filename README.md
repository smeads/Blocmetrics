== README

An analytics service and reporting tool that you can use with web apps to track user activity.

User Case:
  * A client-side JavaScript snippet that allows a user to track events on their website.
  * A server-side API that captures and saves those events to a database.
  * A Rails application that displays the captured event data for a user.

Create a JavaScript Snippet

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
