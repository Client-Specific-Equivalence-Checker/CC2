; SMT 2
(set-info :source "Generated by CBMC 5.10 (cbmc-5.10)")
(set-option :produce-unsat-cores true)
(set-logic QF_AUFBV)

; find_symbols
(declare-fun |goto_symex::&92;guard#1| () Bool)
; convert
(define-fun |B0| () Bool |goto_symex::&92;guard#1|)

; convert
(define-fun |B1| () Bool |goto_symex::&92;guard#1|)

; convert
(define-fun |B2| () Bool |goto_symex::&92;guard#1|)

; convert
(define-fun |B3| () Bool |goto_symex::&92;guard#1|)

; find_symbols
(declare-fun |goto_symex::&92;guard#2| () Bool)
; convert
(define-fun |B4| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2|))

; convert
(define-fun |B5| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2|))

; convert
(define-fun |B6| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2|))

; convert
(define-fun |B7| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2|))

; find_symbols
(declare-fun |goto_symex::&92;guard#3| () Bool)
; convert
(define-fun |B8| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3|))

; convert
(define-fun |B9| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3|))

; convert
(define-fun |B10| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3|))

; convert
(define-fun |B11| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3|))

; find_symbols
(declare-fun |goto_symex::&92;guard#4| () Bool)
; convert
(define-fun |B12| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3| |goto_symex::&92;guard#4|))

; convert
(define-fun |B13| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3| |goto_symex::&92;guard#4|))

; convert
(define-fun |B14| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3| |goto_symex::&92;guard#4|))

; convert
(define-fun |B15| () Bool (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3| |goto_symex::&92;guard#4|))

; convert
(define-fun |B16| () Bool (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)))

; convert
(define-fun |B17| () Bool (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)))

; convert
(define-fun |B18| () Bool (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)))

; convert
(define-fun |B19| () Bool (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)))

; convert
(define-fun |B20| () Bool (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)))

; convert
(define-fun |B21| () Bool (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)))

; convert
(define-fun |B22| () Bool (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)))

; find_symbols
(declare-fun |goto_symex::&92;guard#5| () Bool)
; convert
(define-fun |B23| () Bool (and (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)) |goto_symex::&92;guard#5|))

; set_to true (equal)
(define-fun |__CPROVER_dead_object#1| () (_ BitVec 64) (_ bv0 64))

; set_to true (equal)
(define-fun |__CPROVER_deallocated#1| () (_ BitVec 64) (_ bv0 64))

; set_to true (equal)
(define-fun |__CPROVER_malloc_is_new_array#1| () Bool false)

; set_to true (equal)
(define-fun |__CPROVER_malloc_object#1| () (_ BitVec 64) (_ bv0 64))

; set_to true (equal)
(define-fun |__CPROVER_malloc_size#1| () (_ BitVec 64) (_ bv0 64))

; set_to true (equal)
(define-fun |__CPROVER_memory_leak#1| () (_ BitVec 64) (_ bv0 64))

; set_to true (equal)
(define-fun |__CPROVER_next_thread_id#1| () (_ BitVec 64) (_ bv0 64))

; set_to true (equal)
(define-fun |__CPROVER_pipe_count#1| () (_ BitVec 32) (_ bv0 32))

; set_to true (equal)
(define-fun |__CPROVER_rounding_mode!0#1| () (_ BitVec 32) (_ bv0 32))

; set_to true (equal)
(define-fun |__CPROVER_thread_id!0#1| () (_ BitVec 64) (_ bv0 64))

; the following is a substitute for lambda i. x
(declare-fun array_of.0 () (Array (_ BitVec 64) (_ BitVec 1)))
; set_to true (equal)
(define-fun |__CPROVER_threads_exited#1| () (Array (_ BitVec 64) (_ BitVec 1)) array_of.0)

; find_symbols
(declare-fun |main::1::n!0@1#1| () (_ BitVec 32))
; set_to true (equal)
(define-fun |client::n!0@1#1| () (_ BitVec 32) |main::1::n!0@1#1|)

; find_symbols
(declare-fun |main::1::ret_new!0@1#1| () (_ BitVec 32))
; set_to true (equal)
(define-fun |client::ret_new!0@1#1| () (_ BitVec 32) |main::1::ret_new!0@1#1|)

; find_symbols
(declare-fun |main::1::ret_old!0@1#1| () (_ BitVec 32))
; set_to true (equal)
(define-fun |client::ret_old!0@1#1| () (_ BitVec 32) |main::1::ret_old!0@1#1|)

; set_to true (equal)
(define-fun |client::1::count!0@1#2| () (_ BitVec 32) (_ bv0 32))

; set_to true
(assert (= |goto_symex::&92;guard#1| (bvsge |client::n!0@1#1| (_ bv1000 32))))

; set_to true (equal)
(define-fun |client::n!0@1#2| () (_ BitVec 32) (bvsdiv |client::n!0@1#1| (_ bv1000 32)))

; set_to true (equal)
(define-fun |client::1::count!0@1#3| () (_ BitVec 32) (_ bv3 32))

; set_to true
(assert (= |goto_symex::&92;guard#2| (bvsge |client::n!0@1#2| (_ bv1000 32))))

; set_to true (equal)
(define-fun |client::n!0@1#3| () (_ BitVec 32) (bvsdiv |client::n!0@1#2| (_ bv1000 32)))

; set_to true (equal)
(define-fun |client::1::count!0@1#4| () (_ BitVec 32) (_ bv6 32))

; set_to true
(assert (= |goto_symex::&92;guard#3| (bvsge |client::n!0@1#3| (_ bv1000 32))))

; set_to true (equal)
(define-fun |client::n!0@1#4| () (_ BitVec 32) (bvsdiv |client::n!0@1#3| (_ bv1000 32)))

; set_to true (equal)
(define-fun |client::1::count!0@1#5| () (_ BitVec 32) (_ bv9 32))

; set_to true
(assert (= |goto_symex::&92;guard#4| (bvsge |client::n!0@1#4| (_ bv1000 32))))

; set_to true (equal)
(define-fun |client::n!0@1#5| () (_ BitVec 32) (bvsdiv |client::n!0@1#4| (_ bv1000 32)))

; set_to true (equal)
(define-fun |client::1::count!0@1#6| () (_ BitVec 32) (_ bv12 32))

; set_to true (equal)
(define-fun |client::n!0@1#6| () (_ BitVec 32) |client::n!0@1#4|)

; set_to true (equal)
(define-fun |client::1::count!0@1#7| () (_ BitVec 32) (_ bv9 32))

; set_to true (equal)
(define-fun |client::n!0@1#7| () (_ BitVec 32) (ite |goto_symex::&92;guard#3| |client::n!0@1#6| |client::n!0@1#3|))

; set_to true (equal)
(define-fun |client::1::count!0@1#8| () (_ BitVec 32) (ite |goto_symex::&92;guard#3| (_ bv9 32) (_ bv6 32)))

; set_to true (equal)
(define-fun |client::n!0@1#8| () (_ BitVec 32) (ite |goto_symex::&92;guard#2| |client::n!0@1#7| |client::n!0@1#2|))

; set_to true (equal)
(define-fun |client::1::count!0@1#9| () (_ BitVec 32) (ite |goto_symex::&92;guard#2| |client::1::count!0@1#8| (_ bv3 32)))

; set_to true (equal)
(define-fun |client::n!0@1#9| () (_ BitVec 32) (ite |goto_symex::&92;guard#1| |client::n!0@1#8| |client::n!0@1#1|))

; set_to true (equal)
(define-fun |client::1::count!0@1#10| () (_ BitVec 32) (ite |goto_symex::&92;guard#1| |client::1::count!0@1#9| (_ bv0 32)))

; set_to true (equal)
(define-fun |client::1::digit_old!0@1#2| () (_ BitVec 32) (bvadd |client::1::count!0@1#10| |client::ret_old!0@1#1|))

; set_to true (equal)
(define-fun |client::1::digit_new!0@1#2| () (_ BitVec 32) (bvadd |client::1::count!0@1#10| |client::ret_new!0@1#1|))

; set_to true
(assert (= |goto_symex::&92;guard#5| (not (= (bvsrem |client::n!0@1#9| (_ bv10 32)) (_ bv0 32)))))

; convert
(define-fun |B24| () Bool (= |main::1::n!0@1#1| |main::1::n!0@1#1|))

; convert
(define-fun |B25| () Bool (= |main::1::ret_new!0@1#1| |main::1::ret_new!0@1#1|))

; convert
(define-fun |B26| () Bool (= |main::1::ret_old!0@1#1| |main::1::ret_old!0@1#1|))

; find_symbols
(declare-fun |client::1::count!0@1#1| () (_ BitVec 32))
; convert
(define-fun |B27| () Bool (= |client::1::count!0@1#1| |client::1::count!0@1#1|))

; find_symbols
(declare-fun |client::1::digit_old!0@1#1| () (_ BitVec 32))
; convert
(define-fun |B28| () Bool (= |client::1::digit_old!0@1#1| |client::1::digit_old!0@1#1|))

; find_symbols
(declare-fun |client::1::digit_new!0@1#1| () (_ BitVec 32))
; convert
(define-fun |B29| () Bool (= |client::1::digit_new!0@1#1| |client::1::digit_new!0@1#1|))

; convert
(define-fun |B30| () Bool (=> (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)) (not (bvsge |client::n!0@1#9| (_ bv1000 32)))))

; convert
(define-fun |B31| () Bool (=> (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)) (and (= |client::n!0@1#9| (_ bv10 32)) (= |client::ret_new!0@1#1| (_ bv1 32)) (= |client::ret_old!0@1#1| (_ bv2 32)))))

; convert
(define-fun |B32| () Bool (=> true (not (and |goto_symex::&92;guard#1| |goto_symex::&92;guard#2| |goto_symex::&92;guard#3| |goto_symex::&92;guard#4|))))

; convert
(define-fun |B33| () Bool (=> (and true |B30| |B31|) (=> (and (or (and |goto_symex::&92;guard#1| (or (and (or (and (not |goto_symex::&92;guard#4|) |goto_symex::&92;guard#3|) (not |goto_symex::&92;guard#3|)) |goto_symex::&92;guard#2|) (not |goto_symex::&92;guard#2|))) (not |goto_symex::&92;guard#1|)) |goto_symex::&92;guard#5|) (= |client::1::digit_old!0@1#2| |client::1::digit_new!0@1#2|))))

; set_to true
(assert (or (not |B32|) (not |B33|)))

; convert
(define-fun |B34| () Bool (not (bvsge |client::n!0@1#1| (_ bv1000 32))))

; convert
(define-fun |B35| () Bool (not (bvsge |client::n!0@1#2| (_ bv1000 32))))

; convert
(define-fun |B36| () Bool (not (bvsge |client::n!0@1#3| (_ bv1000 32))))

; convert
(define-fun |B37| () Bool (not (bvsge |client::n!0@1#4| (_ bv1000 32))))

; convert
(define-fun |B38| () Bool (= (bvsrem |client::n!0@1#9| (_ bv10 32)) (_ bv0 32)))

(check-sat)

(get-unsat-core)

(exit)
; end of SMT2 file