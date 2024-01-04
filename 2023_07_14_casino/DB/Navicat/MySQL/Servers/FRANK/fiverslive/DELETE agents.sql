SET @code = 'xxx';

-- DELETE FROM agents where FIND_IN_SET(agentCode, @code);
DELETE FROM agent_balance_histories where FIND_IN_SET(agentCode, @code);
DELETE FROM agent_balance_progresses where FIND_IN_SET(agentCode, @code);
DELETE FROM agent_login_histories where FIND_IN_SET(agentCode, @code);
DELETE FROM agent_transactions where FIND_IN_SET(agentCode, @code);
DELETE FROM calls where FIND_IN_SET(agentCode, @code);
DELETE FROM live_game_transactions where FIND_IN_SET(agentCode, @code);
DELETE FROM slot_game_transactions where FIND_IN_SET(agentCode, @code);
DELETE FROM players where FIND_IN_SET(agentCode, @code);
DELETE FROM slot_game_transactions where FIND_IN_SET(agentCode, @code);
DELETE FROM user_balance_progresses where FIND_IN_SET(agentCode, @code);
DELETE FROM user_transactions where FIND_IN_SET(agentCode, @code);
DELETE FROM users where FIND_IN_SET(agentCode, @code);