module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, h2, h3, img, p, text)
import Html.Attributes exposing (class, src, style)



---- MODEL ----


type alias Model =
    {}


init : Model
init =
    {}



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "section" ]
        [ div [ class "container", style "margin-top" "25px" ]
            [ h1 [ class "title is-1 has-text-centered" ] [ text "Elm Unit converter" ]
            ]
        , div [ class "columns is-centered" ]
            [ div [ class "column box" ]
                [ h3 [ class "title is-3 has-text-centered" ] [ text "Temperature converter" ]
                ]
            , div [ class "column box" ]
                [ h3 [ class "title is-3 has-text-centered " ] [ text "Length converter" ]
                ]
            , div [ class "column box" ]
                [ h3 [ class "title is-3 has-text-centered" ] [ text "Weight converter" ]
                ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
