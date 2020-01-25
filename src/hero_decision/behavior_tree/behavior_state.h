//
// Created by autocar on 18-12-21.
//

#ifndef HERO_DECISION_BEHAVIOR_STATE_H
#define HERO_DECISION_BEHAVIOR_STATE_H
namespace hero_decision {
/**
 * @brief Behavior state
 */
enum class BehaviorState {
  RUNNING,   ///< Running state in process
  SUCCESS,   ///< Success state as result
  FAILURE,   ///< Failure state as result
  IDLE,      ///< Idle state, state as default or after cancellation
};
}
#endif //HERO_DECISION_BEHAVIOR_STATE_H
