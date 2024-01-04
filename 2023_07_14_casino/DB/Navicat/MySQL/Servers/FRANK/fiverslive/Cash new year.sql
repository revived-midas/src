DELETE FROM `payments` where `status` = 'expired' and apiAmount = 0;

SELECT  agentCode, ROUND(sum(amount), 2) amount FROM agent_pay_histories where date(createdAt) >= date("2023-12-31") GROUP BY agentCode WITH ROLLUP;

SELECT agentCode, ROUND(SUM(outcomeAmount), 2) AS amount FROM payments WHERE date(createdAt) >= date("2023-12-31") and apiAmount > 0 GROUP BY agentCode WITH ROLLUP ;

SELECT agentCode, ROUND(SUM(amount), 2) AS amount
FROM (
    (SELECT agentCode, SUM(amount) AS amount
     FROM agent_pay_histories
		 WHERE date(createdAt) >= date("2023-12-31") 
     GROUP BY agentCode)

    UNION

    (SELECT agentCode, SUM(outcomeAmount) AS amount
     FROM payments
     WHERE apiAmount > 0 
		 AND date(createdAt) >= date("2023-12-31") 
     GROUP BY agentCode)
) AS tbl
GROUP BY agentCode WITH ROLLUP;