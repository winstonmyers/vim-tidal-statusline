" autoload/tidalcycles.vim

echo "Starting autoload/tidalcycles.vim"

" Function to run the Haskell script for TidalCycles
function! tidalcycles#RunTidalScript()
  " Full path to your Haskell script
  let cmd = "ghci " g:plug_home . '/vim-tidalcycles-status/get-tidal-status.hs'
  " Run the Haskell script in the background
  call system(cmd . ' &')
endfunction

" Function to enable the TidalCycles status line
function! tidalcycles#EnableTidalStatus()
  setlocal statusline=%!TidalCyclesStatus()
endfunction

" Function to disable the TidalCycles status line
function! tidalcycles#DisableTidalStatus()
  setlocal statusline=
endfunction

echo "Finishing autoload/tidalcycles.vim"
