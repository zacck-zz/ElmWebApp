-- Declare a module named Main exposing  everthing
module Main exposing (..)
-- Import the html module and div, textm program functions from it
import Html exposing (Html, button, div, text, program)
import Html.Events exposing(onClick)


-- MODEL
-- This is our application model we can use this later for the data layer?
type alias Model =
    Bool
--define an init function this provides the initial input for the application
-- Html.program expects a tuple  the first item being our intial state
-- the sedond element being the command to run
init : ( Model, Cmd Msg )
init =
    ( False, Cmd.none )



-- MESSAGES
-- think of these as lifecycle hooks
-- these are things that our application responds to in this case we don't do anything so we ..
-- have a message name NoOp.
type Msg
--    = NoOp
    = Expand
    | Collapse


-- VIEW
-- This is a function that renders an HTml element using our application model
-- the type signature Html Msg means this will produce messages  tagged with Msg
view : Model -> Html Msg
view model =
--    div []
--        [ text model ]
    if model then
        div []
            [button [onClick Collapse] [text "Collapse"]
            , text "Widget"
            ]
    else
        div []
            [button [onClick Expand][text "Expand"]]



-- UPDATE
-- this function will be called by Html.program each time a message is receiced
-- it responds to messages updating the model and returning commands as needed
-- here we respond to Noop and return no command to perform
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
--        NoOp ->
--            ( model, Cmd.none )

        Expand ->
            ( True, Cmd.none )

        Collapse ->
            ( False, Cmd.none)



-- SUBSCRIPTIONS
-- We use subsriptions to listen to external input, Browser location change, keyboard events,
-- mouse movements In our case we are not taking in any external input so we use sub.none
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN
-- Here Html.progra wires everything together and returns an html element  that we can render on our page
-- the program takes out init,view, update and subsriptions
-- this returns a html element rendered to the dom
main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
