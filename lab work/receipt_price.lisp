(setq receipt '((пицца 20 1 250) (бургер 90 3 100) (шаурма 50 1 220)))

(defun price_with_sale (product)
; Функция для получения стоимости 1 продукта после скидки
    (if (EQ 0 (car (cdr product)))
        (car (cdr (cdr (cdr product))))
        (/ 
         (* 
          (car (cdr (cdr (cdr product)))) 
          (- 100 (car (cdr product)))) 
         100
         )
     )
)

(defun get_end_price (product)
; Функция получения конечной стоимости 1 типа продуктов
    (* (car (cdr (cdr product))) (price_with_sale product))
)

(defun sum_receipt (list sum)
; Функция для подсчета общей суммы чека
    (if (EQ NIL list)
        sum
        (sum_receipt (cdr list) (+ sum (get_end_price(car list))))
    )
)


(format t "Цена товара ~s со скидкой: ~f - ~f% = ~f ~%" (car(car receipt)) (car(cdr(cdr(cdr(car receipt))))) (car(cdr(car receipt))) (price_with_sale (car receipt)))
(format t "Цена товара ~s со скидкой: ~f - ~f% = ~f ~%" (car(car(cdr receipt))) (car(cdr(cdr(cdr(car(cdr receipt)))))) (car(cdr(car(cdr receipt)))) (price_with_sale (car(cdr receipt))))
(format t "Цена товара ~s со скидкой: ~f - ~f% = ~f ~%" (car(car(cdr(cdr receipt)))) (car(cdr(cdr(cdr(car(cdr(cdr receipt))))))) (car(cdr(car(cdr(cdr receipt))))) (price_with_sale (car(cdr(cdr receipt)))))
(format t "Общая цена покупок: ~f ~%" (sum_receipt receipt 0))