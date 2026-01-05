;; ============================================
;; Syntax Highlighting para Smarty
;; Basado en los nodos REALES del grammar
;; ============================================

;; Comentarios
(comment) @comment

;; Estructuras y elementos
(include) @function.call
(block) @function.call
(capture) @keyword
(call) @function.call
(function) @keyword
(literal) @keyword
(foreach) @keyword
(foreach_else) @keyword
(for) @keyword
(while) @keyword
(if) @keyword
(else_if) @keyword
(else) @keyword
(nocache) @keyword

;; Modificadores y parámetros
(modifier) @function.builtin
(parameter) @parameter

;; Todo lo demás es texto
(text) @string
