module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (class, src)



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
    div [ class "container" ]
        [ h1 [] [ text "Elm Unit converter" ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.sandbox
        {init = init
        , view = view
        , update = update
        }
