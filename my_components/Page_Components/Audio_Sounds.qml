import QtQuick 2.15
import QtMultimedia 5.15

Audio {
    id: player_Audio
    source: "qrc:/sounds/keyboard.mp3"


    function play_symbol(){

       // player_Audio.stop()

       // player_Audio.play()
    }


    function play_delete_symbol(){

        player_Audio.stop()

        player_Audio.play()
    }

}
