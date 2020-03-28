﻿// ---------------------------------------------------------------------
// THIS FILE IS AUTO-GENERATED BY BEHAVIAC DESIGNER, SO PLEASE DON'T MODIFY IT BY YOURSELF!
// ---------------------------------------------------------------------

#ifndef _BEHAVIAC_AGENT_PROPERTIES_H_
#define _BEHAVIAC_AGENT_PROPERTIES_H_

#include "behaviac_agent_headers.h"
#include "behaviac_agent_member_visitor.h"

namespace behaviac
{
	// ---------------------------------------------------------------------
	// Delegate methods
	// ---------------------------------------------------------------------

	inline void FunctionPointer_behaviac_Agent_LogMessage(char* param0) { behaviac::Agent::LogMessage(param0); }

	inline void Set_hero_decision_Robot_ammo(Agent* self, int value) { ((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_ammo, int >() = value; };
	inline const void* Get_hero_decision_Robot_ammo(Agent* self) { return &((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_ammo, int >(); };

	inline void Set_hero_decision_Robot_combat_effective_num(Agent* self, int value) { ((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_combat_effective_num, int >() = value; };
	inline const void* Get_hero_decision_Robot_combat_effective_num(Agent* self) { return &((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_combat_effective_num, int >(); };

	inline void Set_hero_decision_Robot_combat_effectiveness(Agent* self, double value) { ((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_combat_effectiveness, double >() = value; };
	inline const void* Get_hero_decision_Robot_combat_effectiveness(Agent* self) { return &((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_combat_effectiveness, double >(); };

	inline void Set_hero_decision_Robot_health(Agent* self, int value) { ((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_health, int >() = value; };
	inline const void* Get_hero_decision_Robot_health(Agent* self) { return &((hero_decision::Robot*)self)->_Get_Property_<hero_decision::PROPERTY_TYPE_hero_decision_Robot_health, int >(); };

	inline behaviac::EBTStatus FunctionPointer_hero_decision_Robot_EngageRobot(Agent* self, behaviac::string robot_name) { return (behaviac::EBTStatus)((hero_decision::Robot*)self)->_Execute_Method_<hero_decision::METHOD_TYPE_hero_decision_Robot_EngageRobot, behaviac::EBTStatus, behaviac::string >(robot_name); }
	inline void FunctionPointer_hero_decision_Robot_Flee(Agent* self) { ((hero_decision::Robot*)self)->_Execute_Method_<hero_decision::METHOD_TYPE_hero_decision_Robot_Flee, void >(); }
	inline behaviac::EBTStatus FunctionPointer_hero_decision_Robot_GoGetBuff(Agent* self) { return (behaviac::EBTStatus)((hero_decision::Robot*)self)->_Execute_Method_<hero_decision::METHOD_TYPE_hero_decision_Robot_GoGetBuff, behaviac::EBTStatus >(); }
	inline void FunctionPointer_hero_decision_Robot_LogMessage(char* param0) { hero_decision::Robot::LogMessage(param0); }
	inline behaviac::EBTStatus FunctionPointer_hero_decision_Robot_WaitForGameStart(Agent* self) { return (behaviac::EBTStatus)((hero_decision::Robot*)self)->_Execute_Method_<hero_decision::METHOD_TYPE_hero_decision_Robot_WaitForGameStart, behaviac::EBTStatus >(); }
}
#endif // _BEHAVIAC_AGENT_PROPERTIES_H_