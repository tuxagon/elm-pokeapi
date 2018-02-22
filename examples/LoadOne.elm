module LoadAll exposing (..)

{-| You can replace the model name and it will pull every individual entry for
that resource
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import PokeApi exposing (..)
import PokeApi.Tasks exposing (..)
import Task exposing (..)


main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { resources : List (Result Http.Error Move)
    , urls : List String
    }


init : ( Model, Cmd Msg )
init =
    ( { resources = []
      , urls = []
      }
    , Cmd.none
    )


type Msg
    = TestAllClicked
    | ReceivedResource (Result Http.Error Move)
    | ReceivedList (Result Http.Error ApiResourceList)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        getResource url =
            getMoveBy (urlOf url)
                |> Task.attempt ReceivedResource
    in
        case msg of
            TestAllClicked ->
                ( { model | resources = [] }
                , getResourceList Move_ (onPageOfSize 1 200)
                    |> Task.attempt ReceivedList
                )

            ReceivedResource result ->
                ( { model | resources = result :: model.resources }, Cmd.none )

            ReceivedList (Ok list) ->
                ( model
                , Cmd.batch (List.map (getResource << .url) list.results)
                )

            ReceivedList (Err err) ->
                let
                    _ =
                        Debug.log " [[[LIST ERROR]]] " err
                in
                    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    let
        label_ str maybeList =
            String.concat
                [ str
                , " ("
                , Maybe.withDefault "0" <|
                    Maybe.map
                        (\value ->
                            case value of
                                Ok val ->
                                    (toString << List.length) val.results

                                Err _ ->
                                    "0"
                        )
                        maybeList
                , ")"
                ]
    in
        div
            []
            [ h1 [] [ text "Move" ]
            , ul [] (List.map viewLoadMove model.resources)
            , button [ onClick TestAllClicked ] [ text "Test All" ]
            ]


viewLoadMove : Result Http.Error Move -> Html msg
viewLoadMove result =
    li []
        [ case result of
            Err e ->
                span
                    [ style
                        [ ( "color", "red" ) ]
                    ]
                    [ text (toString e) ]

            Ok m ->
                span
                    [ style
                        [ ( "color", "green" ) ]
                    ]
                    [ text (toString m.id)
                    ]
        ]
