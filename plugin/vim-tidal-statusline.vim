" plugin/tidalcycles.vim
if exists('g:loaded_tidalcycles_plugin')
  echo 'Already Loaded plugin/vim-tidalcycles-statusline.vim'
  finish
endif
echo 'Loading plugin/vim-tidalcycles-statusline.vim'
let g:loaded_tidalcycles_plugin = 1

" Define the function that updates the statusline
function! TidalCyclesStatus()
  " Read data from the file where tidal information is stored
  if filereadable('/tmp/tidal_data.txt')
    let cycle_info = readfile('/tmp/tidal_data.txt')

    " Parse the cycle number, CPS, and BPM
    let wave_number = str2nr(cycle_info[0])
    let cps = cycle_info[1]
    let bpm = cycle_info[2]

    " Calculate the next waves divisible by 8, 16, and 32
    let next8 = (wave_number + (8 - (wave_number % 8)))
    let next16 = (wave_number + (16 - (wave_number % 16)))
    let next32 = (wave_number + (32 - (wave_number % 32)))

    " Return formatted statusline string
    return 'Wave: '.wave_number.' Next(8/16/32): '.next8.'/'.next16.'/'.next32.' CPS: '.cps.' BPM: '.bpm
  else
    return 'TidalCycles: No Data'
  endif
endfunction

" Set up the statusline to call the TidalCyclesStatus function
set statusline=%!TidalCyclesStatus()

" Optional: set up a timer to refresh status line regularly
" Uncomment the following if you want periodic refresh:
autocmd CursorHold * redrawstatus

echo 'Successfully Loaded plugin/vim-tidalcycles-statusline.vim'
