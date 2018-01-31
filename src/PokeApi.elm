module PokeApi exposing (..)

import Http
import Json.Decode as Decode exposing (Decoder, bool, int, list, maybe, string)
import Json.Decode.Pipeline as Pipeline exposing (decode, required)


type ResourceLoadMsg
    = LoadPokemon (Result Http.Error ApiResourceList)


type alias ListOptions =
    { limit : Int
    , page : Int
    , offset : Int
    }



-- URLS


v2 : String
v2 =
    "https://pokeapi.co/api/v2/"


makeUrl :
    String
    -> String
    -> String
makeUrl resource param =
    String.concat [ v2, resource, "/", param ]


makeUrlWithOptions :
    String
    -> String
    -> ListOptions
    -> String
makeUrlWithOptions resource param opts =
    let
        q =
            "?"
                ++ String.join "&"
                    [ "limit="
                    , toString opts.limit
                    , "page="
                    , toString opts.page
                    , "offset="
                    , toString opts.offset
                    ]
    in
        makeUrl resource param ++ q


get :
    Decoder a
    -> String
    -> Http.Request a
get decoder url =
    Http.get url decoder


getPokemon : Cmd ResourceLoadMsg
getPokemon =
    getPokemonWithOptions
        { limit = 20
        , page = 1
        , offset = 0
        }


getPokemonWithOptions :
    ListOptions
    -> Cmd ResourceLoadMsg
getPokemonWithOptions opts =
    let
        request =
            get apiResourceListDecoder <|
                makeUrlWithOptions "pokemon" "" opts
    in
        Http.send LoadPokemon request


getPokemonById : Int -> Cmd ResourceLoadMsg
getPokemonById id =
    let
        request =
            get pokemonDecoder <|
                makeUrl "pokemon" (toString id)
    in
        Http.send LoadPokemon request



-- TYPES


type alias ApiResource =
    { name : String
    , url : String
    }


type alias ApiResourceList =
    { count : Int
    , next : Maybe String
    , previous : Maybe String
    , results : List ApiResource
    }


type alias NamedApiResource =
    { name : String
    , url : String
    }


type alias Pokemon =
    { id : Int
    , name : String
    , baseExperience : Int
    , height : Int
    , isDefault : Bool
    , order : Int
    , weight : Int
    , locationAreaEncounters : String
    , abilities : List PokemonAbility
    , forms : List NamedApiResource
    , moves : List PokemonMove
    , sprites : PokemonSprites
    , stats : List PokemonStat
    , heldItems : List PokemonHeldItem
    , species : NamedApiResource
    , gameIndices : List VersionGameIndex
    , types : List PokemonType
    }


type alias PokemonAbility =
    { slot : Int
    , isHidden : Bool
    , ability : NamedApiResource
    }


type alias PokemonHeldItem =
    { item : NamedApiResource
    , versionDetails : List PokemonHeldItemVersion
    }


type alias PokemonHeldItemVersion =
    { version : NamedApiResource
    , rarity : Int
    }


type alias PokemonMove =
    { move : NamedApiResource
    , versionGroupDetails : List PokemonMoveVersion
    }


type alias PokemonMoveVersion =
    { moveLearnMethod : NamedApiResource
    , versionGroup : NamedApiResource
    , levelLearnedAt : Int
    }


type alias PokemonSprites =
    { frontDefault : Maybe String
    , frontShiny : Maybe String
    , frontFemale : Maybe String
    , frontShinyFemale : Maybe String
    , backDefault : Maybe String
    , backShiny : Maybe String
    , backFemale : Maybe String
    , backShinyFemale : Maybe String
    }


type alias PokemonStat =
    { effort : Int
    , baseStat : Int
    , stat : NamedApiResource
    }


type alias PokemonType =
    { slot : Int
    , type_ : NamedApiResource
    }


type alias VersionGameIndex =
    { gameIndex : Int
    , version : NamedApiResource
    }



-- DECODERS


apiResourceDecoder : Decoder ApiResource
apiResourceDecoder =
    decode ApiResource
        |> required "name" string
        |> required "url" string


apiResourceListDecoder : Decoder ApiResourceList
apiResourceListDecoder =
    decode ApiResourceList
        |> required "count" int
        |> required "next" (maybe string)
        |> required "previous" (maybe string)
        |> required "results" (list apiResourceDecoder)


namedApiResourceDecoder : Decoder NamedApiResource
namedApiResourceDecoder =
    decode NamedApiResource
        |> required "name" string
        |> required "url" string


pokemonDecoder : Decoder Pokemon
pokemonDecoder =
    decode Pokemon
        |> required "id" int
        |> required "name" string
        |> required "base_experience" int
        |> required "height" int
        |> required "is_default" bool
        |> required "order" int
        |> required "weight" int
        |> required "location_area_encounters" string
        |> required "abilities" (list pokemonAbilityDecoder)
        |> required "forms" (list namedApiResourceDecoder)
        |> required "moves" (list pokemonMoveDecoder)
        |> required "sprites" pokemonSpritesDecoder
        |> required "stats" (list pokemonStatDecoder)
        |> required "held_items" (list pokemonHeldItemDecoder)
        |> required "species" namedApiResourceDecoder
        |> required "game_indices" (list versionGameIndexDecoder)
        |> required "types" (list pokemonTypeDecoder)


pokemonAbilityDecoder : Decoder PokemonAbility
pokemonAbilityDecoder =
    decode PokemonAbility
        |> required "slot" int
        |> required "is_hidden" bool
        |> required "ability" namedApiResourceDecoder


pokemonHeldItemDecoder : Decoder PokemonHeldItem
pokemonHeldItemDecoder =
    decode PokemonHeldItem
        |> required "item" namedApiResourceDecoder
        |> required "version_details"
            (list pokemonHeldItemVersionDecoder)


pokemonHeldItemVersionDecoder : Decoder PokemonHeldItemVersion
pokemonHeldItemVersionDecoder =
    decode PokemonHeldItemVersion
        |> required "version" namedApiResourceDecoder
        |> required "rarity" int


pokemonMoveDecoder : Decode.Decoder PokemonMove
pokemonMoveDecoder =
    decode PokemonMove
        |> required "move" namedApiResourceDecoder
        |> required "version_group_details"
            (list pokemonMoveVersionDecoder)


pokemonMoveVersionDecoder : Decoder PokemonMoveVersion
pokemonMoveVersionDecoder =
    decode PokemonMoveVersion
        |> required "move_learn_method" namedApiResourceDecoder
        |> required "version_group" namedApiResourceDecoder
        |> required "level_learned_at" int


pokemonSpritesDecoder : Decoder PokemonSprites
pokemonSpritesDecoder =
    decode PokemonSprites
        |> required "front_default" (maybe string)
        |> required "front_shiny" (maybe string)
        |> required "front_female" (maybe string)
        |> required "front_shiny_female" (maybe string)
        |> required "back_default" (maybe string)
        |> required "back_shiny" (maybe string)
        |> required "back_female" (maybe string)
        |> required "back_shiny_female" (maybe string)


pokemonStatDecoder : Decoder PokemonStat
pokemonStatDecoder =
    decode PokemonStat
        |> required "effort" int
        |> required "base_stat" int
        |> required "stat" namedApiResourceDecoder


pokemonTypeDecoder : Decoder PokemonType
pokemonTypeDecoder =
    decode PokemonType
        |> required "slot" int
        |> required "type" namedApiResourceDecoder


versionGameIndexDecoder : Decoder VersionGameIndex
versionGameIndexDecoder =
    decode VersionGameIndex
        |> required "game_index" int
        |> required "version" namedApiResourceDecoder
