SET @code = 'araujo';
SET @newpath = '.1.';

update `users` set parentPath = @newpath where agentCode = @code;
update `agent_balance_progresses` set parentPath = @newpath where agentCode = @code;
update `user_balance_progresses` set parentPath = @newpath where agentCode = @code;
update `user_transactions` set parentPath = @newpath where agentCode = @code;
update `slot_game_transactions` set parentPath = @newpath where agentCode = @code;
update `live_game_transactions` set parentPath = @newpath where agentCode = @code;
delete from agent_transactions where agentCode = @code;

select * from users where agentCode = @code;