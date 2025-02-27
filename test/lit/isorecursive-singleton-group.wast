;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.

;; RUN: wasm-opt %s -all -S -o - | filecheck %s
;; RUN: wasm-opt %s -all --roundtrip -S -o - | filecheck %s

;; Check that everything works correctly when a recursion group has only a
;; single member. The rec group is implicit, so does not need to be printed.

(module


 (rec
  ;; CHECK:      (type $singleton (sub (struct )))
  (type $singleton (struct_subtype data))
 )

 ;; Use the type so it appears in the output.
 ;; CHECK:      (global $g (ref null $singleton) (ref.null none))
 (global $g (ref null $singleton) (ref.null $singleton))
)
