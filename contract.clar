;; streak-tracker -- per-user check-in streak with block-based gating
;; Clarity 4

(define-data-var total-checkins uint u0)
(define-map user-streak principal { count: uint, last-block: uint })

(define-public (check-in)
  (let ((cur (default-to { count: u0, last-block: u0 } (map-get? user-streak tx-sender)))
        (now stacks-block-height))
    (let ((new-count (if (> now (get last-block cur)) (+ (get count cur) u1) (get count cur))))
      (map-set user-streak tx-sender { count: new-count, last-block: now })
      (var-set total-checkins (+ (var-get total-checkins) u1))
      (print { event: "check-in", user: tx-sender, streak: new-count })
      (ok new-count))))

(define-read-only (get-streak (user principal))
  (default-to { count: u0, last-block: u0 } (map-get? user-streak user)))

(define-read-only (total)
  (var-get total-checkins))
