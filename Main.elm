module Main exposing (..)

import Html exposing (text, div, a)
import Html.Attributes exposing (style, href)
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
    div [style [("text-align", "center")]]
        [ div [ style [ ("display", "inline-block"), ( "height", "192px" ), ( "width", "192px" ), ( "background", "url(/pumpkin.png)  " ++ toString model ++ "px 0" ) ] ] []
        , div [] [ text "Press spacebar a few times" ]
        , div [] [ a [href "https://github.com/nwjlyons/pumpkin"] [text "github"]  ]
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
