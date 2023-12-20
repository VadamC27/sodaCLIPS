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
   
   (defrule determine-receiver-gender ""
	(not(receiver-gender))
	?state<-(UI-state)
    =>
	(retract ?state)
	(assert(receiver-gender))
    (assert (UI-state (display ReceiverQuestion)
                     (relation-asserted receiver-gender)
                     (response Female)
                     (valid-answers Female Male))))