module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


-- APP


main : Program Never
main =
    App.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { name : String
    , description : String
    }


model : Model
model =
    Model "" ""



-- UPDATE


type Msg
    = Name String
    | Description String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Description description ->
            { model | description = description }



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ Html.form
            [ class "form-horizontal" ]
            [ h1 [ class "text-center" ] [ text "Dyform" ]
            , div [ class "form-group" ]
                [ label [ for "name" ] [ text "Name" ]
                , input [ id "name", type' "text", class "form-control", onInput Name ] []
                ]
            , div [ class "form-group" ]
                [ label [ for "description" ] [ text "Description" ]
                , input [ id "description", type' "text", class "form-control", onInput Description ] []
                ]
            , button [ class "btn btn-primary" ] [ text "Submit" ]
            ]
        ]
