(defun mul(x y)
    (if (> y 0)
	(if (= y 1)
            x
	    (+ x (mul x (- y 1)))
        )
        (if (= y -1)
	    (- 0 x)
	    (+ (- 0 x) (mul x (+ y 1)))
        )
    )
)


(print (mul -2 -8))
