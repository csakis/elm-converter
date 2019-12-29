module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, h2, h3, hr, img, input, label, p, span, text)
import Html.Attributes exposing (class, src, style, type_, value)
import Html.Events exposing (onClick, onInput)
import String exposing (fromFloat, toFloat)



---- MODEL ----


type alias Model =
    { tempC : String
    , newTempC : String
    , tempF : String
    }


init : Model
init =
    { tempC = ""
    , newTempC = "0"
    , tempF = "0"
    }



---- UPDATE ----


type Msg
    = SetTemp String
    | IncTemp
    | DecTemp


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetTemp c ->
            let
                intTemp =
                    case String.toFloat c of
                        Just f ->
                            String.fromFloat (f * 1.8 + 32)

                        Nothing ->
                            "---"
            in
            { model | tempC = c, tempF = intTemp }

        IncTemp ->
            model

        DecTemp ->
            model



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "section" ]
        [ div [ class "container", style "margin-top" "25px" ]
            [ h1 [ class "title is-1 has-text-centered" ] [ text "Elm Unit converter" ]
            ]
        , div [ class "columns is-centered", style "margin-top" "20px" ]
            [ div [ class "column box" ]
                [ h3 [ class "title is-3" ] [ text "Temperature converter" ]
                , div []
                    [ label [ class "label" ] [ text "Temperature in Celsius" ]
                    , div [ class "has-text-centered" ]
                        [ button
                            [ class "button is-primary is-light"
                            , style "margin-right" "10px"
                            , onClick DecTemp
                            ]
                            [ text "-" ]
                        , input
                            [ type_ "text"
                            , value model.tempC
                            , class "input control"
                            , style "width" "50%"
                            , style "margin-right" "10px"
                            , onInput SetTemp
                            ]
                            []
                        , button [ class "button is-secondary is-light control", onClick IncTemp ] [ text "+" ]
                        ]
                    , hr [] []
                    , label [ class "label" ] [ text "Temperature in Farenheit" ]
                    , p [ class "has-text-centered" ] [ text model.tempF ]
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
