SELECT CONCAT('INSERT INTO users (prd_id, provider_code, game_code, game_name_ko, game_name_en, icon_url, base_rtp, game_status, display_type, display_order, popularity) VALUES (201, "PRAGMATIC", "', gameCode, '","', koName, '","', enName, '","', banner, '",', 80, ',', status, ',', status, ',', id, ',0);') FROM games where id > 272;