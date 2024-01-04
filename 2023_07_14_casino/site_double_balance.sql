ALTER TABLE `tbl_users` MODIFY COLUMN `money` double(50, 2) NOT NULL DEFAULT 0 COMMENT '보유머니' AFTER `login_name`;
ALTER TABLE `tbl_admins` MODIFY COLUMN `money` double(50, 2) NOT NULL DEFAULT 0.00 COMMENT 'Money made by admin in & out' AFTER `maezhang_id`;
ALTER TABLE `tbl_admin_money_progress` MODIFY COLUMN `balance` double(50, 2) NULL DEFAULT NULL AFTER `admin_code`;

ALTER TABLE `tbl_admins_charge_history` 
MODIFY COLUMN `money` double(50, 2) NULL DEFAULT NULL COMMENT '충전금액' AFTER `admin_id`,
MODIFY COLUMN `charger_before` double(50, 2) NULL DEFAULT NULL AFTER `created_at`,
MODIFY COLUMN `charger_after` double(50, 2) NULL DEFAULT NULL AFTER `charger_before`,
MODIFY COLUMN `admin_before` double(50, 2) NULL DEFAULT NULL AFTER `charger_after`,
MODIFY COLUMN `admin_after` double(50, 2) NULL DEFAULT NULL AFTER `admin_before`;

ALTER TABLE `tbl_admins_discharge_history` 
MODIFY COLUMN `money` double(50, 2) NULL DEFAULT NULL AFTER `admin_id`,
MODIFY COLUMN `charger_before` double(50, 2) NULL DEFAULT NULL AFTER `type`,
MODIFY COLUMN `charger_after` double(50, 2) NULL DEFAULT NULL AFTER `charger_before`,
MODIFY COLUMN `admin_before` double(50, 2) NULL DEFAULT NULL AFTER `charger_after`,
MODIFY COLUMN `admin_after` double(50, 2) NULL DEFAULT NULL AFTER `admin_before`;

ALTER TABLE `tbl_charge_history` MODIFY COLUMN `money` double(50, 2) NOT NULL COMMENT '충전금액' AFTER `user_id`;
ALTER TABLE `tbl_discharge_history` MODIFY COLUMN `money` double(50, 2) NULL DEFAULT NULL AFTER `user_id`;

ALTER TABLE `tbl_game_history` 
MODIFY COLUMN `bet_money` double(20, 2) NOT NULL AFTER `api_type`,
MODIFY COLUMN `result_money` double(20, 2) NOT NULL AFTER `bet_money`,
MODIFY COLUMN `start_balance` double(50, 2) NOT NULL AFTER `result_money`,
MODIFY COLUMN `end_balance` double(50, 2) NOT NULL AFTER `start_balance`,
MODIFY COLUMN `called_money` double(20, 2) NULL DEFAULT NULL AFTER `is_call`;

ALTER TABLE `tbl_server_history` 
MODIFY COLUMN `chongbonsa_money` double(50, 2) NULL DEFAULT NULL COMMENT '총본사머니' AFTER `id`,
MODIFY COLUMN `agent_balance` double(50, 2) NULL DEFAULT NULL COMMENT '게임알' AFTER `chongbonsa_money`,
MODIFY COLUMN `admin_money_sum` double(50, 2) NULL DEFAULT NULL AFTER `agent_balance`,
MODIFY COLUMN `user_money_sum` double(50, 2) NULL DEFAULT NULL AFTER `admin_money_sum`;

ALTER TABLE `tbl_user_money_progress` MODIFY COLUMN `balance` double(50, 2) NULL DEFAULT NULL AFTER `user_code`;