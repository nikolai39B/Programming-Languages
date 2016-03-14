#lang racket
(require racklog)

(define %knows
  (%rel ()
        [('Odysseus 'TeX)]
        [('Odysseus 'Racket)]
        [('Odysseus 'Prolog)]
        [('Odysseus 'Penelope)]
        [('Penelope 'TeX)]
        [('Penelope 'Prolog)]
        [('Penelope 'Odysseus)]
        [('Telemachus 'TeX)]
        [('Telemachus 'calculus)]
        )
  )

(%which ()
        (%knows 'Odysseus 'TeX)
        )

(define %factorial
  (%rel (x y x1 y1)
    [(0 1) !]
    [(x y) (%is x1 (- x 1))
           (%factorial x1 y1)
           (%is y (* y1 x))]))
