module Main exposing (..)

import Html exposing (text, div)
import Html.Attributes exposing (style)
import Html.App exposing (program)
import Keyboard


main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


init =
    ( 0, Cmd.none )


type Msg
    = Up
    | Down


model =
    0


view model =
    div []
        [ div [ style [ ( "height", "192px" ), ( "width", "192px" ), ( "background", "url(/pumpkin.png)  " ++ toString model ++ "px 0" ) ] ] []
        , div [] [ text "Press spacebar a few times" ]
        ]


update msg model =
    case msg of
        Up ->
            ( 192, Cmd.none )

        Down ->
            ( 0, Cmd.none )


subscriptions model =
    Sub.batch [ Keyboard.downs (onKeyDown model) ]


onKeyDown model key =
    case key of
        32 ->
            if model == 0 then
                Up
            else
                Down

        _ ->
            Down
