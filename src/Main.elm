module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, h2, h3, img, input, label, p, text)
import Html.Attributes exposing (class, src, style, type_)
import Html.Events exposing (onClick, onInput)



---- MODEL ----


type alias Model =
    { tempC : String
    , newTempC : String
    , tempF : String
    }


init : Model
init =
    { tempC = ""
    , newTempC = ""
    , tempF = ""
    }



---- UPDATE ----


type Msg
    = SetTemp
    | IncTemp
    | DecTemp


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
                , div [ class "has-text-centered" ]
                    [ label [ class "label" ] [ text "Temperature in Celsius" ]
                    , div [ class "field " ]
                        [ button [ class "button is-primary is-light", style "margin-right" "10px", onClick DecTemp ] [ text "-" ]
                        , input [ type_ "text", class "input control", style "width" "50%", style "margin-right" "10px" ] []
                        , button [ class "button is-secondary is-light control", onClick IncTemp ] [ text "+" ]
                        ]
                    ]
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
