(deftemplate UI-state
   (slot display)
   (slot next (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
   
   (defrule system-banner ""
		  =>
  (assert (UI-state (display WelcomeMessage)
                    (next mexico)
                    (state initial)
                    (valid-answers))))




;;;-----------NAPOJE--------------





(defrule all-nighter-yes ""
(next all-nighter )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink vault ))
(assert (UI-state (display all-nighterq )
(response YES )
(valid-answers YES NO))))


(defrule animated-yes ""
(next animated )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink drink slurm ))
(assert (UI-state (display animatedq )
(response YES )
(valid-answers YES NO))))


(defrule backpack-yes ""
(next backpack )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink pepsi blue ))
(assert (UI-state (display backpackq )
(response YES )
(valid-answers YES NO))))


(defrule boost-yes ""
(next boost )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink diet coke lime ))
(assert (UI-state (display boostq )
(response YES )
(valid-answers YES NO))))


(defrule brazil-yes ""
(next brazil )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink guarana antarctica ))
(assert (UI-state (display brazilq )
(response YES )
(valid-answers YES NO))))


(defrule bubble-gum-yes ""
(next bubble-gum )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink inca kola golden kola ))
(assert (UI-state (display bubble-gumq )
(response YES )
(valid-answers YES NO))))


(defrule can-you-buy-yes ""
(next can-you-buy )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink pennsylvania dutch birch beer ))
(assert (UI-state (display can-you-buyq )
(response YES )
(valid-answers YES NO))))


(defrule cherry-yes ""
(next cherry )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink dr pepper cherry ))
(assert (UI-state (display cherryq )
(response YES )
(valid-answers YES NO))))


(defrule dirt-yes ""
(next dirt )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink jazz diet pepsi ))
(assert (UI-state (display dirtq )
(response YES )
(valid-answers YES NO))))


(defrule flux-capacitor-yes ""
(next flux-capacitor )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink tab diet cola soda ))
(assert (UI-state (display flux-capacitorq )
(response YES )
(valid-answers YES NO))))


(defrule jugalo-yes ""
(next jugalo )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink faygo rockandrye ))
(assert (UI-state (display jugaloq )
(response YES )
(valid-answers YES NO))))


(defrule mexico-yes ""
(next mexico )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink jarritos ))
(assert (UI-state (display mexicoq )
(response YES )
(valid-answers YES NO))))


(defrule boost-no ""
(next boost )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink diet barq's root beer ))
(assert (UI-state (display boostq )
(response NO )
(valid-answers YES NO))))


(defrule caffeine-no ""
(next caffeine )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink 7up lemon ))
(assert (UI-state (display caffeineq )
(response NO )
(valid-answers YES NO))))


(defrule quality-no ""
(next quality )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink aandw ))
(assert (UI-state (display qualityq )
(response NO )
(valid-answers YES NO))))


(defrule taste-no ""
(next taste )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink hansen's natural cola ))
(assert (UI-state (display tasteq )
(response NO )
(valid-answers YES NO))))


(defrule on-the-dole-yes ""
(next on-the-dole )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink safeway fruit soda ))
(assert (UI-state (display on-the-doleq )
(response YES )
(valid-answers YES NO))))


(defrule ostentatious-yes ""
(next ostentatious )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink diet rite ))
(assert (UI-state (display ostentatiousq )
(response YES )
(valid-answers YES NO))))


(defrule picnic-yes ""
(next picnic )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink sunkist ))
(assert (UI-state (display picnicq )
(response YES )
(valid-answers YES NO))))


(defrule pwn-noobs-yes ""
(next pwn-noobs )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink mountain dew code red ))
(assert (UI-state (display pwn-noobsq )
(response YES )
(valid-answers YES NO))))


(defrule simpler-no ""
(next simpler )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink dr pepper normal ))
(assert (UI-state (display simplerq )
(response NO )
(valid-answers YES NO))))


(defrule simpler-yes ""
(next simpler )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink coca cola classic ))
(assert (UI-state (display simplerq )
(response YES )
(valid-answers YES NO))))


(defrule sing-yes ""
(next sing )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink the bottom bottles ))
(assert (UI-state (display singq )
(response YES )
(valid-answers YES NO))))


(defrule tay-zonday-yes ""
(next tay-zonday )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink diet dr pepper cherry chocolate ))
(assert (UI-state (display tay-zondayq )
(response YES )
(valid-answers YES NO))))


(defrule tesco-yes ""
(next tesco )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink qibla cola ))
(assert (UI-state (display tescoq )
(response YES )
(valid-answers YES NO))))


(defrule tummy-ache-yes ""
(next tummy-ache )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink canada dry ))
(assert (UI-state (display tummy-acheq )
(response YES )
(valid-answers YES NO))))


(defrule tyler-perry-yes ""
(next tyler-perry )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink fanta orange ))
(assert (UI-state (display tyler-perryq )
(response YES )
(valid-answers YES NO))))


(defrule quality-yes ""
(next quality )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink mug root beer ))
(assert (UI-state (display qualityq )
(response YES )
(valid-answers YES NO))))


(defrule taste-yes ""
(next taste )
?state<-(UI-state)
=>
(retract ?state)
(assert(drink five bottles ))
(assert (UI-state (display tasteq )
(response YES )
(valid-answers YES NO))))





;;;------------REGULY---------------



(defrule all-nighter-no ""
(next all-nighter )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display tescoq )
(next tesco )
(response NO )
(valid-answers YES NO))))


(defrule animated-no ""
(next animated )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display jugaloq )
(next jugalo )
(response NO )
(valid-answers YES NO))))


(defrule backpack-no ""
(next backpack )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display singq )
(next sing )
(response NO )
(valid-answers YES NO))))


(defrule brazil-no ""
(next brazil )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display doleq )
(next dole )
(response NO )
(valid-answers YES NO))))


(defrule bubble-gum-no ""
(next bubble-gum )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display all-nighterq )
(next all-nighter )
(response NO )
(valid-answers YES NO))))


(defrule caffeine-yes ""
(next caffeine )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display backpackq )
(next backpack )
(response NO )
(valid-answers YES NO))))


(defrule can-you-buy-no ""
(next can-you-buy )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display tyler-perryq )
(next tyler-perry )
(response NO )
(valid-answers YES NO))))


(defrule cherry-no ""
(next cherry )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display caffeineq )
(next caffeine )
(response NO )
(valid-answers YES NO))))


(defrule dirt-no ""
(next dirt )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display tay-zondayq )
(next tay-zonday )
(response NO )
(valid-answers YES NO))))


(defrule flux-capacitor-no ""
(next flux-capacitor )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display bubblegumq)
	(next bubblegum)
	(response NO )
	(valid-answers YES NO)))
)


(defrule jugalo-no ""
(next jugalo )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display dirtq )
(next dirt )
(response NO )
(valid-answers YES NO))))


(defrule mexico-no ""
(next mexico )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display pwn-noobsq )
(next pwn-noobs )
(response NO )
(valid-answers YES NO))))


(defrule on-the-dole-no ""
(next on-the-dole )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display flux-capacitorq )
(next flux-capacitor )
(response NO )
(valid-answers YES NO))))


(defrule ostentatious-no ""
(next ostentatious )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display boostq )
(next boost )
(response NO )
(valid-answers YES NO))))


(defrule picnic-no ""
(next picnic )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display can-you-buyq )
(next can-you-buy )
(response NO )
(valid-answers YES NO))))


(defrule pwn-noobs-no ""
(next pwn-noobs )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display dietq )
(next diet )
(response NO )
(valid-answers YES NO))))


(defrule sing-no ""
(next sing )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display simplerq )
(next simpler )
(response NO )
(valid-answers YES NO))))


(defrule tay-zonday-no ""
(next tay-zonday )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display brazilq )
(next brazil )
(response NO )
(valid-answers YES NO))))


(defrule tesco-no ""
(next tesco )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display picnicq )
(next picnic )
(response NO )
(valid-answers YES NO))))


(defrule tummy-ache-no ""
(next tummy-ache )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display hfcsq )
(next hfcs )
(response NO )
(valid-answers YES NO))))


(defrule tyler-perry-no ""
(next tyler-perry )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display root-beerq )
(next root-beer )
(response NO )
(valid-answers YES NO))))


(defrule diet-yes ""
(next diet )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display ostentatiousq )
(next ostentatious )
(response YES )
(valid-answers YES NO))))


(defrule diet-no ""
(next diet )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display animatedq )
(next animated )
(response NO )
(valid-answers YES NO))))


(defrule root-beer-yes ""
(next root-beer )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display qualityq )
(next quality )
(response YES )
(valid-answers YES NO))))


(defrule root-beer-no ""
(next root-beer )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display tummy-acheq )
(next tummy-ache )
(response NO )
(valid-answers YES NO))))


(defrule hfcs-yes ""
(next hfcs )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display tasteq )
(next taste )
(response YES )
(valid-answers YES NO))))


(defrule hfcs-no ""
(next hfcs )
?state<-(UI-state)
=>
(retract ?state)
(assert (UI-state (display cherryq )
(next cherry )
(response NO )
(valid-answers YES NO))))

