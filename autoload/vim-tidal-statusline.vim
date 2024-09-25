" autoload/tidalcycles.vim

echo "Starting autoload/tidalcycles.vim"

" Function to run the Haskell and python scripts for TidalCycles
function! tidalcycles#RunTidalScripts()
  " Full path to your Haskell script
  let haskell_cmd = "ghci " g:plug_home . '/vim-tidal-statusline/plugin/vim-tidal-statusline.hs'
  " Run the Haskell script in the background
  call system(haskell_cmd . ' &')
  " Full path to the python script
  let python_cmd = "python3 " g:plug_home . '/vim-tidal-statusline/plugin/vim-tidal-statusline.py'
  " Run the Haskell script in the background
  call system(python_cmd . ' &')
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
