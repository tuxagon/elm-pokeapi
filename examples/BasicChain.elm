module BasicChain exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import PokeApi exposing (..)
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
    Maybe BerryFirmness


init =
    ( Nothing, Cmd.none )


type Msg
    = Clicked
    | Received (Result Http.Error BerryFirmness)


update msg model =
    case msg of
        Clicked ->
            ( model
            , getBerryBy (nameOf "pecha")
                |> Task.andThen
                    (\berry ->
                        getBerryFirmnessBy (urlOf berry.firmness.url)
                    )
                |> Task.attempt Received
            )

        Received (Ok model) ->
            ( Just model, Cmd.none )

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
