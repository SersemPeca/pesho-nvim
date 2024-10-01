(fn config []
  (let [dk (require :def-keymaps)
        opts {:use-global-binary true
              :max-size          30
              :max-width         40
              :split-location    :vertical
              :agda-prefix       ","
              :no-agda-input     1}]
    ;;; Set options
    (each [k v (pairs opts)]
      (tset vim.g
            (.. :cornelis_ (k:gsub "-" "_"))
            v))

    ;;; Set easy-align options
    (tset _G :easy_align_delimiters
          {:r {:pattern      "[≤≡≈∎]"
               :left_margin  2
               :right_margin 0}})

    ;;; Mappings
    (vim.api.nvim_create_autocmd
      [:BufRead
       :BufNewFile]
      {:pattern [:*.agda]
       :callback
         #(do (dk [:n]
                  {:a {:name :Agda
                       :l  [":CornelisLoad<CR>" :Load]
                       :r  [":CornelisRefine<CR>" :Refine]
                       :d  [":CornelisMakeCase<CR>" :MakeCase]
                       "," [":CornelisTypeContext<CR>" :TypeContext]
                       "." [":CornelisTypeContextInfer<CR>" :TypeContextInfer Normalised]
                       :n  [":CornelisSolve<CR>" :Solve]
                       :a  [":CornelisAuto<CR>" :Auto]}}
                  {:prefix :<leader>})
              (dk [:n]
                  {:gd  [":CornelisGoToDefinition<CR>" :Definition]
                   "[/" [":CornelisPrevGoal<CR>" "Previous goal"]
                   "]/" [":CornelisNextGoal<CR>" "Next goal"]
                   "<C-A>" [":CornelisInc<CR>" :Increment]
                   "<C-X>" [":CornelisDec<CR>" :Decrement]})
              (vim.cmd "TSBufDisable highlight"))})))

{: config}
