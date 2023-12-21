(deftemplate UI-state
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
   
   (defrule system-banner ""
		  =>
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))




;;;-----------NAPOJE--------------





(defrule all-nighter-yes ""
   (bubble-gum NO)
   (not(all-nighter))
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert(all-nighter))
   ;(assert(drink vault ))
   (assert (UI-state (display all-nighterq )
               (relation-asserted all-nighter)
               (response YES )
               (valid-answers YES NO))))


(defrule animated-yes ""
   ?state<-(UI-state)
   (not(animated))
   (diet NO)
=>
   (retract ?state)
   (assert (animated))
   ;(assert(drink drink slurm ))
   (assert (UI-state (display animatedq )
         (relation-asserted animated)
         (response YES )
         (valid-answers YES NO))))


(defrule backpack-yes ""
   (not (backpack) )
   (caffeine YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   ;(assert(drink pepsi blue ))
   (assert(backpack))
   (assert (UI-state (display backpackq )
   (relation-asserted backpack)
       (response YES )
      (valid-answers YES NO))))




(defrule bubble-gum-yes ""
   (not( bubble-gum) )
   (flux-capacitor NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (bubble-gum))
   ;(assert(drink inca kola golden kola ))
   (assert (UI-state (display bubble-gumq )
      (relation-asserted bubble-gum )
      (response YES )
      (valid-answers YES NO))))


(defrule can-you-buy-yes ""
   (not (can-you-buy ))
   (picnic NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert(can-you-buy))
   ;(assert(drink pennsylvania dutch birch beer ))
   (assert (UI-state (display canyoubuyq )
      (relation-asserted can-you-buy)
      (response YES )
      (valid-answers YES NO))))


(defrule cherry-yes ""
   (not (cherry ))
   (hfcs NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   ;(assert(drink dr pepper cherry ))
   (assert (cherry))
      (assert (UI-state (display cherryq )
      (relation-asserted cherry)
      (response YES )
      (valid-answers YES NO))))


(defrule dirt-yes ""
   (not(dirt))
   (juggalo NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (dirt))
   ;(assert(drink jazz diet pepsi ))
   (assert (UI-state (display dirtq )
      (relation-asserted dirt)
         (response YES )
         (valid-answers YES NO))))


(defrule flux-capacitor-yes ""
      (not (flux-capacitor) )
      (dole NO)
      ?state<-(UI-state)
=>
   (retract ?state)
   (assert (flux-capacitor))
  ; (assert(drink tab diet cola soda ))
   (assert (UI-state (display flux-capacitorq )
      (relation-asserted flux-capacitor)
      (response YES )
      (valid-answers YES NO))))


(defrule juggalo-yes ""
   (animated NO)
   (not (juggalo))
   ?state<-(UI-state)
=>
   (retract ?state)
   ;(assert(drink faygo rockandrye ))
   (assert (juggalo))
   (assert (UI-state (display jugaloq )
      (relation-asserted juggalo)
      (response YES )
      (valid-answers YES NO))))


(defrule mexico-yes ""
   ?state<-(UI-state)
   (not(mexico))
   (start)
=>
   (retract ?state)
   (assert (mexico))
   ;(assert(drink jarritos ))
   (assert (UI-state (display mexicoq )
         (relation-asserted mexico)
         (response YES )
         (valid-answers YES NO))))




(defrule caffeine-no ""
   (not (caffeine) )
   (cherry NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   ;(assert(drink 7up lemon ))
   (assert (caffeine))
   (assert (UI-state (display caffeineq )
      (relation-asserted caffeine)
      (response NO )
      (valid-answers YES NO))))


(defrule dole-yes ""
(not (dole) )
(brazil NO)
?state<-(UI-state)
=>
(retract ?state)
;(assert(drink safeway fruit soda ))
(assert (dole))
(assert (UI-state (display doleq )
      (relation-asserted dole)
      (response YES )
      (valid-answers YES NO))))


(defrule ostentatious-yes ""
   (diet YES)
   (not(ostentatious))
   ?state<-(UI-state)
=>
   (retract ?state)
   ;(assert(drink diet rite ))
   (assert(ostentatious))
   (assert (UI-state (display ostentatiousq )
      (relation-asserted ostentatious)
      (response YES )
      (valid-answers YES NO))))


(defrule picnic-yes ""
   (not (picnic) )
   (tesco NO)
   ?state<-(UI-state)
=>
   (retract ?state)
  ; (assert(drink sunkist ))
  (assert(picnic))
   (assert (UI-state (display picnicq )
      (relation-asserted picnic)
      (response YES )
      (valid-answers YES NO))))


(defrule pwn-noobs-yes ""
   (mexico NO)
   (not(pwnnoobs))
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (pwnnoobs))
   ;(assert(drink mountain dew code red ))
   (assert (UI-state (display pwn-noobsq )
         ( relation-asserted pwnnoobs)
         (response YES )
         (valid-answers YES NO))))



(defrule simpler-yes ""
   (not (simpler) )
   (sing NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (simpler))
  ; (assert(drink coca cola classic ))
   (assert (UI-state (display simplerq )
         (relation-asserted simpler)
         (response YES )
         (valid-answers YES NO))))


(defrule sing-yes ""
   (not (sing ))
   (backpack NO)
   ?state<-(UI-state)
   =>
   (retract ?state)
   (assert (sing))
   ;(assert(drink the bottom bottles ))
   (assert (UI-state (display singq )
      (relation-asserted sing)
      (response YES )
      (valid-answers YES NO))))


(defrule tay-zonday-yes ""
   (not( tay-zonday) )
   (dirt NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (tay-zonday))
   ;(assert(drink diet dr pepper cherry chocolate ))
   (assert (UI-state (display tay-zondayq )
         (relation-asserted tay-zonday)
         (response YES )
         (valid-answers YES NO))))


(defrule tesco-yes ""
   (not (tesco) )
   (all-nighter NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   ;(assert(drink qibla cola ))
   (assert(tesco))
   (assert (UI-state (display tescoq )
      (relation-asserted tesco)
      (response YES )
      (valid-answers YES NO))))


(defrule tummy-ache-yes ""
   (not (tummy-ache) )
   (root-beer NO)
   ?state<-(UI-state)
=>
(retract ?state)
  ; (assert(drink canada dry ))
  (assert (tummy-ache ))
   (assert (UI-state (display tummy-acheq )
   (relation-asserted tummy-ache )
   (response YES )
   (valid-answers YES NO))))


(defrule tyler-perry-yes ""
   (not (tyler-perry ))
   (can-you-buy NO)
?state<-(UI-state)
=>
   (retract ?state)
     ; (assert(drink fanta orange ))
     (assert (tyler-perry))
      (assert (UI-state (display tyler-perryq )
      (relation-asserted tyler-perry)
      (response YES )
      (valid-answers YES NO))))


(defrule quality-yes ""
   (not (quality ))
   (root-beer YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (quality))
   ;(assert(drink mug root beer ))
   (assert (UI-state (display qualityq )
         (relation-asserted quality)
         (response YES )
         (valid-answers YES NO))))


(defrule taste-yes ""
   (not (taste) )
   (hfcs YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (taste))
   ;(assert(drink five bottles ))
   (assert (UI-state (display tasteq )
   (relation-asserted taste)
   (response YES )
   (valid-answers YES NO))))





;;;------------REGULY---------------



;(defrule all-nighter-no ""
;(next all-nighter )
;?state<-(UI-state)
;=>
;(retract ?state)
;(assert (UI-state (display tescoq )
;(next tesco )
;(response NO )
;(valid-answers YES NO))))




(defrule brazil-no ""
   (not( brazil) )
   (tay-zonday NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert(brazil))
   (assert (UI-state (display brazilq )
      (relation-asserted brazil)
      (response NO )
      (valid-answers YES NO))))




(defrule boost ""
   (ostentatious NO)
   (not(boost))
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display boostq )
         (relation-asserted boost)
         (response NO )
         (valid-answers YES NO))))





(defrule hfcs-yes ""
   (not(hfcs ))
   (tummy-ache NO )
   ?state<-(UI-state)
=>
(retract ?state)
(assert (hfcs) )
(assert (UI-state (display hfcsq )
   (relation-asserted hfcs )
   (response NO )
   (valid-answers YES NO))))


;(defrule tyler-perry-no ""
;(next tyler-perry )
;?state<-(UI-state)
;=>
;(retract ?state)
;(assert (UI-state (display root-beerq )
;(next root-beer )
;(response NO )
;(valid-answers YES NO))))


(defrule diet-yes ""
   (pwnnoobs NO)
   (not (diet))
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert(diet))
   (assert (UI-state (display dietq )
         (relation-asserted diet)
         (response YES )
         (valid-answers YES NO))))


;(defrule diet-no ""
;   (next diet )
;   ?state<-(UI-state)
;=>
;   (retract ?state)
;   (assert (UI-state (display animatedq )
;      (next animated )
;      (response NO )
;      (valid-answers YES NO))))


(defrule root-beer-yes ""
   (not(root-beer) )
   (tyler-perry NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert(root-beer) )
   (assert (UI-state (display root-beerq )
      (relation-asserted root-beer)
      (response YES )
      (valid-answers YES NO))))


(defrule jarritos ""
   (mexico YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display jarritos)
                     (state final)))
)

(defrule forpwnnoobs ""
   (pwnnoobs YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display forpwnnoobs)
                     (state final)))
)

(defrule slurm ""
   (animated YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display slurm)
                     (state final)))
)

(defrule dietrite ""
   (ostentatious YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display dietrite)
                     (state final)))
)
(defrule dietcokelime ""
   (boost YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display dietcokelime )
                     (state final)))
)

(defrule dietbarqsrootbeer ""
   (boost NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display dietbarqsrootbeer)
                     (state final)))
)

(defrule faygo ""
   (juggalo YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display faygo)
                     (state final)))
)

(defrule jazz ""
   (dirt YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display jazz)
                     (state final)))
)

(defrule ddpcc ""
   (tay-zonday YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display ddpcc)
                     (state final)))
)

(defrule guarana ""
   (brazil YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display guarana)
                     (state final)))
)
(defrule safeway ""
   (dole YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display safeway)
                     (state final)))
)
(defrule tab ""
   (flux-capacitor YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display tab)
                     (state final)))
)
(defrule inca ""
   (bubble-gum YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display inca)
                     (state final)))
)
(defrule vault ""
   (all-nighter YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display vault)
                     (state final)))
)

(defrule qibla ""
   (tesco YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display qibla)
                     (state final)))
)

(defrule sunkist ""
   (picnic YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display sunkist)
                     (state final)))
)

(defrule pdbb ""
   (can-you-buy YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display pdbb)
                     (state final)))
)

(defrule fanta ""
   (tyler-perry YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display fanta)
                     (state final)))
)

(defrule aw ""
   (quality NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display aw)
                     (state final)))
)

(defrule drbr ""
   (quality YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display drbr)
                     (state final)))
)

(defrule canada ""
   (tummy-ache YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display canada)
                     (state final)))
)

(defrule  fivebottles  ""
   (taste YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display fivebottles )
                     (state final)))
)


(defrule  hnc ""
   (taste NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display hnc)
                     (state final)))
)

(defrule  dpc ""
   (cherry YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display dpc)
                     (state final)))
)

(defrule  sup ""
   (caffeine NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display sup)
                     (state final)))
)

(defrule  pepsiblue""
   (backpack YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display pepsiblue)
                     (state final)))
)

(defrule  ccc ""
   (simpler YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display ccc)
                     (state final)))
)

(defrule  tbb ""
   (sing YES)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display tbb)
                     (state final)))
)

(defrule  drpepper ""
   (simpler NO)
   ?state<-(UI-state)
=>
   (retract ?state)
   (assert (UI-state (display drpepper)
                     (state final)))
)