Scriptname MI1_RefillablePotion_Recharging extends activemagiceffect  

GlobalVariable Property MI1_RefillablePotion_Global_CoolDown Auto

GlobalVariable Property MI1_RefillableHealthPotion_Global_MaxCharges Auto

GlobalVariable Property MI1_RefillableMagickaPotion_Global_MaxCharges Auto

GlobalVariable Property MI1_RefillableStaminaPotion_Global_MaxCharges Auto


MiscObject Property MI1_MiscItem_RefillableHealthPotion auto
MiscObject Property MI1_MiscItem_RefillableMagickaPotion auto
MiscObject Property MI1_MiscItem_RefillableStaminaPotion auto

Quest Property MI1_RefillablePotion_Quest_ChargeCount Auto

Function UpdateName(MI1_RefillablePotion_ChargeCount item)

EndFunction

Function LoadSettings(bool force)

	MI1_RefillablePotion_ChargeCount item = MI1_RefillablePotion_Quest_ChargeCount as MI1_RefillablePotion_ChargeCount

	if force || item.RefillableHealthPotion_Charges == -1 
		item.RefillableHealthPotion_Charges = MI1_RefillableHealthPotion_Global_MaxCharges.GetValue() as int
		MI1_MiscItem_RefillableHealthPotion.SetName("Refillable Health Potion ("+item.RefillableHealthPotion_Charges as int+"/"+MI1_RefillableHealthPotion_Global_MaxCharges.GetValue() as int+")")
	endif

	if force || item.RefillableMagickaPotion_Charges == -1 
		item.RefillableMagickaPotion_Charges = MI1_RefillableMagickaPotion_Global_MaxCharges.GetValue() as int
		MI1_MiscItem_RefillableMagickaPotion.SetName("Refillable Magicka Potion ("+item.RefillableMagickaPotion_Charges as int+"/"+MI1_RefillableMagickaPotion_Global_MaxCharges.GetValue() as int+")")
	endif

	if force || item.RefillableStaminaPotion_Charges == -1 
		item.RefillableStaminaPotion_Charges = MI1_RefillableStaminaPotion_Global_MaxCharges.GetValue() as int
		MI1_MiscItem_RefillableStaminaPotion.SetName("Refillable Stamina Potion ("+item.RefillableStaminaPotion_Charges as int+"/"+MI1_RefillableStaminaPotion_Global_MaxCharges.GetValue() as int+")")
	endif

EndFunction



Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == Game.GetPlayer()
		LoadSettings(false)
		RegisterForUpdateGameTime(MI1_RefillablePotion_Global_CoolDown.Value) 
	endif
endEvent

Event OnUpdateGameTime()
	MI1_RefillablePotion_ChargeCount item = MI1_RefillablePotion_Quest_ChargeCount as MI1_RefillablePotion_ChargeCount
	LoadSettings(true)

endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
  	UnregisterForUpdateGameTime()
endEvent