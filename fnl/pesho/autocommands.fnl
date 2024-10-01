(local group (vim.api.nvim_create_augroup
               :pesho-autocommands
               {:clear true}))

;; Terminal utilities
(vim.api.nvim_create_autocmd
  :TermOpen
  {:pattern :*
   : group
   :callback
     #(do
        (vim.keymap.set
          :t
          :<Esc>
          :<C-\><C-n>
          {:buffer true})
        (vim.cmd ":startinsert")
        (vim.cmd "setlocal listchars= nonumber norelativenumber"))})

