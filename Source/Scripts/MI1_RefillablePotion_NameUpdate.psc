Scriptname MI1_RefillablePotion_NameUpdate extends ReferenceAlias

MiscObject Property MI1_MiscItem_RefillableHealthPotion auto
MiscObject Property MI1_MiscItem_RefillableMagickaPotion auto
MiscObject Property MI1_MiscItem_RefillableStaminaPotion auto

MiscObject Property MI1_MiscItem_RefillableHealthPotion2 auto

GlobalVariable Property MI1_RefillableHealthPotion_Global_MaxCharges Auto
GlobalVariable Property MI1_RefillableMagickaPotion_Global_MaxCharges Auto
GlobalVariable Property MI1_RefillableStaminaPotion_Global_MaxCharges Auto

Quest Property MI1_RefillablePotion_Quest_ChargeCount Auto


Function UpdateName(MI1_RefillablePotion_ChargeCount item)

	if(item.RefillableHealthPotion_Charges != -1)
		MI1_MiscItem_RefillableHealthPotion.SetName("Refillable Health Potion ("+item.RefillableHealthPotion_Charges as int+"/"+MI1_RefillableHealthPotion_Global_MaxCharges.GetValue() as int+")")
		MI1_MiscItem_RefillableHealthPotion2.SetName("Refillable Health Potion 2 ("+item.RefillableHealthPotion_Charges as int+"/"+MI1_RefillableHealthPotion_Global_MaxCharges.GetValue() as int+")")
	endif

	if(item.RefillableMagickaPotion_Charges != -1)
		MI1_MiscItem_RefillableMagickaPotion.SetName("Refillable Magicka Potion ("+item.RefillableMagickaPotion_Charges as int+"/"+MI1_RefillableMagickaPotion_Global_MaxCharges.GetValue() as int+")")
	endif
	
	if(item.RefillableStaminaPotion_Charges != -1)
		MI1_MiscItem_RefillableStaminaPotion.SetName("Refillable Stamina Potion ("+item.RefillableStaminaPotion_Charges as int+"/"+MI1_RefillableStaminaPotion_Global_MaxCharges.GetValue() as int+")")
	endif
EndFunction

Event OnPlayerLoadGame()
    MI1_RefillablePotion_ChargeCount item = MI1_RefillablePotion_Quest_ChargeCount as MI1_RefillablePotion_ChargeCount
	UpdateName(item)
EndEvent