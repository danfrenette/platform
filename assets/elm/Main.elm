module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


type alias Model =
    { gamesList : List Game
    , displayGamesList : Bool
    }


type alias Game =
    { gameTitle : String
    , gameDescription : String
    }


initialModel : Model
initialModel =
    { gamesList =
        [ { gameTitle = "Platformer", gameDescription = "Platformer example" }
        , { gameTitle = "RPG", gameDescription = "RPG example" }
        ]
    , displayGamesList = False
    }


type Msg
    = DisplayGamesList
    | HideGamesList


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DisplayGamesList ->
            ( { model | displayGamesList = True }, Cmd.none )

        HideGamesList ->
            ( { model | displayGamesList = False }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ h1 [ class "games-section" ] [ text "Games" ]
        , button [ class "btn btn-success" ] [ text "Display Games List" ]
        , button [ class "btn btn-danger" ] [ text "Hide Games List" ]
        , gamesIndex model
        ]


gamesIndex : Model -> Html msg
gamesIndex model =
    div [ class "games-index" ] [ gamesList model.gamesList ]


gamesList : List Game -> Html msg
gamesList games =
    ul [ class "games-list" ] (List.map gamesListItem games)


gamesListItem : Game -> Html msg
gamesListItem game =
    li [ class "game-item" ]
        [ strong [] [ text game.gameTitle ]
        , p [] [ text game.gameDescription ]
        ]
