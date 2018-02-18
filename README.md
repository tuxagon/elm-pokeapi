# Pokéapi Wrapper for Elm

## Documentation

API documentation regarding Pokéapi can be found
[here](https://pokeapi.co/docsv2/)

GitHub: https://github.com/PokeAPI/pokeapi 

## Usage

TODO

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
the documentation doesn't have: type safety. Elm :smiley:
