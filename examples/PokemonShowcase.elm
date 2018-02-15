module PokemonShowcase exposing (..)

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
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    Element.viewport stylesheet <|
        column None
            []
            [ el None [] (text "hello")
            ]
