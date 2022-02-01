--Imports

--Base
import XMonad

--Utilities
import XMonad.Util.Dmenu
import XMonad.Util.Run
import XMonad.Util.SpawnOnce


main = xmonad $ defaultConfig
         { modMask = mod4Mask
         , terminal = "kitty ~"
         }

myStartupHook = do
           spawnOnce "nitrogen --restore &"
           spawnOnce "picom &"
