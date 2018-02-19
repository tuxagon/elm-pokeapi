module BasicChain exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Decode exposing (decodeString)
import PokeApi exposing (..)
import PokeApi.Decoders exposing (decodeNotFound)
import PokeApi.Tasks exposing (..)
import Task exposing (Task)


main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    Maybe NotFound


init =
    ( Nothing, Cmd.none )


type Msg
    = Clicked
    | Received (Result Http.Error Gender)


update msg model =
    case msg of
        Clicked ->
            ( model
            , getGenderBy (idOf 567)
                |> Task.attempt Received
            )

        Received (Ok model) ->
            ( Nothing, Cmd.none )

        Received (Err (BadStatus resp)) ->
            let
                newModel =
                    case decodeString decodeNotFound resp.body of
                        Ok notFound ->
                            Just notFound

                        Err err ->
                            let
                                _ =
                                    Debug.log "error decode " err
                            in
                                Nothing
            in
                ( newModel, Cmd.none )

        Received (Err err) ->
            let
                _ =
                    Debug.log "error " err
            in
                ( Nothing, Cmd.none )


view model =
    div []
        [ text "works"
        , button [ onClick Clicked ] [ text "click" ]
        ]
