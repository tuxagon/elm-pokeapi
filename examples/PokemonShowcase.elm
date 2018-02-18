module PokemonShowcase exposing (..)

import Array exposing (Array)
import Color exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Input as Input
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Http
import Maybe
import PokeApi exposing (..)
import PokeApi.Tasks exposing (..)
import Random
import String exposing (trim)
import Style
import Style.Color as Color
import Style.Font as Font
import Task exposing (Task)


type Styles
    = None
    | H1


stylesheet : Style.StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ Style.style None []
        , Style.style H1
            [ Font.size 24 ]
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
    { idOrName : Maybe String
    , pokemon : Maybe Pokemon
    }


init : ( Model, Cmd Msg )
init =
    ( { idOrName = Nothing
      , pokemon = Nothing
      }
    , getResourceList Type_ (OnPage 1)
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
                ( model
                , Random.generate (GeneratedPokemonIndex urls) <|
                    indexGenerator type_.pokemon
                )

        ReceivedType (Err _) ->
            ( model, Cmd.none )

        ReceivedPokemon (Ok pokemon) ->
            ( { model | pokemon = Just pokemon }, Cmd.none )

        ReceivedPokemon (Err _) ->
            ( model, Cmd.none )

        GeneratedTypeIndex urls index ->
            ( model
            , case Array.get index urls of
                Nothing ->
                    Cmd.none

                Just url ->
                    getTypeBy (Url url)
                        |> Task.attempt ReceivedType
            )

        GeneratedPokemonIndex urls index ->
            ( model
            , case Array.get index urls of
                Nothing ->
                    Cmd.none

                Just url ->
                    getPokemonBy (Url url)
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
    Element.viewport stylesheet <|
        column None
            []
            [ el None [] (text "hello")
            ]
