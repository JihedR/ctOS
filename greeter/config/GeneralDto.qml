import QtQuick
import Quickshell.Io

JsonObject {
    property string animations: "all"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property list<string> exitOverride: []
    property list<string> launchOverride: []
    property string monitor: ""

    // var, not a nested JsonObject: "class" can't be a QML property name
    property var fakeIdentity: ({
            "id": "ADM-843",
            "class": "L5_PROV",
            "fullName": "Blume Admin"
        })
    property var fakeStatus: ({
            "env": "Workstation",
            "node": "109.389.013.301"
        })

    component ModeSettings: JsonObject {
        /**
        * Animation Configuration:
        * 1. Defaulting to 'none' prevents reactive bindings from triggering
        * 'all' animations before the user config is fully loaded.
        * 2. This avoids "stuck" states where PropertyActions might move
        * elements to their starting positions (off-screen/invisible) and
        * stay there if animations are ultimately disabled by the config.
        * 3. Starting at 'none' ensures the layout remains in its final,
        * visible state until an animation is set to run.
        */
        property string animations: "none"
        property string monitor: ""
    }

    property JsonObject modes: JsonObject {
        property ModeSettings greetd: ModeSettings {}
        property ModeSettings lockd: ModeSettings {
            animations: "reduced"
        }
        property ModeSettings test: ModeSettings {}
        property ModeSettings kiosk: ModeSettings {}
    }
}
