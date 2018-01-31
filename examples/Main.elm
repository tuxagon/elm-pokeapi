module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import PokeApi exposing (..)
import String exposing (trim)


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
    , pokemon : Maybe PokeApi.ApiResourceList
    }


init : ( Model, Cmd Msg )
init =
    ( { idOrName = Nothing
      , pokemon = Nothing
      }
    , Cmd.none
    )


type Msg
    = EditIdOrName String
    | GetClicked
    | PokeApiMsg PokeApi.ResourceLoadMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EditIdOrName input ->
            ( { model
                | idOrName =
                    if trim input == "" then
                        Nothing
                    else
                        Just input
              }
            , Cmd.none
            )

        GetClicked ->
            ( model
            , case model.idOrName of
                Nothing ->
                    Cmd.none

                Just idOrName ->
                    Cmd.map PokeApiMsg <|
                        PokeApi.getPokemon
            )

        PokeApiMsg (LoadPokemon (Ok pokemon)) ->
            ( { model | pokemon = Just pokemon }, Cmd.none )

        PokeApiMsg (LoadPokemon (Err err)) ->
            let
                _ =
                    Debug.log "error" err
            in
                ( { model | pokemon = Nothing }, Cmd.none )


view : Model -> Html Msg
view model =
    div
        []
        [ viewInput model ]


viewInput : Model -> Html Msg
viewInput model =
    div
        [ style
            [ ( "display", "flex" )
            , ( "margin", "15px" )
            , ( "padding", "10px" )
            , ( "justify-content", "space-around" )
            ]
        ]
        [ div
            [ style
                [ ( "margin", "auto" ) ]
            ]
            [ input
                [ onInput EditIdOrName
                , style
                    [ ( "padding", "8px" )
                    , ( "font-size", "1.2em" )
                    ]
                , placeholder "Pokemon id or name"
                ]
                []
            , button
                [ style
                    [ ( "padding", "8px" )
                    , ( "font-size", "1.2em" )
                    ]
                , onClick GetClicked
                ]
                [ text "Get" ]
            ]
        ]
