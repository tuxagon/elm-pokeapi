# Pokéapi Wrapper for Elm

[![Build Status](https://travis-ci.org/tuxagon/elm-pokeapi.svg?branch=master)](https://travis-ci.org/tuxagon/elm-pokeapi)

## Documentation

API documentation regarding Pokéapi can be found
[here](https://pokeapi.co/docsv2/)

GitHub: https://github.com/PokeAPI/pokeapi 

## About

This project came about because I just wanted a fun project to create an elm
package. The goal of this package is to provide type-safety to the official 
Pokeapi. Hope someone finds it fun/useful! :smiley:

## Usage

There are 2 different kinds of endpoints: lists and single resources. For more example usages, check out the examples directory.

### Lists

A basic list endpoint to grab pokemon.

```elm
getResourceList Pokemon_ (onPage 1)
```

Retrieving a list with a custom limit of items per page. 

```elm
getResourceList Berry_ (onPageOfSize 1 100)
```

### Single Resources

A basic single resource endpoint to grab a pokemon by name

```elm
getPokemonBy (nameOf "pikachu")
```

A basic single resource endpoint to grab a pokemon by id

```elm
getPokemonBy (idOf 23)
```

### Chaining Tasks

Due to leveraging `Task`, chaining HTTP requests is made simpler

```elm
getBerryBy (nameOf "pecha")
    |> Task.andThen (\berry -> getBerryFirmnessBy (urlOf berry.firmness.url))
```

### Errors

If there is some reason you need to handle for a not found status specifically,
the Pokeapi provides a model and there is a decoder. You can look at the
`NotFound.elm` file in the `examples/` directory to see how handling it works
with this package.

### Library vs API

This library takes some freedoms to make the library more pleasurable and is not a 1-to-1 match to the PokeApi. Any
inconsistencies will be listed here to be explicit.

* `ApiResource`: Matches PokeApi's `ApiResource` and `NamedApiResource`
* `ApiResourceList`: Matches PokeApi's `ApiResourceList` and
  `NamedApiResourceList`

**Note** The official Pokeapi documentation on various models is inconsistent
with the actual models returned by the API, so there could be a situation 
where you see the official documentation tell you a field is of one type 
only to find it be inconsistent in this package. A goal of this package is to 
be more up-to-date than the official documentation because this has something
the documentation doesn't have: type safety. Elm :sunglasses:
