;; ============================================
;; Bracket Matching para Smarty
;; ============================================

;; Delimitadores (simples y dobles)
("{" @open "}" @close)

;; Brackets estándar
("[" @open "]" @close)
("(" @open ")" @close)

;; Strings
("\"" @open "\"" @close)
("'" @open "'" @close)
