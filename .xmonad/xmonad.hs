import XMonad
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Util.Run 
import qualified Data.HashTable.IO as H

import System.IO
import Graphics.X11.ExtraTypes.XF86

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/michalparusinski/.xmobarrc"
    pidHashTable <- H.new :: IO(H.BasicHashTable Int Window)
    windowHashTable <- H.new :: IO(H.BasicHashTable Window Int)
    xmonad $ docks defaultConfig 
        { modMask = myModMask
        , terminal = myTerminal
            , borderWidth = myBorderWidth
            , workspaces = myWorkspaces
            , manageHook = myManageHook
            , normalBorderColor = myNormBordCol
            , focusedBorderColor = myFocuBordCol
            , layoutHook = smartBorders(avoidStruts $ layoutHook defaultConfig)
            , handleEventHook = handleEventHook defaultConfig <+> swallowEventHook pidHashTable windowHashTable <+> fullscreenEventHook <+> docksEventHook
            , logHook = dynamicLogWithPP xmobarPP 
            { ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "#c6c8d1" "" . shorten 50
                    , ppCurrent = xmobarColor "#84a0c6" "" . wrap "[" "]"
                    , ppHiddenNoWindows = wrap "" ""
                    , ppHidden = xmobarColor "#89b8c2" "" . wrap "" ""
                    , ppWsSep = " | "
            }
            -- more changes
        } `additionalKeys` myKeys	

myTerminal    = "kitty"
myBar	      = "xmobar"
myModMask     = mod4Mask -- Use Super instead of Alt
myBorderWidth = 3
myWorkspaces  = map show $ take 10 [1..]
myNormBordCol = "#d4d6e1"
myFocuBordCol = "#478dad"
myManageHook  = composeAll [
    manageDocks,
    isFullscreen --> doFullFloat,
    manageHook defaultConfig ]

myKeys =
    [ ((0, xF86XK_AudioRaiseVolume	), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    , ((0, xF86XK_AudioLowerVolume	), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ((0, xF86XK_AudioMute		), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((0, xF86XK_MonBrightnessUp	), spawn "xbacklight -display intel_backlight -inc 10")
    , ((0, xF86XK_MonBrightnessDown	), spawn "xbacklight -display intel_backlight -dec 10")
    , ((myModMask .|. shiftMask, xK_f), sendMessage ToggleStruts)
    , ((myModMask .|. shiftMask, xK_q), spawn "~/.local/bin/dmenupower")
    , ((myModMask , xK_y), runInTerm "" "neomutt")
    , ((myModMask , xK_u), spawn "firefox") 
    , ((myModMask .|. shiftMask, xK_u), spawn "firefox -P") ]

