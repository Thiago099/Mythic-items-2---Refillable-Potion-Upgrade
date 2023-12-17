Scriptname MI1_RefillableHealthPotion2 extends ObjectReference  

Sound Property MI1_Sound_PotionUse Auto

Quest Property MI1_RefillablePotion_Quest_ChargeCount Auto
VisualEffect property MI1_VFX_Heal auto

MiscObject Property MI1_MiscItem_RefillableHealthPotion2 auto
MiscObject Property MI1_MiscItem_RefillableHealthPotion auto

MiscObject Property Gold001 Auto

GlobalVariable Property MI1_RefillableHealthPotion2_Global_Magnitude Auto
GlobalVariable Property MI1_RefillableHealthPotion_Global_MaxCharges Auto

Function UpdateName()
	MI1_RefillablePotion_ChargeCount item = MI1_RefillablePotion_Quest_ChargeCount as MI1_RefillablePotion_ChargeCount
	MI1_MiscItem_RefillableHealthPotion.SetName("Refillable Health Potion ("+item.RefillableHealthPotion_Charges as int+"/"+MI1_RefillableHealthPotion_Global_MaxCharges.GetValue() as int+")")
	MI1_MiscItem_RefillableHealthPotion2.SetName("Refillable Health Potion 2 ("+item.RefillableHealthPotion_Charges as int+"/"+MI1_RefillableHealthPotion_Global_MaxCharges.GetValue() as int+")")
EndFunction

Event OnEquipped(Actor akActor)
	MI1_RefillablePotion_ChargeCount item = MI1_RefillablePotion_Quest_ChargeCount as MI1_RefillablePotion_ChargeCount
	if item.RefillableHealthPotion_Charges > 0
		MI1_Sound_PotionUse.Play(Game.GetPlayer())
		item.RefillableHealthPotion_Charges -= 1
		MI1_VFX_Heal.Play(akActor, 2.0)
		akActor.RestoreActorValue("Health", MI1_RefillableHealthPotion2_Global_Magnitude.GetValue())
		UpdateName()
		Game.GetPlayer().AddItem(Gold001,1,true)
		Game.GetPlayer().RemoveItem(Gold001,1,true)
	endif
EndEvent
 
