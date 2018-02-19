module PokemonShowcase exposing (..)

{-| This showcase is not optimized in any way and will not necessarily work
for all pokemon on all device-widths.

The purpose of this showcase is to show layering the HTTP requests in a
dependent way and then to give a somewhat pleasant view. Types and Pokemon are
the focus behind this example.

The showcase example was inspired by a very similar jsfiddle that I really liked
the simplicity, yet nuance to.

It can be found [here](https://jsfiddle.net/torcp0r3/8/)

-}

import Array exposing (Array)
import Color exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import Http
import Maybe
import PokeApi exposing (..)
import PokeApi.Tasks exposing (..)
import Random
import String exposing (trim)
import Style
import Style.Background as Background
import Style.Color as Color
import Style.Font as Font
import Task exposing (Task)


type Styles
    = None
    | H1
    | H2
    | Background
    | Sprites
    | Image


stylesheet : Model -> Style.StyleSheet Styles variation
stylesheet model =
    let
        backgroundImage =
            case model.pokemon of
                Nothing ->
                    []

                Just pokemon ->
                    [ Background.imageWith
                        { src = Maybe.withDefault "" pokemon.sprites.frontDefault
                        , position = ( 0, 0 )
                        , repeat = Background.stretch
                        , size = Background.cover
                        }
                    ]
    in
        Style.styleSheet
            [ Style.style None []
            , Style.style H1
                [ Font.size 96 ]
            , Style.style H2
                [ Font.size 36 ]
            , Style.style Background backgroundImage
            , Style.style Sprites
                [ Color.background (Color.rgba 51 51 51 0.5) ]
            , Style.style Image []
            ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { pokemon : Maybe Pokemon
    , typeName : Maybe String
    }


init : ( Model, Cmd Msg )
init =
    ( { pokemon = Nothing
      , typeName = Nothing
      }
    , getResourceList Type_ (onPageOfSize 1 18)
        |> Task.attempt ReceivedTypes
    )


type Msg
    = ReceivedTypes (Result Http.Error ApiResourceList)
    | ReceivedType (Result Http.Error Type)
    | ReceivedPokemon (Result Http.Error Pokemon)
    | GeneratedTypeIndex (Array ApiUrl) Int
    | GeneratedPokemonIndex (Array ApiUrl) Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReceivedTypes (Ok types) ->
            ( model
            , Random.generate (GeneratedTypeIndex <| apiUrls types) <|
                indexGenerator types.results
            )

        ReceivedTypes (Err _) ->
            ( model, Cmd.none )

        ReceivedType (Ok type_) ->
            let
                urls =
                    Array.fromList <|
                        List.map (.url << .pokemon) type_.pokemon
            in
                ( { model | typeName = Just type_.name }
                , Random.generate (GeneratedPokemonIndex urls) <|
                    indexGenerator type_.pokemon
                )

        ReceivedType (Err err) ->
            let
                _ =
                    Debug.log "ReceivedType: " err
            in
                ( { model | typeName = Nothing }, Cmd.none )

        ReceivedPokemon (Ok pokemon) ->
            ( { model | pokemon = Just pokemon }, Cmd.none )

        ReceivedPokemon (Err err) ->
            let
                _ =
                    Debug.log "ReceivedPokemon: " err
            in
                ( model, Cmd.none )

        GeneratedTypeIndex urls index ->
            ( model
            , case Array.get index urls of
                Nothing ->
                    Cmd.none

                Just url ->
                    getTypeBy (urlOf url)
                        |> Task.attempt ReceivedType
            )

        GeneratedPokemonIndex urls index ->
            ( model
            , case Array.get index urls of
                Nothing ->
                    Cmd.none

                Just url ->
                    getPokemonBy (urlOf url)
                        |> Task.attempt ReceivedPokemon
            )


apiUrls : ApiResourceList -> Array ApiUrl
apiUrls list =
    Array.fromList <| List.map .url list.results


indexGenerator : List a -> Random.Generator Int
indexGenerator list =
    Random.int 0 <| (List.length list) - 1


view : Model -> Html Msg
view model =
    let
        pokemonName =
            case model.pokemon of
                Nothing ->
                    "Selecting..."

                Just pokemon ->
                    capitalize pokemon.name

        sprites =
            let
                whenUrl maybeUrl =
                    case maybeUrl of
                        Nothing ->
                            []

                        Just url ->
                            [ decorativeImage Image
                                []
                                { src = url }
                            ]
            in
                case model.pokemon of
                    Nothing ->
                        []

                    Just pokemon ->
                        [ row Sprites
                            [ center ]
                            (flatten
                                [ whenUrl pokemon.sprites.frontDefault
                                , whenUrl pokemon.sprites.frontShiny
                                , whenUrl pokemon.sprites.frontFemale
                                , whenUrl pokemon.sprites.frontShinyFemale
                                , whenUrl pokemon.sprites.backDefault
                                , whenUrl pokemon.sprites.backShiny
                                , whenUrl pokemon.sprites.backFemale
                                , whenUrl pokemon.sprites.backShinyFemale
                                ]
                            )
                        ]
    in
        Element.viewport (stylesheet model) <|
            column Background
                [ width (percent 100)
                , height (percent 100)
                , verticalCenter
                , center
                ]
                [ el H1
                    [ center
                    , width (percent 80)
                    ]
                    (text pokemonName)
                , el H2
                    [ center
                    , width (percent 80)
                    ]
                    (text << capitalize <| Maybe.withDefault "" model.typeName)
                    |> below sprites
                ]


capitalize : String -> String
capitalize text =
    let
        upperFirst str =
            String.toUpper (String.left 1 str) ++ String.dropLeft 1 str

        capitalizeDash str =
            str
                |> String.split "-"
                |> List.map upperFirst
                |> String.join "-"
    in
        text
            |> String.words
            |> List.map capitalizeDash
            |> String.join " "


flatten : List (List a) -> List a
flatten list =
    List.foldl (List.foldl (::)) [] list
