;
; Will Hauber
; Homework 5 Queries
; 03/21/16
;

#lang racket
(require racklog)
(require "Hauber_hw5.rkt")
(provide (all-defined-out))

; %male
(println "%male")
(println (equal? (%which () (%male 'Phil)) '()))
(println (equal? (%which () (%male 'Beth)) #f))

; %female
(println "%female")
(println (equal? (%which () (%female 'Phil)) #f))
(println (equal? (%which () (%female 'Beth)) '()))

; %parent
(println "%parent")
(println (equal? (%which () (%parent 'Phil 'Edward)) '()))
(println (equal? (%which () (%parent 'Phil 'Ralph)) #f))
(println (equal? (%which () (%parent 'Ralph 'Edward)) #f))

; %spouse
(println "%spouse")
(println (equal? (%which () (%spouse 'Phil 'Beth)) '()))
(println (equal? (%which () (%spouse 'Beth 'Phil)) '()))
(println (equal? (%which () (%spouse 'Beth 'Neil)) #f))

; %husband
(println "%spouse")
(println (equal? (%which () (%husband 'Phil 'Beth)) '()))
(println (equal? (%which () (%husband 'Beth 'Phil)) #f))

; %wife
(println "%wife")
(println (equal? (%which () (%wife 'Phil 'Beth)) #f))
(println (equal? (%which () (%wife 'Beth 'Phil)) '()))

; %sibling
(println "%sibling")
(println (equal? (%which () (%sibling 'Aidy 'Tim)) '()))
(println (equal? (%which () (%sibling 'Beth 'Ralph)) #f))

; %brother
(println "%brother")
(println (equal? (%which () (%brother 'Tim 'Aidy)) '()))
(println (equal? (%which () (%brother 'Aidy 'Tim)) #f))

; %sister
(println "%sister")
(println (equal? (%which () (%sister 'Tim 'Aidy)) #f))
(println (equal? (%which () (%sister 'Aidy 'Tim)) '()))

; %father
(println "%father")
(println (equal? (%which () (%father 'Phil 'Edward)) '()))
(println (equal? (%which () (%father 'Beth 'Edward)) #f))

; %mother
(println "%mother")
(println (equal? (%which () (%mother 'Phil 'Edward)) #f))
(println (equal? (%which () (%mother 'Beth 'Edward)) '()))

; %son
(println "%son")
(println (equal? (%which () (%son 'Tim 'Laura)) '()))
(println (equal? (%which () (%son 'Aidy 'Laura)) #f))

; %daughter
(println "%daughter")
(println (equal? (%which () (%daughter 'Tim 'Laura)) #f))
(println (equal? (%which () (%daughter 'Aidy 'Laura)) '()))

; %cousin
(println "%cousin")
(println (equal? (%which () (%cousin 'Tim 'Aaron)) '()))
(println (equal? (%which () (%cousin 'Aaron 'Tim)) '()))
(println (equal? (%which () (%cousin 'Laura 'Tim)) #f))
(println (equal? (%which () (%cousin 'Aaron 'Nate)) #f))

; %grandparent
(println "%grandparent")
(println (equal? (%which () (%grandparent 'Kate 'Nate)) '()))
(println (equal? (%which () (%grandparent 'Diana 'Nate)) #f))

; %greatgrandparent
(println "%greatgrandparent")
(println (equal? (%which () (%greatgrandparent 'Kate 'Nate)) #f))
(println (equal? (%which () (%greatgrandparent 'Diana 'Nate)) '()))

; %inlaw
(println "%inlaw")
(println (equal? (%which () (%inlaw 'Kate 'Laura)) '()))
(println (equal? (%which () (%inlaw 'Edward 'Laura)) '()))
(println (equal? (%which () (%inlaw 'Autumn 'Laura)) '()))
(println (equal? (%which () (%inlaw 'Ralph 'Laura)) '()))
(println (equal? (%which () (%inlaw 'Neil 'Laura)) #f))
(println (equal? (%which () (%inlaw 'Laura 'Kate)) '()))
(println (equal? (%which () (%inlaw 'Laura 'Edward)) '()))
(println (equal? (%which () (%inlaw 'Laura 'Autumn)) '()))
(println (equal? (%which () (%inlaw 'Laura 'Ralph)) '()))
(println (equal? (%which () (%inlaw 'Laura 'Neil)) #f))

; %niece
(println "%niece")
(println (equal? (%which () (%niece 'Tim 'Ralph)) #f))
(println (equal? (%which () (%niece 'Aidy 'Ralph)) '()))

; %nephew
(println "%nephew")
(println (equal? (%which () (%nephew 'Tim 'Ralph)) '()))
(println (equal? (%which () (%nephew 'Aidy 'Ralph)) #f))