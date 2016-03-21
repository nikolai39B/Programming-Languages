;
; Will Hauber
; Homework 5
; 03/21/16
;

#lang racket
(require racklog)
(provide (all-defined-out))

; Facts
(define %male
  (%rel ()
        [('Phil)]
        [('Edward)]
        [('Ralph)]
        [('Nate)]
        [('Pete)]
        [('Neil)]
        [('Tim)]
        [('Jim)]
        [('Jordan)]
        [('Aaron)]
        )
  )

(define %female
  (%rel ()
        [('Beth)]
        [('Sarah)]
        [('Autumn)]
        [('Diana)]
        [('Kate)]
        [('Aidy)]
        [('Leslie)]
        [('Laura)]
        [('Amy)]
        [('Maria)]
        [('Sasha)]
        )
  )

(define %parent
  (%rel ()
        [('Phil 'Edward)]
        [('Beth 'Edward)]
        [('Pete 'Kate)]
        [('Diana 'Kate)]
        [('Edward 'Ralph)]
        [('Edward 'Autumn)]
        [('Edward 'Neil)]
        [('Kate 'Ralph)]
        [('Kate 'Autumn)]
        [('Kate 'Neil)]
        [('Jim 'Laura)]
        [('Jim 'Jordan)]
        [('Amy 'Laura)]
        [('Amy 'Jordan)]
        [('Sarah 'Nate)]
        [('Ralph 'Nate)]
        [('Neil 'Aidy)]
        [('Neil 'Tim)]
        [('Neil 'Leslie)]
        [('Laura 'Aidy)]
        [('Laura 'Tim)]
        [('Laura 'Leslie)]
        [('Jordan 'Aaron)]
        [('Jordan 'Sasha)]
        [('Maria 'Aaron)]
        [('Maria 'Sasha)]
        )
  )

(define %spouse
  (%rel ()
        [('Phil 'Beth)]
        [('Beth 'Phil)]
        [('Pete 'Diana)]
        [('Diana 'Pete)]
        [('Edward 'Kate)]
        [('Kate 'Edward)]
        [('Jim 'Amy)]
        [('Amy 'Jim)]
        [('Sarah 'Ralph)]
        [('Ralph 'Sarah)]
        [('Neil 'Laura)]
        [('Laura 'Neil)]
        [('Jordan 'Maria)]
        [('Maria 'Jordan)]
        )
  )

; Rules
(define %husband
  (%rel (husband wife)
        [(husband wife)
         (%spouse husband wife)
         (%male husband)
         ]
        )
  )

(define %wife
  (%rel (wife husband)
        [(wife husband)
         (%spouse wife husband)
         (%female wife)
         ]
        )
  )

(define %sibling
  (%rel (sibling1 sibling2)
        [(sibling1 sibling2)
         (%/==
          (%which (parent) (%and (%parent parent sibling1) (%parent parent sibling2)))
          #f
          )
         (%/==
          sibling1
          sibling2)
         ]
        )
  )

(define %brother
  (%rel (brother sibling)
        [(brother sibling)
         (%sibling brother sibling)
         (%male brother)
         ]
        )
  )

(define %sister
  (%rel (sister sibling)
        [(sister sibling)
         (%sibling sister sibling)
         (%female sister)
         ]
        )
  )

(define %father
  (%rel (father child)
        [(father child)
         (%parent father child)
         (%male father)
         ]
        )
  )

(define %mother
  (%rel (mother child)
        [(mother child)
         (%parent mother child)
         (%female mother)
         ]
        )
  )

(define %son
  (%rel (son parent)
        [(son parent)
         (%parent parent son)
         (%male son)
         ]
        )
  )

(define %daughter
  (%rel (daughter parent)
        [(daughter parent)
         (%parent parent daughter)
         (%female daughter)
         ]
        )
  )

(define %cousin
  (%rel (cousin1 cousin2)
        [(cousin1 cousin2)
         (%/==
          (%which (parent1 parent2) (%and
                                     (%parent parent1 cousin1)
                                     (%parent parent2 cousin2)
                                     (%sibling parent1 parent2)
                                     ))
          #f
          )
         ]
        )
  )

(define %grandparent
  (%rel (grandparent grandchild)
        [(grandparent grandchild)
         (%/==
          (%which (parent) (%and
                            (%parent grandparent parent)
                            (%parent parent grandchild)
                            )
                  )
          #f
          )
         ]
        )
  )

(define %greatgrandparent
  (%rel (%greatgrandparent greatgrandchild)
        [(%greatgrandparent greatgrandchild)
         (%/==
          (%which (parent) (%and
                            (%grandparent %greatgrandparent parent)
                            (%parent parent greatgrandchild)
                            )
                  )
          #f
          )
         ]
        )
  )

; inlaw is defined as mother-in-law, father-in-law, brother-in-law, or sister-in-law
(define %inlaw
  (%rel (inlaw person)
        [(inlaw person)
         (%/==
          (%which (intermediate)
                  (%and
                   (%spouse person intermediate)
                   (%or
                    (%parent inlaw intermediate)
                    (%sibling inlaw intermediate)
                    )
                   )
                  )
          #f
          )
         ]
        )
  )

(define %niece
  (%rel (niece relative)
        [(niece relative)
         (%/==
          (%which (parent)
                  (%and
                   (%parent parent niece)
                   (%sibling parent relative)
                   )
                  )
          #f
          )
         (%female niece)
         ]
        )
  )

(define %nephew
  (%rel (nephew relative)
        [(nephew relative)
         (%/==
          (%which (parent)
                  (%and
                   (%parent parent nephew)
                   (%sibling parent relative)
                   )
                  )
          #f
          )
         (%male nephew)
         ]
        )
  )