;; ZakoCoin (ZAKO) - simple fungible token
;;
;; Notes:
;; - Call (initialize) once to mint the initial supply to the caller.
;; - Use (transfer amount recipient) to move tokens.
;; - Read-only getters expose balances, total supply, and metadata.

(define-fungible-token zakocoin)

(define-data-var initialized bool false)
(define-constant token-name "ZakoCoin")
(define-constant token-symbol "ZAKO")
(define-constant token-decimals u6)
(define-constant initial-supply u1000000000)

(define-public (initialize)
  (if (var-get initialized)
      (err u100)
      (begin
        (var-set initialized true)
        (ft-mint? zakocoin initial-supply tx-sender)
      )
  )
)

(define-public (transfer (amount uint) (recipient principal))
  (ft-transfer? zakocoin amount tx-sender recipient)
)

(define-read-only (get-balance (owner principal))
  (ft-get-balance zakocoin owner)
)

(define-read-only (get-total-supply)
  (ft-get-supply zakocoin)
)

(define-read-only (get-name) token-name)
(define-read-only (get-symbol) token-symbol)
(define-read-only (get-decimals) token-decimals)
