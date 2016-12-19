module Main exposing (..)

import Html exposing (programWithFlags, div, text, button, h2)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import View

type alias Flags = {
  initial : Int
}

main : Program Flags Model Msg
main =
  programWithFlags
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL


type alias Model = Int

init : Flags -> (Model, Cmd msg)
init flags =
  (flags.initial, Cmd.none)


-- UPDATE


type Msg = Increment | Decrement

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      (model + 1, Cmd.none)

    Decrement ->
      (model + 1, Cmd.none)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    []


-- VIEW

boxStyle : List ( String, String )
boxStyle =
  [ ("border", "1px solid #ccc")
  , ("border-radius", "4px")
  , ("padding", "10px")
  , ("margin", "10px")
  ]

view : Model -> Html.Html Msg
view model =
  div []
    [ div [ style boxStyle ]
        [ View.view ]
    , div [ style boxStyle ]
        [ h2 [] [ text "Counter" ]
        , button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]
    ]