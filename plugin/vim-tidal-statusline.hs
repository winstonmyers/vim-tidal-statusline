import Sound.Tidal.Context

-- TODO - Determine the right path for this...

let osc = OSC "/wave" ("/path/to/your/plugin") 6010 -- OSC port

stream <- startStream defaultConfig osc

-- Send wave and CPS info every cycle
stream $ every 1 (const $ do
  cycleNumber <- now
  cps <- getCps
  let bpm = cps * 60
  sendMessage osc (show cycleNumber, cps, bpm)
  ) $ sound "bd"

