--Imports

--Base
import XMonad
import System.Directory
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)

--Utilities
import XMonad.Util.Dmenu
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Util.Dmenu

--Data
import Data.Char (isSpace, toUpper)
import Data.Maybe (fromJust)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

myModMask :: KeyMask
myModMask = mod4Mask

myTerminal :: String
myTerminal = "kitty"

myEditor :: String
myEditor = "vim"

myBorderWidth :: Dimension
myBorderWidth = 5             --Sets Bordercolor for Windows

myNormColor :: String
myNormColor = "#960808"

myFocusColor :: String
myFocusColor = "#707070"


--Startup Hooks
myStartupHook :: X ()
myStartupHook = do
           spawnOnce "nitrogen --restore &"
           spawnOnce "picom &"

--Keybindings
myKeys =
    --Start Software
             [ ((mod4Mask, xK_f),spawn "firefox") --opens firefox

    --System Commands
             , ((mod4Mask .|. shiftMask, xK_F4), spawn "sudo shutdown -h now") --window key + Shift + F4 = shutdown
             
    --Xmonad
             , ((mod4Mask .|. shiftMask, xK_r), spawn "xmonad --recompile") --Recompile xmonad
             , ((mod4Mask .|. controlMask, xK_r), spawn "xmonad --restart")  --Restart xmonad
             ] 


main :: IO ()
main = do
      --xmproc <- spawnPipe ("kitty")
      xmonad $ defaultConfig
         { modMask             = mod4Mask
         ,terminal             = myTerminal
         ,startupHook          = myStartupHook
         ,borderWidth          = myBorderWidth
         ,normalBorderColor    = myNormColor
         ,focusedBorderColor   = myFocusColor
         } `additionalKeys`  myKeys
          
