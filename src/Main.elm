module Main exposing (..)

import Browser
import Html exposing (Html, button, div, h1, h2, h3, hr, img, input, label, p, span, text)
import Html.Attributes exposing (class, src, style, type_, value)
import Html.Events exposing (onClick, onInput)
import String exposing (fromFloat, toFloat)



---- MODEL ----


type alias Model =
    { tempC : String
    , tempF : String
    , lengthM : String
    , lengthF : String
    , weightK : String
    , weightL : String
    }


init : Model
init =
    { tempC = ""
    , tempF = "---"
    , lengthM = ""
    , lengthF = "---"
    , weightK = ""
    , weightL = "---"
    }



---- UPDATE ----


type Msg
    = SetTemp String
    | IncTemp
    | DecTemp
    | SetLength String
    | IncLength
    | DecLength
    | SetWeight String
    | IncWeight
    | DecWeight


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
            let
                ( intF, intC ) =
                    case String.toFloat model.tempC of
                        Just f ->
                            ( String.fromFloat ((f + 1) * 1.8 + 32), String.fromFloat (f + 1) )

                        Nothing ->
                            ( "---", model.tempC )
            in
            { model | tempC = intC, tempF = intF }

        DecTemp ->
            let
                ( intF, intC ) =
                    case String.toFloat model.tempC of
                        Just f ->
                            ( String.fromFloat ((f - 1) * 1.8 + 32), String.fromFloat (f - 1) )

                        Nothing ->
                            ( "---", model.tempC )
            in
            { model | tempC = intC, tempF = intF }

        SetLength c ->
            let
                intLength =
                    case String.toFloat c of
                        Just f ->
                            String.fromFloat (f * 3.281)

                        Nothing ->
                            "---"
            in
            { model | lengthM = c, lengthF = intLength }

        IncLength ->
            let
                ( intF, intC ) =
                    case String.toFloat model.lengthM of
                        Just f ->
                            ( String.fromFloat ((f + 1) * 3.281), String.fromFloat (f + 1) )

                        Nothing ->
                            ( "---", model.lengthM )
            in
            { model | lengthM = intC, lengthF = intF }

        DecLength ->
            let
                ( intF, intC ) =
                    case String.toFloat model.lengthM of
                        Just f ->
                            ( String.fromFloat ((f - 1) * 3.281), String.fromFloat (f - 1) )

                        Nothing ->
                            ( "---", model.lengthM )
            in
            { model | lengthM = intC, lengthF = intF }

        SetWeight c ->
            let
                intWeight =
                    case String.toFloat c of
                        Just f ->
                            String.fromFloat (f * 2.205)

                        Nothing ->
                            "---"
            in
            { model | weightK = c, weightL = intWeight }

        IncWeight ->
            let
                ( intF, intC ) =
                    case String.toFloat model.weightK of
                        Just f ->
                            ( String.fromFloat ((f + 1) * 2.205), String.fromFloat (f + 1) )

                        Nothing ->
                            ( "---", model.weightK )
            in
            { model | weightK = intC, weightL = intF }

        DecWeight ->
            let
                ( intF, intC ) =
                    case String.toFloat model.weightK of
                        Just f ->
                            ( String.fromFloat ((f - 1) * 2.205), String.fromFloat (f - 1) )

                        Nothing ->
                            ( "---", model.weightK )
            in
            { model | weightK = intC, weightL = intF }



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
                            [ class "button is-warning"
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
                        , button [ class "button is-success", onClick IncTemp ] [ text "+" ]
                        ]
                    , hr [] []
                    , label [ class "label" ] [ text "Temperature in Farenheit" ]
                    , p [ class "has-text-centered" ] [ text (model.tempF ++ " F") ]
                    ]
                ]
            , div [ class "column box" ]
                [ h3 [ class "title is-3 has-text-centered " ] [ text "Length converter" ]
                , div []
                    [ label [ class "label" ] [ text "Length in meter" ]
                    , div [ class "has-text-centered" ]
                        [ button
                            [ class "button is-warning"
                            , style "margin-right" "10px"
                            , onClick DecLength
                            ]
                            [ text "-" ]
                        , input
                            [ type_ "text"
                            , value model.lengthM
                            , class "input control"
                            , style "width" "50%"
                            , style "margin-right" "10px"
                            , onInput SetLength
                            ]
                            []
                        , button [ class "button is-success", onClick IncLength ] [ text "+" ]
                        ]
                    , hr [] []
                    , label [ class "label" ] [ text "Length in feet" ]
                    , p [ class "has-text-centered" ] [ text (model.lengthF ++ " ft") ]
                    ]
                ]
            , div [ class "column box", style "margin-bottom" "1.5rem" ]
                [ h3 [ class "title is-3 has-text-centered" ] [ text "Weight converter" ]
                , div []
                    [ label [ class "label" ] [ text "Weight in kg" ]
                    , div [ class "has-text-centered" ]
                        [ button
                            [ class "button is-warning"
                            , style "margin-right" "10px"
                            , onClick DecWeight
                            ]
                            [ text "-" ]
                        , input
                            [ type_ "text"
                            , value model.weightK
                            , class "input control"
                            , style "width" "50%"
                            , style "margin-right" "10px"
                            , onInput SetWeight
                            ]
                            []
                        , button [ class "button is-success", onClick IncWeight ] [ text "+" ]
                        ]
                    , hr [] []
                    , label [ class "label" ] [ text "Weight in pounds" ]
                    , p [ class "has-text-centered" ] [ text (model.weightL ++ " lbs") ]
                    ]
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
