# Movie Collection App 🍿

## Movie Search Feature Specs

### Story: User wants to search for a movie
### Narrative #1

```
As an online user,
I want the app to display my most recently searched movie
and allow me to search for new movies using a title input
so I can easily access my search history and see the movie details
```

Scenario: movie stored in local storage

```
Given the user has connectivity
When the user opens the search screen
And there's a movie stored in local storage 
Then the app should display the movie
```

Scenario: no movie stored in local storage

```
Given the user has connectivity
When the user opens the search screen
And there's no movie stored in local storage 
Then the app should show a welcoming message
```

Scenario: search a movie (success)

```
Given the user has connectivity
When the user search for a movie title
And the remote server returns a valid response with a movie
Then the app should display the movie details
And update the local storage
```

Scenario: search a movie (failure)

```
Given the user has connectivity
When the user search for a movie title
And the remote server returns an invalid response 
Then the app should display an error message
```

### Narrative #2

```
As an offline user,
I want the app to display the latest saved movie
so I can easily access my search history
```

Scenario: movie stored in local storage

```
Given the user doesn't have connectivity
When the user opens the search screen
And there's a movie stored in local storage 
Then the app should display the latest movie saved
```


Scenario: no movie stored in local storage

```
Given the user doesn't have connectivity
When the user opens the search screen
And there's no movie stored in local storage 
Then the app should show an error message
```


## Movies List Feature Specs

### Story: User wants to add a movie to the collection and access their movies list
### Narrative #1

```
As an online or offline user,
I want to be able to save a movie to my local collection
so I can easily acces my favorite movies 
```

Scenario: add movie to the collection (success)

```
Given a movie is displayed
When the user clicks the button to add the movie to their collection
And the request to save the movie in a local storage succeeds 
Then the app should display a success message
```

Scenario: add movie to the collection (failure)

```
Given a movie is displayed
When the user clicks the button to add the movie to their collection
And the request to save the movie in a local storage fails 
Then the app should display an error message
```
### Story: User wants to see their movie collection
### Narrative #1

```
As an online or offline user,
I want to be able to see the list of my saved movies
so I can easily access my favorite movies 
```

Scenario: list movies (success)

```
Given the user is online or offline
When the user opens the collection screen
And the request to fetch all saved movies from local storage succeeds
Then the app should display the movies list
```

Scenario: list movies (failure)

```
Given the user is online or offline
When the user opens the collection screen
And the request to fetch all saved movies from local storage fails
Then the app should display an error message
```

### Story: User wants remove a movie from the list

Scenario: remove movie from collection (success)

```
Given the user is online or offline
When the user clicks the button to remove a movie from the collection
And the request to remove the movie from local storage succeeds
Then the app should update the UI with the updated list
```

Scenario: remove movie from collection (failure)

```
Given the user is online or offline
When the user clicks the button to remove a movie from the collection
And the request to remove the movie from local storage fails 
Then the app should display an error message
```

