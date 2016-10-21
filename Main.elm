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
    ( Down, Cmd.none )


type Pos
    = Up
    | Down


type Msg
    = Toggle
    | NoOp


view model =
    let
        xPos =
            case model of
                Up ->
                    192

                Down ->
                    0
    in
        div [ style [ ( "text-align", "center" ) ] ]
            [ div [ style [ ( "display", "inline-block" ), ( "height", "192px" ), ( "width", "192px" ), ( "background", "url(/pumpkin.png)  " ++ toString xPos ++ "px 0" ) ] ] []
            , div [] [ text "Press spacebar a few times" ]
            , div [] [ a [ href "https://github.com/nwjlyons/pumpkin" ] [ text "github" ] ]
            ]


update msg model =
    case msg of
        Toggle ->
            case model of
                Up ->
                    ( Down, Cmd.none )

                Down ->
                    ( Up, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


subscriptions model =
    Sub.batch [ Keyboard.downs (onKeyDown model) ]


onKeyDown model key =
    case key of
        32 ->
            Toggle

        _ ->
            NoOp
