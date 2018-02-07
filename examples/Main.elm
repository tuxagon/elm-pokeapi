module Main exposing (..)

import Color exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Input as Input
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Maybe
import PokeApi exposing (..)
import String exposing (trim)
import Style
import Style.Color as Color
import Style.Font as Font


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
    , pokemon : Maybe PokeApi.NamedApiResourceList
    }


init : ( Model, Cmd Msg )
init =
    ( { idOrName = Nothing
      , pokemon = Nothing
      }
    , Cmd.map PokeApiListMsg <|
        PokeApi.get Pokemon_
    )


type Msg
    = EditIdOrName String
    | GetClicked
    | PokeApiListMsg PokeApi.ListMsg


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
                    Cmd.map PokeApiListMsg <|
                        PokeApi.get Pokemon_
            )

        PokeApiListMsg (Loaded Pokemon_ (Ok pokemon)) ->
            ( { model | pokemon = Just pokemon }, Cmd.none )

        PokeApiListMsg (Loaded Pokemon_ (Err err)) ->
            let
                _ =
                    Debug.log "error" err
            in
                ( { model | pokemon = Nothing }, Cmd.none )


view : Model -> Html Msg
view model =
    Element.viewport stylesheet <|
        column None
            [ padding 15
            ]
            [ h1 H1
                [ center
                , paddingTop 15
                , paddingBottom 30
                ]
                (text "Pokemon Example")
            , row None
                []
                [ Input.search None
                    [ center
                    , width (px 300)
                    , padding 8
                    ]
                    { onChange = EditIdOrName
                    , value =
                        Maybe.withDefault
                            ""
                            model.idOrName
                    , label =
                        Input.placeholder
                            { text = "Pokemon id or name"
                            , label = Input.hiddenLabel ""
                            }
                    , options = [ Input.focusOnLoad ]
                    }
                ]
            , column None
                [ center
                , paddingTop 25
                ]
                (case model.pokemon of
                    Nothing ->
                        []

                    Just data ->
                        List.map viewResource data.results
                )
            ]


viewResource : NamedApiResource -> Element Styles variation Msg
viewResource pokemon =
    text pokemon.name
