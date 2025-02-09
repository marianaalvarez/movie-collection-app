# Movie Collection App 🍿

This repository contains a study project showcasing best practices and architectural design patterns in iOS development.

## Movie Search Feature Specs

### Story: User wants to search for a movie
### Narrative #1

```
As an online user
I want the app to display my most recently searched movie
and allow me to search for new movies using a title input
so I can easily access my search history and see the movie details
```

Scenario: movie stored in cache

```
Given the user has connectivity
When the user opens the search screen
And there's a movie stored in cache memory
Then the app should display the movie
```

Scenario: no movie stored in cache

```
Given the user has connectivity
When the user opens the search screen
And there's no movie stored in cache memory
Then the app should show a welcoming message
```

Scenario: search movie (success)

```
Given the user has connectivity
When the user search for a movie title
And the remote server returns a valid response with a movie
Then the app should display the movie
And update the cache memory
```

Scenario: search movie (failure)

```
Given the user has connectivity
When the user search for a movie title
And the remote server returns an invalid response 
Then the app should display an error message
```

Flowchart

<img width="298" alt="Screenshot 2024-12-10 at 10 31 33 pm" src="https://github.com/user-attachments/assets/2bf7faf7-6dbd-40d6-8428-ca8ef6d8d6ff">


### Narrative #2

```
As an offline user,
I want the app to display the latest saved movie
so I can easily access my search history
```

Scenario: movie stored in cache

```
Given the user doesn't have connectivity
When the user opens the search screen
And there's a movie stored in cache memory
Then the app should display the latest movie saved
```


Scenario: no movie stored in cache

```
Given the user doesn't have connectivity
When the user opens the search screen
And there's no movie stored in cache memory 
Then the app should show an error message
```
Flowchart

<img width="288" alt="Screenshot 2024-12-10 at 10 31 15 pm" src="https://github.com/user-attachments/assets/d20d3b1c-748f-40b8-9d12-44cacdc82d73">

## Model Specs

Movie

| Property      | Type |
| ------------- | ------------- |
| title         | String  |
|  year         | String  |
|  genre     | String  |
|  director     | String  |
|  plot     | String  |
|  poster     | String  |

Payload

```
GET /?apikey=[apiKey]&t=[title]

200 RESPONSE

{
   "Title":"Spider",
   "Year":"2002",
   "Director":"David Cronenberg",
   "Genre": "Drama, Mystery, Thriller",
   "Plot":"A mentally disturbed man takes residence in a halfway house. His mind gradually slips back into the realm created by his illness, where he replays a key part of his childhood.",
   "Poster": "image-URL"
}
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

Flowchart

<img width="298" alt="Screenshot 2024-12-10 at 10 33 04 pm" src="https://github.com/user-attachments/assets/d0c6b836-df5e-4fb4-ade1-cb20cd1ba3f3">


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

Flowchart

<img width="430" alt="Screenshot 2024-12-10 at 10 31 50 pm" src="https://github.com/user-attachments/assets/a6ca7c48-dfcc-4b5f-8e11-f6a089992a31">


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

Flowchart

<img width="340" alt="Screenshot 2024-12-10 at 10 34 58 pm" src="https://github.com/user-attachments/assets/a07b1e5a-ca45-4a86-9237-28ffb328ee5b">

## App Architecture 

<img width="725" alt="Screenshot 2024-12-13 at 9 48 55 pm" src="https://github.com/user-attachments/assets/345258b6-b866-4e35-acf6-271600dd3373" />


