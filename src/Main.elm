-- Declare a module named Main exposing  everthing
module Main exposing (..)
-- Import the html module and div, textm program functions from it
import Html exposing (Html, div, text, program)


-- MODEL
-- This is our application model we can use this later for the data layer?
type alias Model =
    String
--define an init function this provides the initial input for the application
-- Html.program expects a tuple  the first item being our intial state
-- the sedond element being the command to run
init : ( Model, Cmd Msg )
init =
    ( "Hello World", Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
