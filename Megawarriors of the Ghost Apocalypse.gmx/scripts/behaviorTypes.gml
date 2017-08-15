#define behaviorTypes


#define testBehavior
aiMasterListGreen[0] = actionEquip
aiMasterListGreen[1] = actionDistance
aiMasterListGreen[2] = actionChase
aiMasterListGreen[3] = actionMoveRand
aiMasterListGreen[4] = actionIdle

#define carefulSoldier
aiMasterListGreen[0] = actionEquip
//aiMasterListGreen[1] = actionFollowOrder
aiMasterListGreen[1] = actionAttackCareful
aiMasterListGreen[2] = actionDistance
aiMasterListGreen[3] = actionMoveRand
aiMasterListGreen[4] = actionIdle

#define corrallingSoldier
aiMasterListGreen[0] = actionEquip
//aiMasterListGreen[1] = actionFollowOrder
aiMasterListGreen[1] = actionJoinFormation
aiMasterListGreen[2] = actionAttackCorral
aiMasterListGreen[3] = actionMoveRand
aiMasterListGreen[4] = actionIdle

#define testArcher
aiMasterListGreen[0] = actionEquip
//aiMasterListGreen[1] = actionFollowOrder
aiMasterListGreen[1] = actionAttackRanged
aiMasterListGreen[2] = actionFlee
aiMasterListGreen[3] = actionMoveRand
aiMasterListGreen[4] = actionIdle