-- vim: ts=4:sw=4:et

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)

import System.IO
import Graphics.X11.ExtraTypes.XF86

main :: IO ()
main = do
    xmproc0 <- spawnPipe ("xmobar -x 0 $HOME/.config/xmobar/xmobarrc")
    xmproc1 <- spawnPipe ("xmobar -x 1 $HOME/.config/xmobar/xmobarrc")
    xmproc2 <- spawnPipe ("xmobar -x 2 $HOME/.config/xmobar/xmobarrc")
    xmonad $ ewmh $ docks $ defaultConfig
        { terminal           = "st"
        , modMask            = myModMask
        , manageHook         = myManageHook <+> manageHook defaultConfig
        , layoutHook         = myLayoutHook
        , logHook            = myLogHook [xmproc0, xmproc1, xmproc2]
        , borderWidth        = 2
        , workspaces         = myWorkspaces
        , normalBorderColor  = "#2E3440"
        , focusedBorderColor = "#BF616A"
        } `additionalKeys` myKeys

myModMask = mod4Mask

myWorkspaces = map show [1..9]

myLayoutHook = avoidStruts $ smartBorders $ tall ||| wide ||| full
    where tall = Tall 1 0.03 0.5
          wide = Mirror tall
          full = Full

myLogHookSingle xmproc =  dynamicLogWithPP xmobarPP
    { ppOutput = hPutStrLn xmproc
    , ppTitle = xmobarColor "green" "" . shorten 50
    }

myLogHook xmprocs = mapM_ myLogHookSingle xmprocs

myManageHook :: ManageHook
myManageHook = composeAll $
    [ isFullscreen --> doFullFloat
    , manageDocks
    ] 

myKeys :: [((KeyMask, KeySym), X ())]
myKeys = 
    [ ((0, xF86XK_AudioRaiseVolume),   spawn "volumeup")
    , ((0, xF86XK_AudioLowerVolume),   spawn "volumedown")
    , ((0, xF86XK_AudioMute),          spawn "volumemute")
    , ((0, xF86XK_MonBrightnessUp),    spawn "brightup")
    , ((0, xF86XK_MonBrightnessDown),  spawn "brightdown")
    , ((myModMask, xK_b),              sendMessage ToggleStruts) 
--    , ((mod4Mask .|. shiftMask, xK_q), spawn "dpower")
    ]
