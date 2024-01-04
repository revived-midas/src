SET @code = 'lucky777';

SELECT * FROM agents where agentCode = @code;
SELECT * FROM agent_balance_histories where agentCode = @code;
SELECT * FROM agent_balance_progresses where agentCode = @code;
SELECT * FROM agent_login_histories where agentCode = @code;
SELECT * FROM agent_transactions where agentCode = @code;
SELECT * FROM calls where agentCode = @code;
SELECT * FROM live_game_transactions where agentCode = @code;
SELECT * FROM players where agentCode = @code;
SELECT * FROM slot_game_transactions where agentCode = @code;
SELECT * FROM user_balance_progresses where agentCode = @code;
SELECT * FROM user_transactions where agentCode = @code;
SELECT * FROM users where agentCode = @code;